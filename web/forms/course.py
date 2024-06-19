"""
code speace
@Time    : 2024/4/2 9:33
@Author  : 泪懿:dgl
@File    : course.py
"""
from django import forms
from web import models
from .bookstrap import BootStrapForm
from django.core.validators import RegexValidator
from django.core.exceptions import ValidationError
from django.db.models import Q

class CourseRcordModelForm(BootStrapForm,forms.ModelForm):

    class Meta:
        model=models.Course_Sign
        exclude=['sign_counts']



class TeacherCourseRcordModelForm(CourseRcordModelForm):
    """继承父类，教师发布签到"""

    def __init__(self, request, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.fields['course'].queryset = models.Course.objects.filter(teacher=request.manage.user).all()

    class Meta(CourseRcordModelForm.Meta):

        exclude=['creator','sign_counts']



class StudentCourseRcordModelForm(CourseRcordModelForm):


    def __init__(self,ifshowcode=None,*args,**kwargs):
        super().__init__(*args, **kwargs)
        if ifshowcode:
            self.fields.pop('loaction')
        else:
            self.fields.pop('code')
    """继承父类学生签到"""

    class Meta(CourseRcordModelForm.Meta):

        exclude=[]
        fields=['loaction','code']







