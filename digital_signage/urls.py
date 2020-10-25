"""student_api URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf.urls import url
from API.routers import api_router

from rest_framework.views import APIView
from rest_framework.response import Response
from device_management.views import TokenObtainPairPatchedView
from rest_framework_simplejwt import views as jwt_views
from rest_framework.authtoken import views
from django.conf.urls.static import static
from django.conf import settings
from device_management.template_views import * 


class indexView(APIView):
    def get(self, request, *args, **kwargs):
        return Response("ok")


urlpatterns = [
    path('admin/', admin.site.urls),
    path(r'api/', include(api_router.urls)),
    path('',indexView.as_view(), name='home'),

    # JWT authentication
    path('api/token/', TokenObtainPairPatchedView.as_view()),
    path('api/token/refresh/', jwt_views.TokenRefreshView.as_view(), name='token_refresh'),

    # templates URL
    path('login', login), #TODO: accept null string as argument
    #url('^dashboard/(?P<username>[\w.@+-]+)/$', dashboard),
    url('^dashboard/$', dashboard),
    url('^anup/(?P<username>[\w.@+-]+)/$', video),
    url('^shikha/(?P<username>[\w.@+-]+)/$', device),
    url('^dudu/(?P<username>[\w.@+-]+)/$', register),
    url('^logout/(?P<username>[\w.@+-]+)/$', logout),
    url('^admins/(?P<username>[\w.@+-]+)/$', admins),
    url('^violin/(?P<username>[\w.@+-]+)/$', upload_video),
    url('^maadeuta/(?P<username>[\w.@+-]+)/$', playlist),
    
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
