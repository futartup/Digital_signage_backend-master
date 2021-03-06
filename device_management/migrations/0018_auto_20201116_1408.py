# Generated by Django 2.0.7 on 2020-11-16 14:08

import device_management.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('device_management', '0017_admin_company_logo'),
    ]

    operations = [
        migrations.AlterField(
            model_name='admin',
            name='company_logo',
            field=models.FileField(blank=True, null=True, upload_to=device_management.models.logo_directory_path),
        ),
    ]
