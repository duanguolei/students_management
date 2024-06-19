"""
code speace
@Time    : 2024/4/1 9:44
@Author  : 泪懿:dgl
@File    : user.py
"""
from django.template import Library
from web import models
from django.urls import reverse

register=Library()


@register.inclusion_tag('inlutions/course_list.html')
def load_course_list(request):
    data_list=[]

    return {'data_list':data_list}




@register.inclusion_tag('inlutions/menu.html')
def load_mune_list(request):
    """
    设置菜单
    :param request:
    :return:
    """
    level=request.manage.level
    data_list = []
    if level==1:
        data_list=[
            {'title':'主页','url':reverse('web:student')},
            {'title':'课程管理','url':reverse('web:student_course')},
            {'title':'考勤管理','url':reverse('web:student_course_record')},
        ]
    if level==2:
        data_list=[
            {'title':'主页','url':reverse('web:teacher')},
            {'title':'课程管理','url':reverse('web:teacher_course')},
            {'title':'考勤管理','url':reverse('web:teacher_coruse_record')},
        ]
    if level==3:
        data_list=[
            {'title':'课程管理','url':reverse('web:manage_course')},
            {'title':'考勤管理','url':reverse('web:manage_course_record')},
            {'title':'教师管理','url':reverse('web:manage_teacher')},
            {'title':'学生管理','url':reverse('web:manage_student')},
        ]

    for item in data_list:

        if request.path_info.startswith(item['url']):
            item['class'] = 'active'

    return {'data_list':data_list}
