# Generated by Django 5.0.3 on 2024-04-01 16:15

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0008_remove_course_desc'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='course',
            name='day',
        ),
        migrations.RemoveField(
            model_name='course',
            name='semester',
        ),
        migrations.RemoveField(
            model_name='course',
            name='week',
        ),
    ]
