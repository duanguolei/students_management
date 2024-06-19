from django import forms
from web import models
from .bookstrap import BootStrapForm
from django.core.validators import RegexValidator
from django.core.exceptions import ValidationError
from django.db.models import Q

class StudentFrom(BootStrapForm,forms.ModelForm):
    class Meta:
        exclude=['user']#不需要，排除，和fileds相反
        model=models.Student



