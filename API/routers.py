from rest_framework import routers
from django.urls import path
from device_management.routers import device_router


class FullRoutes(routers.DefaultRouter):
    def extend(self, router):
        self.registry.extend(router.registry)


api_router = FullRoutes()
api_router.extend(device_router)
