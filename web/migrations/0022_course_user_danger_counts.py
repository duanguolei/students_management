# Generated by Django 5.0.3 on 2024-04-05 10:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0021_student_waring_course'),
    ]

    operations = [
        migrations.AddField(
            model_name='course_user',
            name='danger_counts',
            field=models.IntegerField(default=0, verbose_name='警告次数'),
        ),
    ]
