# Generated by Django 5.0.3 on 2024-04-02 12:38

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0012_alter_course_cords_sign_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='course_cords',
            name='course_sign',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='web.course_cords', verbose_name='课程签到'),
        ),
    ]