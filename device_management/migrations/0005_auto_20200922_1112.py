# Generated by Django 2.1.7 on 2020-09-22 11:12

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('device_management', '0004_auto_20200922_0829'),
    ]

    operations = [
        migrations.CreateModel(
            name='PlayTimeSchedule',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('uuid', models.UUIDField(default=uuid.uuid4, editable=False, unique=True)),
                ('play_from', models.DateTimeField(blank=True, null=True)),
                ('play_to', models.DateTimeField(blank=True, null=True)),
            ],
        ),
        migrations.RemoveField(
            model_name='video',
            name='device',
        ),
        migrations.RemoveField(
            model_name='video',
            name='play_from',
        ),
        migrations.RemoveField(
            model_name='video',
            name='play_to',
        ),
        migrations.AddField(
            model_name='device',
            name='video',
            field=models.ManyToManyField(blank=True, null=True, to='device_management.Video'),
        ),
        migrations.AddField(
            model_name='video',
            name='playtime',
            field=models.ManyToManyField(blank=True, null=True, to='device_management.PlayTimeSchedule'),
        ),
    ]
