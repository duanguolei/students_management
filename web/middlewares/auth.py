"""
code speace
@Time    : 2024/3/31 22:19
@Author  : 泪懿:dgl
@File    : auth.py
"""
class Manage(object):
    def __init__(self):
        self.user=None
        #存储用户
        self.level=None
        #储存级别
        self.idnumber=None
        #id

from django.utils.deprecation import MiddlewareMixin
from web import models
from django.conf import settings

from django.shortcuts import redirect,reverse
from django.http import HttpResponseRedirect


class AuthMiddleware(MiddlewareMixin):

    def dentity(self,request):
        """
        :param request:
        :return:
        """
        flage=False
        for url in settings.LOGIN_LIMIT_URL:

            if url in request.path_info:
                flage=True
                return flage



    def process_request(self,request):
        """
        保存每次处理请求之前的用户验证信息
        :param request:
        :return:
        """
        manage=Manage()
        userid=request.session.get('user_id',)
        level=request.session.get('level')
        request.tencentapi=settings.TENCENT_KEY


        if userid is None and self.dentity(request):
            return redirect(reverse('web:login'))


        manage.idnumber=userid
        manage.level=level



        if level==1:
            user_obj=models.Student.objects.filter(user_id=userid).first()
            if user_obj:
                manage.user = user_obj
        if level == 2:
            user_obj = models.Teacher.objects.filter(user_id=userid).first()
            if user_obj:
                manage.user = user_obj
        if level == 3:
            user_obj = models.Manager.objects.filter(user_id=userid).first()
            if user_obj:
                manage.user = user_obj

        request.manage=manage




