import os
import jwt
import uuid
import subprocess
from datetime import datetime
from rest_framework.viewsets import ModelViewSet
from django.http import JsonResponse
from rest_framework import status
from rest_framework.response import Response
from django.contrib.auth.hashers import make_password
from django.db.models import Q
from rest_framework_simplejwt import views as jwt_views
from itertools import islice
from django.contrib.auth.hashers import make_password
from django.core.cache import cache


# MQTT imports
import paho.mqtt.client as mqtt
import paho.mqtt.publish as publish
from digital_signage.mqtt.callbacks import *

# app imports
from .models import *
from .serializers import *



class ForgotPasswordViewSet(ModelViewSet):
    def create(self, request, *args, **kwargs):
        data_keys = ["username"]
        for data_key in data_keys:
            if data_key not in request.data:
                return Response({'error': data_key + " not found"},
                                status=status.HTTP_422_UNPROCESSABLE_ENTITY)
        success, resp = forgot_password(request.data['username'])
        if success:
            return Response({"success": "check your email for verification code"},
                            status=status.HTTP_200_OK)
        else:
            return Response({"Failed": resp}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


class ConfirmForgotPasswordViewSet(ModelViewSet):
    def create(self, request, *args, **kwargs):
        data_keys = ['verification_code', 'new_password', 'username']
        for data_key in data_keys:
            if data_key not in request.data:
                return Response({'error': data_key + " not found"},
                                status=status.HTTP_422_UNPROCESSABLE_ENTITY)
        success, resp = confirm_forgot_password(request.data['username'],
                                                request.data['new_password'],
                                                request.data['verification_code'])
        print(resp)
        if success:
            return Response({"Success": "Password Changed successfully"},status=status.HTTP_200_OK)
        else:
            return Response({"Failed": resp}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


class TokenObtainPairPatchedView(jwt_views.TokenObtainPairView):
    """
    Takes a set of user credentials and returns an access and refresh JSON web
    token pair to prove the authentication of those credentials.
    """
    serializer_class = TokenObtainPairPatchedSerializer


class AdminViewSet(ModelViewSet):
    queryset =  Admin.objects.all()
    serializer_class = AdminSerializer
    lookup_field = 'uuid'

    def list(self, request, *args, **kwargs):
        super_user = request.GET['query']['superuser']
        admin = request.GET['query']['admin'],
        organization_uuid = request.GET['query']['organization_uuid']
        query_filter = {}

        if super_user:
            # Return all the users of a company
            queryset = self.get_queryset().filter(is_staff=True) 
        elif admin:
            # Return all the admin and staff of the company
            queryset = self.get_queryset().filter(organization_uuid=organization_uuid)

        serialized_data = self.serializer_class(queryset, many=True).data 
        return Response(serialized_data, status=status.HTTP_200_OK)
            
    def create(self, request, *args, **kwargs):
        try:
            request.data['password'] = make_password(request.data['password'], None, 'md5')
            request.data['topic'] = "{}/{}".format(request.data['organization_name'], request.data['organization_uuid'])
            serializer = self.serializer_class(data=request.data)
            serializer.is_valid(raise_exception=True)
            obj = serializer.save()
            #if obj:
            #    subprocess.run(['mosquitto_sub -h localhost -t "{}"'.format(obj.topic)])
            return Response(serializer.data, status=status.HTTP_412_PRECONDITION_FAILED)
        except Exception as e:
            return Response({"status": "Failed", "message": e.__str__()}, status=status.HTTP_200_OK)
        

class VideoViewSet(ModelViewSet):
    queryset =  Video.objects.all()
    serializer_class = VideoSerializer
    lookup_field = 'uuid'

    def retrieve(self, request, *args, **kwargs):
        video_uuid = kwargs.get("uuid")
        instance = self.get_object()
        serialized_data = self.serializer_class(instance, context = {'retrieve': True,
                                                                     'device': True,
                                                                     'belongs_to': True}).data 
        return Response(serialized_data,
                        status=status.HTTP_200_OK)

    def create(self, request, *args, **kwargs):
        super_user = request.GET['query']['superuser']
        admin = request.GET['query']['admin']
        organization_uuid = request.GET['query']['organization_uuid']

        if super_user:
            return Response({"status": "success",
                             "message": "you cannot add video"},
                            status=status.HTTP_412_PRECONDITION_FAILED)
        
        if admin:
            if request.FILES:
                try:
                    video = request.FILES.get("video")
                    thumbnail = request.FILES.get("thumbnail")
                    print(type(video), thumbnail)
                    admin = Admin.objects.get(id=request.GET['query']['user_id'])
                    Video.objects.create(video=video, 
                                        thumbnail=thumbnail, 
                                        belongs_to=admin,
                                        )
                    return Response({"status": "success"},
                                    status=status.HTTP_200_OK)
                except Exception as e:
                    print(e.__str__())
                    return Response({"status": e.__str__()},
                                    status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        else:
            return Response({"status": "success",
                             "message": "you cannot add video"},
                            status=status.HTTP_412_PRECONDITION_FAILED)

    def list(self, request, *args, **kwargs):
        super_user = request.GET['query']['superuser']
        if super_user:
            queryset = self.get_queryset().select_related("belongs_to").all()
        else:
            admin_id = request.GET['query']['user_id']
            queryset = self.get_queryset().select_related("belongs_to").filter(belongs_to=admin_id)
        serialized_data = self.serializer_class(queryset, many=True).data
        return Response(serialized_data, status=status.HTTP_200_OK)

    def partial_update(self, request, *args, **kwargs):
        super_user = request.GET['query']['superuser']
        admin = request.GET['query']['admin']
        organization_uuid = request.GET['query']['organization_uuid']

        if super_user:
            return Response({"status": "success",
                             "message": "you cannot add video"},
                            status=status.HTTP_412_PRECONDITION_FAILED)

        if admin:
            video_obj = self.get_queryset().filter(uuid=kwargs['uuid'])
            video_obj.first().playtime.all().delete()
            devices = []
            for d in request.data.get('devices'):
                devices.append(d['device_uuid'])
                device_obj = Device.objects.get(uuid=d['device_uuid'])
                device_obj.playtime.all().delete()
                playtime_obj = PlayTimeSchedule.objects.create(inaday_play_from=datetime.strptime(d.get('play_from', ''), '%H:%M:%S.%f'),
                                     inaday_play_to=datetime.strptime(d.get('play_to',''), '%H:%M:%S.%f'),
                                     play_on=d['day'],
                                     )
                device_obj.video.set(video_obj)
                video_obj.first().playtime.add(playtime_obj)
                device_obj.playtime.add(playtime_obj)
            print(video_obj.first().belongs_to.topic)
            publish.single(video_obj.first().belongs_to.topic, 
                    {"devices": devices, 
                    "message": 203,
                    "video": os.environ['HOST_NAME']+ video_obj.first().video.url,
                    "thumbnail": os.environ['HOST_NAME'] + video_obj.first().thumbnail.url}.__repr__())
            return Response({"status": "success"}, status=status.HTTP_200_OK)
        else:
            return Response({"status": "success",
                             "message": "you cannot add video"},
                            status=status.HTTP_412_PRECONDITION_FAILED)

    def destroy(self, request, *args, **kwargs):
        # NOTE: Always append slash on the API call or else it will call retrieve API
        super_user = request.GET['query']['superuser']
        admin = request.GET['query']['admin']
        organization_uuid = request.GET['query']['organization_uuid']
        device_uuid = request.GET.get('device_uuid', None)
        playtime_uuid = request.GET.get('playtime_uuid', None)
        video_uuid = kwargs['uuid']
        video_obj = self.get_object()
        video_url = os.environ['HOST_NAME']+ video_obj.video.url
        thumbnail_url = os.environ['HOST_NAME'] + video_obj.thumbnail.url
        topic = video_obj.belongs_to.topic

        if playtime_uuid != None:
            device_obj = Device.objects.get(video__uuid=video_uuid, uuid=device_uuid, playtime__uuid=playtime_uuid)
            playtime_obj = PlayTimeSchedule.objects.get(uuid=playtime_uuid)
            video_obj.playtime.remove(playtime_obj)
            device_obj.playtime.remove(playtime_obj)
            device_obj.video.remove(video_obj)
            devices = [device_obj.uuid.__repr__()]
        elif device_uuid != None:
            device_obj = Device.objects.get(video__uuid=video_uuid, uuid=device_uuid)
            video_obj.playtime.clear()
            device_obj.playtime.clear()
            device_obj.video.remove(video_obj)
            devices = [device_obj.uuid.__repr__()]
        else:
            device_objs = Device.objects.filter(video__uuid=video_uuid)
            video_obj.playtime.clear()
            for d in device_objs:
                d.playtime.clear()
                d.video.remove(video_obj)
            devices = [d.uuid.__repr__() for d in device_objs]

        # Publish message to MQTT
        if bool(devices):
            publish.single(topic, 
                        {"devices": devices.__repr__(), 
                        "message": 204,
                        "video": video_url,
                        "thumbnail": thumbnail_url}.__repr__())
        return Response({"status": "Sucsess"},
                        status=status.HTTP_200_OK)
    

class PlayListViewSet(ModelViewSet):
    queryset =  PlayList.objects.all()
    serializer_class = PlayListSerializer
    lookup_field = 'uuid'

    def create_playlist(self, request, *args, **kwargs):
        #import pdb; pdb.set_trace();
        videos_list = json.loads(request.data.get("scheduled_videos"))
        name = request.data.get("playlist")
        device_uuid = request.data.get("device_uuid")
        device_obj = Device.objects.get(uuid=device_uuid)
        if kwargs['from_cache']:
            admin_id = cache.get(kwargs['username'])['id']
        else:
            admin_id = request.GET['query']['user_id']

        video_objs = []
        for p in videos_list:
            playlist_data = {}
            if 'Z' not in p['start']:
                playlist_data['video_start_from'] = p['start'] + 'T00:00:00Z'
            else:
                playlist_data['video_start_from'] = p['start']
                playlist_data['start'] = p['start']
                playlist_data['end'] = p.get('end', None)
            video_id = int(p['title'].replace("\n", ""))
            video_obj = Video.objects.get(id=video_id) 
            p['video'] = video_obj.video.url
            p['thumbnail'] = video_obj.thumbnail.url
            
            #playlist_data['belongs_to__device'] = device_obj 
            serializer = PlayTimeScheduleSerializer(data=playlist_data)
            serializer.is_valid(raise_exception=True)
            obj = serializer.save()
            video_obj.playtime.add(obj)
            device_obj.video.add(video_obj)
            video_objs.append(video_obj.id)

        
        # will save the playlist now
        playlist_data = {
            'name': name,
            'belongs_to': admin_id,
            'device': [device_obj.id],
            'video': list(set(video_objs)),
        }
        serializer = self.serializer_class(data=playlist_data)
        serializer.is_valid(raise_exception=True)
        obj = serializer.save()

        # Change the status of device obj to true so that it is assigned
        device_obj.status = True
        device_obj.save()

        # Publish the message to broker and client will pull the message
        hostname = os.environ['MQTT_HOSTNAME']    
        topic = device_obj.belongs_to.topic
        publish.single(topic, {"devices": device_obj.uuid.__str__(), 
                               "message": videos_list,
                               "message_code": 8000,}.__repr__(),                                
                               hostname=hostname)
        return True

    def retrieve(self, request, *args, **kwargs):
        admin_id = request.GET['query']['user_id']
        playlist_uuid = kwargs['uuid']
        obj = self.get_queryset().get(uuid=playlist_uuid, belongs_to=admin_id)
        serialized_data = self.serializer_class(obj, context={"retrieve": True,
                                                              "admin_id": admin_id}).data
        return Response(serialized_data, status=status.HTTP_200_OK)

    def list(self, request, *args, **kwargs):
        username = request.GET.get("username", None)
        if username:
            if cache.get(username):
                # Will create the magic now
                admin_id = cache.get(username)['id']
        queryset = self.get_queryset().select_related("belongs_to").filter(belongs_to=admin_id)
        serialized_data = self.serializer_class(queryset, many=True, context={"retrieve": True}).data 
        return Response(serialized_data, status=status.HTTP_200_OK)

    def create(self, request, *args, **kwargs):
        username = request.GET.get("username", None)
        if username:
            if cache.get(username):
                # Will create the magic now
                kwargs['from_cache'] = True
                kwargs['username'] = username
                result = self.create_playlist(request, *args, **kwargs)
            else:
                return Response({"status": "failed", "message": "unauthorized"}, status=status.HTTP_401_UNAUTHORIZED)
        else:
            if 'query' in request.GET:
                kwargs['from_cache'] = False
                result = self.create_playlist(request, *args, **kwargs)
            else:
                return Response({"status": "failed", "message": "unauthorized"}, status=status.HTTP_401_UNAUTHORIZED)
        return Response({"status": "success", "message": "created"}, status=status.HTTP_200_OK)
        
    def destroy(self, request, *args, **kwargs):
        username = request.GET.get("username", None)
        playlist_obj = self.get_object()
        devices = playlist_obj.device.all()
        for d in devices:
            d.status = False 
            d.save()
        devices = playlist_obj.device.clear()
        videos = playlist_obj.video.all()
        for v in videos:
            v.playtime.clear()
        playlist_obj.delete()
        return Response({"status": "success", "message": "Deleted"}, status=status.HTTP_200_OK)
                    

class DeviceViewSet(ModelViewSet):
    queryset =  Device.objects.all()
    serializer_class = DeviceSerializer
    lookup_field = 'uuid'

    def retrieve(self, request, *args, **kwargs):
        device_obj = self.get_object()
        serialized_data = self.serializer_class(device_obj, many=False,
                                                context={
                                                    'retrieve': True,
                                                    'video_all': True,
                                                    'device_obj': device_obj,
                                                }).data
        return Response(serialized_data, status=status.HTTP_200_OK)
    
    def list(self, request=None, *args, **kwargs):
        query_filter = {}
        admin_id = request.GET['query']['user_id']
        super_user = request.GET['query']['superuser']
        admin = request.GET['query']['admin']
        organization_uuid = request.GET['query']['organization_uuid']
        if super_user:
            queryset = self.get_queryset().select_related("belongs_to").all()
        else:
            queryset = self.get_queryset().select_related("belongs_to").filter(belongs_to__organization_uuid=organization_uuid)
        final_result = [ {
            'device_name': x.name,
            'status': x.status,
            'topic': x.belongs_to.topic,
            'uuid': x.uuid,
            'added_on': x.added_on,
            'message': x.callback_message,
        } for x in queryset]
        return Response(final_result, status=status.HTTP_200_OK)

    def create(self, request, *args, **kwargs):
        super_user = request.GET['query']['superuser']
        admin = request.GET['query']['admin']
        organization_uuid = request.GET['query']['organization_uuid']

        # Super user can only assign devices to company
        if super_user:
            topic = request.data.get("topic")
            message = request.data.get("message")
            device = request.data.get("device")
            hostname = os.environ['MQTT_HOSTNAME']
            admin_id = Admin.objects.get(id=request.data.get("belongs_to"))
            Device.objects.create(name=request.data.get("name"),
                                  belongs_to=admin_id)
            publish.single(topic, {"devices": device, "message": message}.__repr__(), hostname=hostname)
            return Response({"status": "success", "message": "published {}".format(message)},
                            status=status.HTTP_200_OK)
        else:
            return Response({"status": "success", "message": "you are not allowed to add devices"},
                            status=status.HTTP_422_UNPROCESSABLE_ENTITY)
