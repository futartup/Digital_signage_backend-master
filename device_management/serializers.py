import os
from rest_framework.serializers import ModelSerializer
from rest_framework.serializers import RelatedField
from rest_framework import serializers
from rest_framework.fields import SerializerMethodField
from django.shortcuts import get_object_or_404
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer

# MQTT imports
from digital_signage.mqtt.mqtt import mqtt

# app imports
from .models import *


class TokenObtainPairPatchedSerializer(TokenObtainPairSerializer):
    @classmethod
    def get_token(cls, user):
        token = super().get_token(user)

        # Add custom claims
        token["user"] = user.username
        token["superuser"] = user.is_superuser
        token["admin"] = user.is_staff
        token["organization_uuid"] = user.organization_uuid.__str__()
        token["is_active"] = user.is_active

        return token

    def validate(self, attrs):
        r = super(TokenObtainPairPatchedSerializer, self).validate(attrs)
        r.update(
            {
                "user": self.user.username,
                "topic": self.user.topic,
                "email": self.user.email,
                "superuser": self.user.is_superuser,
                "admin": self.user.is_staff,
                "id": self.user.id,
                "added_by": self.user.added_by.first_name,
                "organization_uuid": self.user.organization_uuid,
                "organization_name": self.user.organization_name,
            }
        )
        if self.user.company_logo:
            r.update({"company_logo": "http://103.211.218.11:8000/media/" + self.user.company_logo.__str__()})
        else:
            r.update({"company_logo": "http://103.211.218.11:8000/media/logo/default-company-logo.png"})

        if self.user.profile_photo:
            r.update({"profile_pic": "http://103.211.218.11:8000/media/" + self.user.profile_photo.__str__()})
        else:
            r.update({"profile_pic": "http://103.211.218.11:8000/media/profile/default-profile-pic.jpg"})
        return r


class AdminSerializer(ModelSerializer):
    class Meta:
        model = Admin
        fields = "__all__"

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields["company_logo"] = serializers.SerializerMethodField("_get_company_logo")
        self.fields["profile_photo"] = serializers.SerializerMethodField("_get_profile_photo")

    def _get_company_logo(self, instance):
        request = self.context.get("request")
        if instance.company_logo:
            return f"{request.scheme}://{request.META['HTTP_HOST']}/media/{instance.company_logo}"
        else:
            return f"{request.scheme}://{request.META['HTTP_HOST']}/media/logo/default-company-logo.png"

    def _get_profile_photo(self, instance):
        request = self.context.get("request")
        if instance.profile_photo:
            return f"{request.scheme}://{request.META['HTTP_HOST']}/media/{instance.profile_photo}"
        else:
            return f"{request.scheme}://{request.META['HTTP_HOST']}/media/profile/default-profile-pic.jpg"


class PlayTimeScheduleSerializer(ModelSerializer):
    class Meta:
        model = PlayTimeSchedule
        fields = "__all__"


class DeviceSerializer(ModelSerializer):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if "retrieve" in self.context:
            if "video_obj" in self.context:
                self.fields["playtime"] = serializers.SerializerMethodField(
                    "_get_playtime"
                )
            if "video_all" in self.context:
                self.fields["video"] = serializers.SerializerMethodField("_get_video")
        self.fields["device_image"] = serializers.SerializerMethodField("_get_device_image")

    def _get_device_image(self, instance):
        request = self.context.get("request")
        if instance.device_image:
            return f"{request.scheme}://{request.META['HTTP_HOST']}/media/{instance.device_image}"
        else:
            return f"{request.scheme}://{request.META['HTTP_HOST']}/media/logo/default-company-logo.png"

    def _get_video(self, obj):
        video_objs = obj.video.all()
        serialized_data = VideoSerializer(
            video_objs,
            many=True,
            context={
                "playtime": True,
                "device_obj": self.context.get("device_obj"),
            },
        ).data
        return serialized_data

    def _get_playtime(self, obj):
        playtime_objs = obj.playtime.all()
        serialized_data = PlayTimeScheduleSerializer(playtime_objs, many=True).data
        return serialized_data

    class Meta:
        model = Device
        fields = "__all__"


class VideoSerializer(ModelSerializer):
    video = serializers.SerializerMethodField("_get_video")
    thumbnail = serializers.SerializerMethodField("_get_thumbnail")

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if "retrieve" in self.context:
            self.fields["device"] = serializers.SerializerMethodField("_get_device")
            self.fields["belongs_to"] = serializers.SerializerMethodField(
                "_get_belongs_to"
            )
        if "playtime" in self.context:
            self.fields["playtime"] = serializers.SerializerMethodField("_get_playtime")

    def _get_playtime(self, obj):
        playtime_objs = PlayTimeSchedule.objects.filter(
            video__uuid=obj.uuid, device__uuid=self.context.get("device_obj").uuid
        )
        serialized_data = PlayTimeScheduleSerializer(playtime_objs, many=True).data
        return serialized_data

    def _get_video(self, obj):
        return os.environ["HOST_NAME"] + obj.video.url

    def _get_thumbnail(self, obj):
        if obj.thumbnail:
            return os.environ["HOST_NAME"] + obj.thumbnail.url
        else:
            return ''

    def _get_device(self, obj):
        device_obj = Device.objects.filter(video__id=obj.id)
        serialized_data = DeviceSerializer(
            device_obj,
            many=True,
            context={"playlist": True, "retrieve": True, "video_obj": obj},
        ).data
        return serialized_data

    def _get_belongs_to(self, obj):
        if obj.belongs_to:
            return {
                "admin": obj.belongs_to.uuid,
                "topic": obj.belongs_to.topic,
            }
        return None

    class Meta:
        model = Video
        fields = "__all__"


class VideoField(serializers.RelatedField):
    model = Video
    queryset = Video.objects.all()

    def to_internal_value(self, name):
        video = self.get_queryset().filter(id=id).first()
        if not skill:
            raise ValueError("{} is not a valid Video".format(id))
        return video


class PlayListSerializer(ModelSerializer):
    # video = serializers.ListField(child=VideoField(), write_only=True, required=False)
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if "retrieve" in self.context:
            self.fields["video"] = serializers.SerializerMethodField(read_only=True)
        elif "plain" in self.context:
            self.fields["plain_video"] = serializers.SerializerMethodField(
                read_only=True
            )

    def get_plain_video(self, instance):
        videos = instance.video.all()
        serialized_video = VideoSerializer(videos, many=True).data
        return serialized_video

    def get_video(self, instance):
        final_data = []
        videos = instance.video.all()
        # for v in videos:
        #     playtime = v.playtime.all()
        #     serialized = PlayTimeScheduleSerializer(playtime, many=True).data
        #     final_data.append(
        #         {
        #             "video_id": v.id,
        #             "thumbnail": os.environ["HOST_NAME"]
        #             + "/media/"
        #             + v.thumbnail.__str__(),
        #             "video": os.environ["HOST_NAME"] + "/media/" + v.video.__str__(),
        #             "playtime": serialized,
        #         }
        #     )
        # devices = instance.device.all()
        final_data = VideoSerializer(videos, many=True).data
        return {
            "total_video": len(videos),
            "videos": final_data,
            # "devices": DeviceSerializer(devices, many=True).data,
        }
        # admin_id = self.context.get("admin_id")
        # return [{"uuid": v.uuid,
        #        "status": v.status,
        #        "device": DeviceSerializer(v.device).data} for v in instance.video.select_related("device")]

    class Meta:
        model = PlayList
        fields = "__all__"
