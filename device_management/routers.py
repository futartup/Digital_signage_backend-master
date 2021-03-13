from rest_framework import routers
from .views import *


device_router = routers.DefaultRouter()
#device_router.register(r'login', LoginViewSet, basename="login")
device_router.register(r'signup', AdminViewSet)
device_router.register(r'users', AdminViewSet)
device_router.register(r'device', DeviceViewSet)
device_router.register(r'video', VideoViewSet)
device_router.register(r'playlist', PlayListViewSet)
device_router.register(r'dashboard', DashboardViewSet)
device_router.register(r'about', AboutViewSet)
