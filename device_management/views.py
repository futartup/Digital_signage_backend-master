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
from rest_framework.decorators import action


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
                return Response(
                    {"error": data_key + " not found"},
                    status=status.HTTP_422_UNPROCESSABLE_ENTITY,
                )
        success, resp = forgot_password(request.data["username"])
        if success:
            return Response(
                {"success": "check your email for verification code"},
                status=status.HTTP_200_OK,
            )
        else:
            return Response(
                {"Failed": resp}, status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )


class ConfirmForgotPasswordViewSet(ModelViewSet):
    def create(self, request, *args, **kwargs):
        data_keys = ["verification_code", "new_password", "username"]
        for data_key in data_keys:
            if data_key not in request.data:
                return Response(
                    {"error": data_key + " not found"},
                    status=status.HTTP_422_UNPROCESSABLE_ENTITY,
                )
        success, resp = confirm_forgot_password(
            request.data["username"],
            request.data["new_password"],
            request.data["verification_code"],
        )
        print(resp)
        if success:
            return Response(
                {"Success": "Password Changed successfully"}, status=status.HTTP_200_OK
            )
        else:
            return Response(
                {"Failed": resp}, status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )


class TokenObtainPairPatchedView(jwt_views.TokenObtainPairView):
    """
    Takes a set of user credentials and returns an access and refresh JSON web
    token pair to prove the authentication of those credentials.
    """

    serializer_class = TokenObtainPairPatchedSerializer


class AdminViewSet(ModelViewSet):
    queryset = Admin.objects.all()
    serializer_class = AdminSerializer
    lookup_field = "id"

    def list(self, request, *args, **kwargs):
        super_user = request.GET["query"]["superuser"]
        admin = (request.GET["query"]["admin"],)
        organization_uuid = request.GET["query"]["organization_uuid"]
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
            request.data["password"] = make_password(
                request.data["password"], None, "md5"
            )
            added_by = request.data.get("added_by", None)
            if request.GET["query"]["superuser"]:
                # request.data['topic'] = "{}/{}".format(request.data['organization_name'].replace(' ', '_'), request.data['organization_uuid'])
                request.data["topic"] = "vrquin"
            else:
                added_by_obj = Admin.objects.get(id=added_by)
                request.data["topic"] = added_by_obj.topic
                request.data["organization_name"] = added_by_obj.organization_name
                request.data["organization_uuid"] = added_by_obj.organization_uuid
                request.data["company_logo"] = added_by_obj.company_logo
            serializer = self.serializer_class(data=request.data)
            serializer.is_valid(raise_exception=True)
            obj = serializer.save()
            # if obj:
            #    subprocess.run(['mosquitto_sub -h localhost -t "{}"'.format(obj.topic)])
            return Response(serializer.data, status=status.HTTP_200_OK)
        except Exception as e:
            return Response(
                {"status": "Failed", "message": e.__str__()},
                status=status.HTTP_412_PRECONDITION_FAILED,
            )

    def partial_update(self, request, *args, **kwargs):
        obj = self.get_object()

        if request.FILES:
            data = {}
            if "company_logo" in request.FILES:
                data["company_logo"] = request.FILES.get("company_logo")
            elif "profile_pic" in request.FILES:
                data["profile_photo"] = request.FILES.get("profile_pic")
            serializer = self.get_serializer(
                instance=obj,
                data=data,
                partial=True,
            )
        else:
            serializer = self.get_serializer(
                instance=obj, data=request.data, partial=True
            )

        if serializer.is_valid(raise_exception=True):
            obj = serializer.save()
            # if request.GET["query"]["superuser"] and not request.FILES:
            #     queryset = (
            #         self.get_queryset()
            #         .filter(organization_uuid=obj.organization_uuid)
            #         .update(is_active=request.data["is_active"])
            #     )
            return Response({"status": True}, status=status.HTTP_200_OK)
        else:
            return Response(
                {"status": True}, status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )

    # def destroy(self, request, *args, **kwargs):
    #     obj = self.get_object()
    #     obj.video.clear()
    #     obj.playtime.clear()
    #     obj.delete()
    #     return Response({'status': True}, status=status.HTTP_200_OK)


class VideoViewSet(ModelViewSet):
    queryset = Video.objects.all()
    serializer_class = VideoSerializer
    lookup_field = "uuid"

    def retrieve(self, request, *args, **kwargs):
        video_uuid = kwargs.get("uuid")
        instance = self.get_object()
        serialized_data = self.serializer_class(
            instance, context={"retrieve": True, "device": True, "belongs_to": True}
        ).data
        return Response(serialized_data, status=status.HTTP_200_OK)

    def create(self, request, *args, **kwargs):
        super_user = request.GET["query"]["superuser"]
        admin = request.GET["query"]["admin"]
        organization_uuid = request.GET["query"]["organization_uuid"]

        if super_user:
            return Response(
                {"status": "success", "message": "you cannot add video"},
                status=status.HTTP_412_PRECONDITION_FAILED,
            )
        if admin:
            if request.FILES:
                try:
                    video = request.FILES.get("video")
                    thumbnail = request.FILES.get("thumbnail")
                    print(type(video), thumbnail)
                    admin = Admin.objects.get(id=request.GET["query"]["user_id"])
                    Video.objects.create(
                        video=video,
                        thumbnail=thumbnail,
                        belongs_to=admin,
                    )
                    return Response({"status": "success"}, status=status.HTTP_200_OK)
                except Exception as e:
                    print(e.__str__())
                    return Response(
                        {"status": e.__str__()},
                        status=status.HTTP_500_INTERNAL_SERVER_ERROR,
                    )
        else:
            return Response(
                {"status": "success", "message": "you cannot add video"},
                status=status.HTTP_412_PRECONDITION_FAILED,
            )

    def list(self, request, *args, **kwargs):
        super_user = request.GET["query"]["superuser"]
        if super_user:
            queryset = self.get_queryset().select_related("belongs_to").all()
        else:
            admin_id = request.GET["query"]["user_id"]
            queryset = (
                self.get_queryset()
                .select_related("belongs_to")
                .filter(belongs_to=admin_id)
            )
        serialized_data = self.serializer_class(queryset, many=True).data
        return Response(serialized_data, status=status.HTTP_200_OK)

    def partial_update(self, request, *args, **kwargs):
        super_user = request.GET["query"]["superuser"]
        admin = request.GET["query"]["admin"]
        organization_uuid = request.GET["query"]["organization_uuid"]

        if super_user:
            return Response(
                {"status": "success", "message": "you cannot add video"},
                status=status.HTTP_412_PRECONDITION_FAILED,
            )

        if admin:
            video_obj = self.get_queryset().filter(uuid=kwargs["uuid"])
            video_obj.first().playtime.all().delete()
            devices = []
            for d in request.data.get("devices"):
                devices.append(d["device_uuid"])
                device_obj = Device.objects.get(uuid=d["device_uuid"])
                device_obj.playtime.all().delete()
                playtime_obj = PlayTimeSchedule.objects.create(
                    inaday_play_from=datetime.strptime(
                        d.get("play_from", ""), "%H:%M:%S.%f"
                    ),
                    inaday_play_to=datetime.strptime(
                        d.get("play_to", ""), "%H:%M:%S.%f"
                    ),
                    play_on=d["day"],
                )
                device_obj.video.set(video_obj)
                video_obj.first().playtime.add(playtime_obj)
                device_obj.playtime.add(playtime_obj)
            publish.single(
                video_obj.first().belongs_to.topic,
                {
                    "devices": devices,
                    "message": 203,
                    "video": os.environ["HOST_NAME"] + video_obj.first().video.url,
                    "thumbnail": os.environ["HOST_NAME"]
                    + video_obj.first().thumbnail.url,
                }.__repr__(),
            )
            return Response({"status": "success"}, status=status.HTTP_200_OK)
        else:
            return Response(
                {"status": "success", "message": "you cannot add video"},
                status=status.HTTP_412_PRECONDITION_FAILED,
            )

    def destroy(self, request, *args, **kwargs):
        # NOTE: Always append slash on the API call or else it will call retrieve API
        super_user = request.GET["query"]["superuser"]
        admin = request.GET["query"]["admin"]
        organization_uuid = request.GET["query"]["organization_uuid"]
        device_uuid = request.GET.get("device_uuid", None)
        playtime_uuid = request.GET.get("playtime_uuid", None)
        video_uuid = kwargs["uuid"]
        video_obj = self.get_object()
        video_url = os.environ["HOST_NAME"] + video_obj.video.url
        if video_obj.thumbnail:
            thumbnail_url = os.environ["HOST_NAME"] + video_obj.thumbnail.url
        else:
            thumbnail_url = ""
        topic = video_obj.belongs_to.topic

        if playtime_uuid != None:
            device_obj = Device.objects.get(
                video__uuid=video_uuid, uuid=device_uuid, playtime__uuid=playtime_uuid
            )
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
            video_obj.delete()
            devices = [d.uuid.__repr__() for d in device_objs]

        # Publish message to MQTT
        if bool(devices):
            publish.single(
                topic,
                {
                    "devices": devices.__repr__(),
                    "message": 204,
                    "video": video_url,
                    "thumbnail": thumbnail_url,
                }.__repr__(),
            )
        return Response({"status": "Sucsess"}, status=status.HTTP_200_OK)


class PlayListViewSet(ModelViewSet):
    queryset = PlayList.objects.all()
    serializer_class = PlayListSerializer
    lookup_field = "uuid"

    def create_playlist(self, playlist_obj, request, *args, **kwargs):
        final_playlist_data = {}
        videos_list = request.data.get("scheduled_videos", None)
        name = request.data.get("playlist", None)
        device_uuid = request.data.get("device_uuid", None)

        if device_uuid:
            device_obj = Device.objects.get(uuid=device_uuid)
            final_playlist_data.update({"device": [device_obj.id]})
            # Change the status of device obj to true so that it is assigned
            device_obj.status = True
            device_obj.save()

        video_objs = []
        if videos_list:
            for p in videos_list:
                playlist_data = {}
                if "Z" not in p["start"]:
                    playlist_data["video_start_from"] = p["start"] + "T00:00:00Z"
                else:
                    playlist_data["video_start_from"] = p["start"]
                    playlist_data["start"] = p["start"]
                    playlist_data["end"] = p.get("end", None)
                video_obj = Video.objects.get(uuid=p["video_uuid"])
                p["video"] = video_obj.video.url
                if video_obj.thumbnail:
                    p["thumbnail"] = video_obj.thumbnail.url
                else:
                    p["thumbnail"] = ""

                # playlist_data['belongs_to__device'] = device_obj
                serializer = PlayTimeScheduleSerializer(data=playlist_data)
                serializer.is_valid(raise_exception=True)
                obj = serializer.save()
                video_obj.playtime.add(obj)
                if device_uuid:
                    device_obj.video.add(video_obj)
                video_objs.append(video_obj.id)

            final_playlist_data.update({"video": list(set(video_objs))})

        if name:
            final_playlist_data.update({"name": name})

        if playlist_obj:
            serializer = self.serializer_class(instance=playlist_obj, data=final_playlist_data, partial=True)
        else:
            final_playlist_data.update({"belongs_to": request.GET["query"]["user_id"]})
            serializer = self.serializer_class(data=final_playlist_data)
        if serializer.is_valid(raise_exception=True):
            serializer.save()

        return True

    def create(self, request, *args, **kwargs):
        if "scheduled_videos" in request.data and not bool(request.data.get("scheduled_videos")):
            return Response({"status": "Failed", "message": "You need to select some videos"},
                            status=status.HTTP_400_BAD_REQUEST)
        if "playlist_uuid" in request.data:
            playlist_obj = PlayList.objects.get(uuid=request.data.get("playlist_uuid"))
            self.create_playlist(playlist_obj, request, *args, **kwargs)
            return Response({"status": "Success"}, status=status.HTTP_200_OK)
        else:
            if self.create_playlist(None, request, *args, **kwargs):
                return Response({"status": "Success"}, status=status.HTTP_200_OK)
            return Response({"status": "Failed"}, status=status.HTTP_400_BAD_REQUEST)

    def retrieve(self, request, *args, **kwargs):
        admin_id = request.GET["query"]["user_id"]
        playlist_uuid = kwargs["uuid"]
        obj = self.get_queryset().get(uuid=playlist_uuid, belongs_to=admin_id)
        serialized_data = self.serializer_class(
            obj, context={"retrieve": True, "admin_id": admin_id}
        ).data
        return Response(serialized_data, status=status.HTTP_200_OK)

    def list(self, request, *args, **kwargs):
        admin_id = request.GET["query"]["user_id"]
        queryset = (
            self.get_queryset()
            .select_related("belongs_to")
            .filter(belongs_to=admin_id)
        )
        serialized_data = self.serializer_class(
            queryset, many=True, context={"retrieve": True}
        ).data
        return Response(serialized_data, status=status.HTTP_200_OK)

    def partial_update(self, request, *args, **kwargs):
        playlist_uuid = kwargs["uuid"]
        playlist_obj = self.get_object()
        if self.create_playlist(playlist_obj, request, *args, **kwargs):
            return Response(
                {"status": "success", "message": "updated"}, status=status.HTTP_200_OK
            )
        else:
            return Response(
                {"status": "failed", "message": "failed"}, status=status.HTTP_400_BAD_REQUEST
            )

    def destroy(self, request, *args, **kwargs):
        username = request.GET.get("username", None)
        playlist_obj = self.get_object()
        devices_uuid = [d.uuid.__str__() for d in playlist_obj.device.all()]
        devices = playlist_obj.device.clear()
        videos = playlist_obj.video.all()
        videos_list = VideoSerializer(videos, many=True).data
        for v in videos:
            v.playtime.clear()

        playlist_obj.video.clear()
        playlist_obj.delete()

        # Publish to delete the playlist from the device
        hostname = os.environ["MQTT_HOSTNAME"]
        publish.single(
            os.environ["TOPIC"],
            {
                "devices": devices_uuid,
                "message": videos_list,
                "message_code": 8000,
            }.__repr__(),
            hostname=hostname,
        )

        return Response(
            {"status": "success", "message": "Deleted"}, status=status.HTTP_200_OK
        )

    @action(detail=False, methods=['POST'])
    def schedule(self, request, *args, **kwargs):
        playlist_uuid = request.data.get("playlist_uuid", None)
        if not playlist_uuid:
            return Response(
                {"status": "failed", "message": "please send the uuid of the playlist"},
                status=status.HTTP_400_BAD_REQUEST
            )
        playlist_obj = PlayList.objects.get(uuid=playlist_uuid)
        if playlist_obj:
            videos = playlist_obj.video.all()
            devices = playlist_obj.device.all()
            # Publish the message to broker and client will pull the message
            hostname = os.environ["MQTT_HOSTNAME"]

            message = {
                "message_code": 8000,
            }
            if videos and devices:
                topic = playlist_obj.belongs_to.topic
                videos_list = [{"video": f"{request.scheme}://{request.META['HTTP_HOST']}{v.video.url}"} for v in videos]
                message.update({"devices": devices[0].uuid.__str__()})
                message.update({"message": videos_list})
                message.update({"start_date": request.data.get("start_date", datetime.now().__str__())})
                publish.single(
                    topic,
                    message.__repr__(),
                    hostname=hostname,
                )
        else:
            return Response(
                {"status": "failed", "message": "The playlist is not found in database"},
                status=status.HTTP_204_NO_CONTENT
            )
        return Response(
            {"status": "success", "message": f"Scheduled on {datetime.now()}"}, status=status.HTTP_200_OK
        )


class DeviceViewSet(ModelViewSet):
    queryset = Device.objects.all()
    serializer_class = DeviceSerializer
    lookup_field = "uuid"

    def retrieve(self, request, *args, **kwargs):
        device_obj = self.get_object()
        serialized_data = self.serializer_class(
            device_obj,
            many=False,
            context={
                "retrieve": True,
                "video_all": True,
                "device_obj": device_obj,
            },
        ).data
        return Response(serialized_data, status=status.HTTP_200_OK)

    def list(self, request=None, *args, **kwargs):
        super_user = request.GET["query"]["superuser"]
        organization_uuid = request.GET["query"]["organization_uuid"]
        if super_user:
            queryset = self.get_queryset().select_related("belongs_to").all()
        else:
            queryset = (
                self.get_queryset()
                .select_related("belongs_to")
                .filter(
                    belongs_to__organization_uuid=organization_uuid, subscribed=True
                )
            )
        serialized = self.get_serializer(queryset, many=True).data
        return Response(serialized, status=status.HTTP_200_OK)

    def create(self, request, *args, **kwargs):
        super_user = request.GET["query"]["superuser"]
        admin = request.GET["query"]["admin"]
        organization_uuid = request.GET["query"]["organization_uuid"]

        # Super user can only assign devices to company
        if super_user:
            if request.data:
                device_data = {}
                if request.FILES.get("device_image", None):
                    device_data["device_image"] = request.data.get("image")
                device_data["callback_message"] = request.data.get("message")
                device_data["name"] = request.data.get("name")

                device_data["status"] = request.data.get("status_device")

                device_data["subscribed"] = request.data.get("subscribed")
                device_data["product_id"] = request.data.get("product_id")
                device_data["version"] = request.data.get("version")
                device_data["manufacturer"] = request.data.get("manufacturer")
                device_data["model"] = request.data.get("model")
                device_data["manufacturing_data"] = request.data.get("manufacturing_data")
                device_data["warranty"] = request.data.get("warranty")
                device_data["description"] = request.data.get("description")
                print(device_data)

                admin_id = Admin.objects.get(id=int(request.data.get("belongs_to")))
            Device.objects.create(**device_data)
            return Response(
                {"status": "success", "message": "Device Created"},
                status=status.HTTP_200_OK,
            )
        else:
            return Response(
                {"status": "success", "message": "you are not allowed to add devices"},
                status=status.HTTP_422_UNPROCESSABLE_ENTITY,
            )

    def partial_update(self, request, *args, **kwargs):
        obj = self.get_object()
        serializer = self.get_serializer(instance=obj, data=request.data, partial=True)
        if serializer.is_valid(raise_exception=True):
            obj = serializer.save()
            if "subscribed" in request.data and request.data["subscribed"] == True:
                message = 201
            elif "subscribed" in request.data and request.data["subscribed"] == False:
                message = 202
            elif "status" in request.data and request.data["status"] == True:
                message = 203
            elif "status" in request.data and request.data["status"] == False:
                message = 204
            publish.single(
                obj.belongs_to.topic,
                {
                    "devices": obj.uuid.__str__(),
                    "message_code": message,
                }.__repr__(),
            )
            return Response({"status": True}, status=status.HTTP_200_OK)
        else:
            return Response(
                {"status": True}, status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )

    def destroy(self, request, *args, **kwargs):
        obj = self.get_object()
        obj.video.clear()
        obj.playtime.clear()
        obj.delete()
        return Response({"status": True}, status=status.HTTP_200_OK)


class DashboardViewSet(ModelViewSet):
    queryset = Device.objects.all()
    serializer_class = DeviceSerializer
    lookup_field = "uuid"

    def list(self, request, *args, **kwargs):
        super_user = request.GET["query"]["superuser"]
        admin = request.GET["query"]["admin"]
        user_id = request.GET["query"]["user_id"]
        organization_uuid = request.GET["query"]["organization_uuid"]

        if super_user:
            devices = self.get_queryset().count()
            videos = Video.objects.all().count()
            users = Admin.objects.all().count()
        elif admin:
            devices = self.get_queryset().filter(belongs_to=admin).count()
            videos = Video.objects.filter(belongs_to=user_id).count()
            users = Admin.objects.filter(organization_uuid=organization_uuid).count()

        return Response({"status": "success", "data": {"devices": devices, "users": users, "videos": videos}},
                        status=status.HTTP_200_OK)
