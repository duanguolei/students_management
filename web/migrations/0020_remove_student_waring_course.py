# Generated by Django 5.0.3 on 2024-04-03 23:22

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0019_alter_course_sign_course'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='student_waring',
            name='course',
        ),
    ]
