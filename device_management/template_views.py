import os
import uuid
import json
import logging
import requests
from django.core.cache import cache
from django.conf import settings
from django.core.cache.backends.base import DEFAULT_TIMEOUT
from django.shortcuts import render, redirect
from django.core.paginator import Paginator
from requests_toolbelt.multipart.encoder import MultipartEncoder


# Model imports
from device_management.models import Admin, Video

 
CACHE_TTL = getattr(settings, 'CACHE_TTL', DEFAULT_TIMEOUT)
logger = logging.getLogger(__name__)


def login_required(function):
    def wrapper_accepting_arguments(request, username, data={}):
        if cache.get(username):
            return function(request, username, cache.get(username))
        else:
            return render(request, 'login.html')
    return wrapper_accepting_arguments


def api_call(method, url, body={}, header={}, files=None):
    url = os.environ['HOST_NAME_DJANGO_TEMPLATE'] + url
    if files:
        result = requests.request(method, url, files=files, headers=header)
    else:
        result = requests.request(method, url, data=body, headers=header)
    return result


def login(request):
    if request.method == 'POST':
        context = {}
        username = request.POST.get('username')
        password = request.POST.get('password')
        resp = api_call(request.method, '/api/token/', json.dumps({'username': username, 'password': password}), {'Content-Type': 'application/json'})
        logger.info(resp.status_code)
        
        if resp.status_code == 200:
            body = resp.json()
            # Companies call
            companies_resp = api_call('GET', '/api/users/', header={'Authorization': 'Bearer {}'.format(body['access'])})
            body['total_admins'] = len(companies_resp.json())

            # Devices call
            devices_resp = api_call('GET', '/api/device/', header={'Authorization': 'Bearer {}'.format(body['access'])})
            body['total_devices'] = len(devices_resp.json())
            body['videos_assigned_devices'] = len([x for x in devices_resp.json() if x['status'] == 'True'])

            # Videos 
            videos_resp = api_call('GET', '/api/video/', header={'Authorization': 'Bearer {}'.format(body['access'])})
            body['total_videos'] = len(videos_resp.json())

            cache.set(username, body, timeout=None)
            return render(request, 'index.html', context=body)
        else:
            return render(request, 'index.html', context={'organization_name': resp.url}) 
    return render(request, 'login.html', {'status': 'Not authorized'})


@login_required
def dashboard(request, username, data={}):
    return render(request, 'index.html', data)
    

@login_required
def video(request, username, data={}):
    # Video API call
    videos_resp = api_call('GET', '/api/video/', header={'Authorization': 'Bearer {}'.format(data['access'])})
    data['total_videos'] = len(videos_resp.json())
    data['videos'] = videos_resp.json()

    devices_resp = api_call('GET', '/api/device/', header={'Authorization': 'Bearer {}'.format(data['access'])})
    data['devices'] = devices_resp.json()
    return render(request, 'video.html', data)


@login_required
def device(request, username, data={}):
    # Devices API call
    devices_resp = api_call('GET', '/api/device/', header={'Authorization': 'Bearer {}'.format(data['access'])})
    data['total_devices'] = len(devices_resp.json())
    data['videos_assigned_devices'] = len([x for x in devices_resp.json() if x['status'] == 'True'])
    data['devices'] = devices_resp.json()
    return render(request, 'devices.html', data)


@login_required
def register(request, username, data={}):
    data['signup_success'] = False
    data['message'] = ''
    if request.method == 'POST':
        cached_user_data = cache.get(username)
        first_name = request.POST.get("first_name")
        last_name = request.POST.get("last_name")
        organization_name = request.POST.get("organization_name")
        email = request.POST.get("email")
        usernm = request.POST.get("usernm")
        password = request.POST.get("password")
        print(request.POST.get("is_staff"))
        if cached_user_data['superuser']:
            is_staff = True 
        else:
            if request.POST.get("is_staff") is None:
                is_staff = False
            else:
                is_staff = True

        added_by = cached_user_data['id']

        if cached_user_data['superuser']:
            organization_uuid = uuid.uuid4().__str__() 
        else:
            organization_uuid = Admin.objects.get(id=added_by).organization_uuid.__str__()

        # Create the request body
        body = {
            "username": usernm,
            "password": password,
            "organization_name": organization_name,
            "email": email,
            "is_staff": is_staff,
            "is_superuser": False,
            "added_by": added_by,
            "first_name": first_name,
            "last_name": last_name,
            "organization_uuid": organization_uuid
        }
        header = {
            'Authorization': 'Bearer {}'.format(data['access']),
            'Content-Type': 'application/json'
        }
        signup_resp = api_call('POST', '/api/signup/', json.dumps(body), header=header)
        data['signup_success'] = True
        if signup_resp.status_code == 200:
            data['message'] = "Successfully Created"
            data['content'] = signup_resp.json()
            # update the cache
            data['total_admins'] += 1
            cache.set(username, data)
        else:
            data['message'] = "Failed to create"
            
    return render(request, 'register.html', data)


@login_required
def logout(request, username, data={}):
    cache.delete(username)
    return render(request, 'login.html')


@login_required
def admins(request, username, data={}):
    data = cache.get(username)
    admin_resp = api_call('GET', '/api/users/', header={'Authorization': 'Bearer {}'.format(data['access'])})
    data['total_admins'] = len(admin_resp.json())
    data['admins'] = admin_resp.json()
    return render(request, 'admin.html', data)


@login_required
def upload_video(request, username, data={}):
    data = cache.get(username)
    data['video_update_status'] = False
    video = request.FILES.get('video')
    thumbnail = request.FILES.get('thumbnail')
   
    admin = Admin.objects.get(id=data['id'])
    obj, created = Video.objects.get_or_create(video=video, 
                                      thumbnail=thumbnail, 
                                      defaults={
                                         'belongs_to': admin,
                                      }
                                    )

    videos_resp = api_call('GET', '/api/video/', header={'Authorization': 'Bearer {}'.format(data['access'])})
    data['total_videos'] = len(videos_resp.json())
    data['videos'] = videos_resp.json()

    devices_resp = api_call('GET', '/api/device/', header={'Authorization': 'Bearer {}'.format(data['access'])})
    data['devices'] = devices_resp.json()

    if obj:
        data['total_videos'] += 1
        cache.set(username, data)
        data['video_update_status'] = True
        if created:
            data['video_update_status_message'] = "Successfully Uploaded Video"
        else:
            data['video_update_status_message'] = "Video already found"
        return render(request, 'video.html', data)
    data['video_update_status_message'] = resp.text
    return render(request, 'video.html', data)


@login_required
def playlist(request, username, data={}):
    data = cache.get(username)
    playlist_resp = api_call('GET', '/api/playlist/?username={}'.format(username), header={'Authorization': 'Bearer {}'.format(data['access'])})
    data['total_playlist'] = len(playlist_resp.json())
    data['playlist'] = playlist_resp.json()
    return render(request, 'playlist.html', data)
