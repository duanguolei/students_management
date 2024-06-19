# Generated by Django 5.0.3 on 2024-03-31 18:09

import django.db.models.deletion
import django.db.models.fields
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Course',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=32, verbose_name='课程名称')),
                ('desc', models.TextField(verbose_name='课程介绍')),
                ('counts', models.IntegerField(verbose_name='课程预设人数')),
                ('join_counts', models.IntegerField(verbose_name='已参加人数')),
                ('semester', models.IntegerField(choices=[(1, '第一学期'), (2, '第二学期'), (3, '第三学期'), (4, '第四学期'), (5, '第五学期'), (6, '第六学期'), (7, '第七学期'), (8, '第八学期')], verbose_name='开课学期')),
                ('week', models.CharField(help_text='输入周次: 1,2,3,6', max_length=64, verbose_name='上课周次')),
                ('day', models.CharField(help_text='(每日满10节课)输入 星期:[节数]，如:{1:[2,3,4]}', max_length=64, verbose_name='上课时间')),
                ('classroom', models.CharField(max_length=32, verbose_name='上课教室')),
                ('create_datetime', models.DateTimeField(auto_now_add=True, verbose_name='课程创建时间')),
            ],
        ),
        migrations.CreateModel(
            name='Invitesign',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sign', models.CharField(max_length=64, verbose_name='邀请码')),
                ('create_datetime', models.DateTimeField(auto_now_add=True, verbose_name='创建')),
                ('level', models.SmallIntegerField(choices=[(2, '教师'), (3, '管理员')], default=1, verbose_name='邀请级别')),
            ],
        ),
        migrations.CreateModel(
            name='Student',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=32, null=True, verbose_name='姓名')),
                ('sex', models.IntegerField(null=True, verbose_name='性别')),
                ('classes', models.CharField(max_length=32, null=True, verbose_name='班级')),
                ('college', models.CharField(max_length=32, null=True, verbose_name='学院')),
            ],
        ),
        migrations.CreateModel(
            name='Teacher',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=32, null=True, verbose_name='姓名')),
                ('sex', models.IntegerField(verbose_name='性别')),
                ('college', models.CharField(max_length=32, verbose_name='学院')),
            ],
        ),
        migrations.CreateModel(
            name='Userinfo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('idnumber', models.CharField(help_text='学号或教师号', max_length=32, unique=True, verbose_name='证件号')),
                ('mobile_phone', models.CharField(max_length=32, verbose_name='手机号')),
                ('password', models.CharField(max_length=32, verbose_name='密码')),
                ('level', models.SmallIntegerField(choices=[(1, '学生'), (2, '教师'), (3, '管理员')], default=1, verbose_name='级别')),
            ],
        ),
        migrations.CreateModel(
            name='Course_user',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('create_datetime', models.DateTimeField(auto_now_add=True, verbose_name='加入时间')),
                ('course', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='web.course', verbose_name='课程')),
                ('joiner', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='web.student', verbose_name='选课学生')),
            ],
        ),
        migrations.CreateModel(
            name='Course_cords',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sign', models.IntegerField(choices=[(1, '已签到'), (2, '未签到')], verbose_name='签到')),
                ('create_datetime', models.DateTimeField(auto_now_add=True, verbose_name='签到时间')),
                ('course_sign', models.ForeignKey(null=True, on_delete=django.db.models.fields.CharField, to='web.course_cords', verbose_name='课程签到')),
                ('student', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='web.student', verbose_name='学生')),
            ],
        ),
        migrations.CreateModel(
            name='Course_Sign',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('create_datetime', models.DateTimeField(auto_now_add=True, verbose_name='签到时间')),
                ('end_datetime', models.DateTimeField(auto_now_add=True, verbose_name='结束时间')),
                ('sign_counts', models.IntegerField(verbose_name='签到人数')),
                ('loaction', models.CharField(max_length=32, verbose_name='签到地点')),
                ('distance', models.IntegerField(help_text='半径(m)', verbose_name='签到距离')),
                ('creator', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='web.teacher', verbose_name='发起教师')),
            ],
        ),
        migrations.AddField(
            model_name='course',
            name='teacher',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='web.teacher', verbose_name='授课老师'),
        ),
        migrations.AddField(
            model_name='teacher',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='web.userinfo', verbose_name='教师'),
        ),
        migrations.AddField(
            model_name='student',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='web.userinfo', verbose_name='学生'),
        ),
    ]
