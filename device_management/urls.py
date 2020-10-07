from django.urls import path, include
from Student.routers import student_router

urlpatterns = [
    path('', include(student_router.urls)),
]