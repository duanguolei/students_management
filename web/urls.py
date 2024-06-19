"""
code speace
@Time    : 2024/3/30 23:39
@Author  : 泪懿:dgl
@File    : urls.py
"""
from django.urls import re_path,path
from django.contrib import admin
from web.views import manage,student,teacher,course,manager
app_name='web'

urlpatterns = [
    re_path(r'^login/$',manage.login,name='login'),#

    re_path(r'^register/$',manage.register,name='register'),
    re_path(r'^logout/$',manage.logout,name='logout'),

    re_path(r'^user/$',manage.user,name='user'),
    re_path(r'^update_apsseord/$',manage.update_password,name='update_password'),

    re_path(r'^capth/$',manage.capth,name='capth'),
    re_path(r'^invite/(?P<sign>\w+)/$',manage.invite,name='invite'),

    re_path(r'^student/$',student.student,name='student'),
    re_path(r'^student_course/$',student.student_course,name='student_course'),
    re_path(r'^student_course_record/$',student.student_course_record,name='student_course_record'),
    re_path(r'^student_course_data/$',student.student_course_data,name='student_course_data'),
    re_path(r'^student_course_cords_data/$',student.student_course_cords_data,name='student_course_cords_data'),

    re_path(r'^teacher/$',teacher.teacher,name='teacher'),
    re_path(r'^teacher_course/$',teacher.teacher_course,name='teacher_course'),
    re_path(r'^teacher_coruse_record/$',teacher.teacher_coruse_record,name='teacher_coruse_record'),
    re_path(r'^teacher_course_data/$',teacher.teacher_course_data,name='teacher_course_data'),
    re_path(r'^teacher_course_cord_data/$',teacher.teacher_course_cord_data,name='teacher_course_cord_data'),
    re_path(r'^teacher_msg/$',teacher.teacher_msg,name='teacher_msg'),


    re_path(r'^course_data/$',course.get_course_data,name='course_data'),
    re_path(r'^deel_course/$',course.deel_course_data,name='deel_course'),
    re_path(r'^course_student/$',course.course_student,name='course_student'),
    re_path(r'^course_record_data/$',course.course_record_data,name='course_record_data'),
    re_path(r'^course_cords_student/$',course.course_cords_student,name='course_cords_student'),
    re_path(r'^course_cords_data/$',course.course_cords_data,name='course_cords_data'),
    re_path(r'^deel_course_record/$',course.deel_course_record,name='deel_course_record'),

    re_path(r'^updateform/$',course.updateform,name='updateform'),

    re_path(r'student_waring/$',course.student_waring,name='student_waring'),
    re_path(r'deel_waring/$',course.deel_waring,name='deel_waring'),
    re_path(r'student_dangers_data/$',student.student_dangers_data,name='student_dangers_data'),

    re_path(r'manage_course/$',manager.manage_course,name='manage_course'),
    re_path(r'manage_course_record/$', manager.manage_course_record, name='manage_course_record'),
    re_path(r'manage_student/$',manager.manage_student,name='manage_student'),
    re_path(r'manage_teacher/$',manager.manage_teacher,name='manage_teacher'),
    re_path(r'manage_teacher_data/$',manager.manage_teacher_data,name='manage_teacher_data'),
    re_path(r'manage_student_data/$',manager.manage_student_data,name='manage_student_data'),
    re_path(r'manage_teacher_course_data/$',manager.manage_teacher_course_data,name='manage_teacher_course_data'),
    re_path(r'manage_deel_teacher/$',manager.deel_teacher,name='deel_teacher'),
    re_path(r'manage_deel_student/$',manager.deel_student,name='deel_student'),
    re_path(r'manage_teacher_course/$',manager.manage_teacher_course,name='manage_teacher_course'),




]




