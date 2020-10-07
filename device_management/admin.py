from __future__ import unicode_literals
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as DjangoUserAdmin
from django.utils.translation import ugettext_lazy as _
from .models import *


@admin.register(Admin)
class AdminAdmin(admin.ModelAdmin):
    """ Define admin model for custom User model with no email field """
    list_display = ('first_name',)

