# Generated by Django 5.0.3 on 2024-04-03 22:58

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0016_alter_course_sign_course'),
    ]

    operations = [
        migrations.AddField(
            model_name='student_waring',
            name='course',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='web.course', verbose_name='警告课程'),
        ),
        migrations.AlterField(
            model_name='student',
            name='classes',
            field=models.CharField(blank=True, max_length=32, null=True, verbose_name='班级'),
        ),
        migrations.AlterField(
            model_name='student',
            name='college',
            field=models.CharField(blank=True, max_length=32, null=True, verbose_name='学院'),
        ),
        migrations.AlterField(
            model_name='student',
            name='email',
            field=models.EmailField(blank=True, max_length=254, null=True, verbose_name='邮箱'),
        ),
        migrations.AlterField(
            model_name='student',
            name='sex',
            field=models.SmallIntegerField(blank=True, choices=[(1, '男'), (2, '女')], null=True, verbose_name='性别'),
        ),
        migrations.AlterField(
            model_name='teacher',
            name='college',
            field=models.CharField(blank=True, max_length=32, null=True, verbose_name='学院'),
        ),
        migrations.AlterField(
            model_name='teacher',
            name='email',
            field=models.EmailField(blank=True, max_length=254, null=True, verbose_name='邮箱'),
        ),
        migrations.AlterField(
            model_name='teacher',
            name='sex',
            field=models.SmallIntegerField(blank=True, choices=[(1, '男'), (2, '女')], null=True, verbose_name='性别'),
        ),
    ]
