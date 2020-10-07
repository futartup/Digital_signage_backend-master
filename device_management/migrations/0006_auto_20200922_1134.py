# Generated by Django 2.1.7 on 2020-09-22 11:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('device_management', '0005_auto_20200922_1112'),
    ]

    operations = [
        migrations.CreateModel(
            name='PlayDay',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
        ),
        migrations.RenameField(
            model_name='playtimeschedule',
            old_name='play_from',
            new_name='inaday_play_from',
        ),
        migrations.RenameField(
            model_name='playtimeschedule',
            old_name='play_to',
            new_name='inaday_play_to',
        ),
        migrations.AddField(
            model_name='playtimeschedule',
            name='inaday_gap_required',
            field=models.TimeField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='playtimeschedule',
            name='repeat',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='playtimeschedule',
            name='play_on',
            field=models.ManyToManyField(blank=True, null=True, to='device_management.PlayDay'),
        ),
    ]
