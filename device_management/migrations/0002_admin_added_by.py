# Generated by Django 2.1.7 on 2020-09-22 08:04

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('device_management', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='admin',
            name='added_by',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='added_by_user', to=settings.AUTH_USER_MODEL),
        ),
    ]
