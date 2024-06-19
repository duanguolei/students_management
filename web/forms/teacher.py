"""
code speace
@Time    : 2024/4/1 11:27
@Author  : 泪懿:dgl
@File    : teacher.py
"""
from django import forms
from web import models
from .bookstrap import BootStrapForm
from django.core.validators import RegexValidator
from django.core.exceptions import ValidationError
from django.db.models import Q

class TeacherFrom(BootStrapForm,forms.ModelForm):

    class Meta:
        exclude=['user']
        model=models.Teacher

class CourseModelForm(BootStrapForm,forms.ModelForm):

    class Meta:
        exclude=['teacher','join_counts']
        model=models.Course





