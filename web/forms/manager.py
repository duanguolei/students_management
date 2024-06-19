"""
code speace
@Time    : 2024/4/1 11:27
@Author  : 泪懿:dgl
@File    : manager.py
"""

from django import forms

from web import models
from .bookstrap import BootStrapForm
from django.core.validators import RegexValidator
from django.core.exceptions import ValidationError


class ManagerFrom(BootStrapForm,forms.ModelForm):

    class Meta:
        exclude=['user']
        model=models.Manager


class ManagerCoursemodelForm(BootStrapForm,forms.ModelForm):

    class Meta:
        model=models.Course
        exclude=['join_counts']










