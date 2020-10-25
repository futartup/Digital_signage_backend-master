import os
import uuid
import boto3
import random
from django.db import models
from django.contrib.auth.models import AbstractUser
from django.core.files.storage import default_storage
from botocore.client import Config
from datetime import datetime as dt
from django.contrib.auth.hashers import make_password

# Import signals
from .signals import *


class Admin(AbstractUser):
    organization_uuid = models.UUIDField(blank=True, null=True)
    uuid = models.UUIDField(default=uuid.uuid4, unique=True, editable=False)
    last_login = models.DateTimeField(null=True)
    archived_on = models.DateTimeField(null=True, blank=True)
    restored_on = models.DateTimeField(null=True, blank=True)
    organization_name = models.CharField(max_length=100, blank=True, null=True, verbose_name="Organization Name")
    topic = models.CharField(max_length=100, blank=True, null=True)
    added_by = models.ForeignKey('self', on_delete=models.PROTECT, related_name="added_by_user", blank=True, null=True)

    # def save(self, *args, **kwargs):
    #     self.password = make_password(self.password, None, 'md5')
    #     self.topic = "{}/{}".format(self.organization_name, self.organization_uuid)
    #     instance, created = super(Admin, self).save()
        #create_auth_token.send(sender=self.__class__, instance=instance, created=created)


def user_directory_path(instance, filename):
    # file will be uploaded to MEDIA_ROOT/user_<id>/<filename>
    
    file = 'user_{0}/{1}'.format(instance.belongs_to.uuid, filename).replace(" ", "_")
    if os.path.exists(os.path.join(settings.MEDIA_ROOT + '/' + os.path.join(file))):
        os.remove(os.path.join(settings.MEDIA_ROOT + '/' + os.path.join(file)))
    return 'user_{0}/{1}'.format(instance.belongs_to.uuid, filename)
  

def thumbnail_user_directory_path(instance, filename):
    # file will be uploaded to MEDIA_ROOT/thumbnails/user_<id>/<filename>
    file = 'thumbnails/user_{0}/{1}'.format(instance.belongs_to.uuid, filename).replace(" ", "_")
    if os.path.exists(os.path.join(settings.MEDIA_ROOT + '/' + os.path.join(file))):
        os.remove(os.path.join(settings.MEDIA_ROOT + '/' + os.path.join(file)))
    return 'thumbnails/user_{0}/{1}'.format(instance.belongs_to.uuid, filename)
   

class PlayTimeSchedule(models.Model):
    uuid = models.UUIDField(default=uuid.uuid4, unique=True, editable=False)
    video_start_from = models.DateTimeField(blank=True, null=True)
    start = models.DateTimeField(blank=True, null=True)
    end = models.DateTimeField(blank=True, null=True)
    repeat = models.BooleanField(default=True)

    def __str__(self):
        return "{0} have {1}".format(self.uuid, self.play_on)


class Video(models.Model):
    uuid = models.UUIDField(default=uuid.uuid4, unique=True, editable=False)
    status = models.BooleanField(default=False)
    added_on = models.DateTimeField(default=dt.now, null=True)
    removed_on = models.DateTimeField(default=dt.now, null=True)
    description = models.CharField(max_length=255, blank=True)
    video = models.FileField(upload_to=user_directory_path)
    thumbnail = models.FileField(upload_to=thumbnail_user_directory_path)
    uploaded_at = models.DateTimeField(auto_now_add=True)

    # Foreign Keys
    playtime = models.ManyToManyField(PlayTimeSchedule, blank=True, null=True)
    belongs_to = models.ForeignKey(Admin, on_delete=models.PROTECT, blank=True, null=True)


class Device(models.Model):
    uuid = models.UUIDField(default=uuid.uuid4, unique=True, editable=False)
    status = models.BooleanField(default=False)
    added_on = models.DateTimeField(default=dt.now, null=True)
    removed_on = models.DateTimeField(default=dt.now, null=True)
    modified_on = models.DateTimeField(default=dt.now, null=True)
    name = models.CharField(max_length=50, blank=True, null=True, verbose_name="Given name to the device")
    callback_message = models.CharField(max_length=50, blank=True, null=True, verbose_name="Message from device onboard")
    #device_image = models.ImageField(upload_to=thumbnail_user_directory_path)

    # Foreign Keys
    belongs_to = models.ForeignKey(Admin, on_delete=models.PROTECT, blank=True, null=True)
    video = models.ManyToManyField(Video, blank=True, null=True)
    playtime = models.ManyToManyField(PlayTimeSchedule, blank=True, null=True)

    def __str__(self):
        return "{0} have {1}".format(self.uuid, self.status)


class PlayList(models.Model):
    uuid = models.UUIDField(default=uuid.uuid4, unique=True, editable=False)
    name = models.CharField(unique=True, max_length=100, blank=True)
    added_on = models.DateTimeField(default=dt.now, null=True)
    modified_on = models.DateTimeField(default=dt.now, null=True)

    # Foreign Keys
    video = models.ManyToManyField(Video, blank=True, null=True)
    device = models.ManyToManyField(Device, blank=True, null=True)
    belongs_to = models.ForeignKey(Admin, on_delete=models.PROTECT)
