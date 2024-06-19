# Generated by Django 5.0.3 on 2024-04-08 18:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0022_course_user_danger_counts'),
    ]

    operations = [
        migrations.AddField(
            model_name='course_sign',
            name='code',
            field=models.CharField(max_length=32, null=True, verbose_name='签到口令'),
        ),
        migrations.AlterField(
            model_name='course_sign',
            name='loaction',
            field=models.CharField(max_length=32, null=True, verbose_name='签到地点'),
        ),
    ]