# Generated by Django 2.1.7 on 2020-09-22 12:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('device_management', '0007_auto_20200922_1207'),
    ]

    operations = [
        migrations.AlterField(
            model_name='playtimeschedule',
            name='repeat',
            field=models.BooleanField(default=True),
        ),
    ]
