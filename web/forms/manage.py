"""
code speace
@Time    : 2024/3/31 16:52
@Author  : 泪懿:dgl
@File    : manage.py
"""
from django import forms
from web import models
from .bookstrap import BootStrapForm
from django.core.validators import RegexValidator
from django.core.exceptions import ValidationError
from django.db.models import Q

class LoginModelForm(BootStrapForm,forms.ModelForm):
    """
    登录表单
    """
    code = forms.CharField(label='验证码', widget=forms.TextInput(attrs={

    }))


    def __init__(self,request,*args,**kwargs):
        """初始化，传递request"""
        super().__init__(*args,**kwargs)
        self.request=request

    class Meta:
        #传入数据表
        model=models.Userinfo
        fields=[
            'idnumber','password','code'
        ]


    def clean_idnumber(self):
        """
        处理校验数据
        :return:
        """
        idnumber=self.cleaned_data['idnumber']
        user_obj = models.Userinfo.objects.filter(Q(idnumber=idnumber) | Q(mobile_phone=idnumber)).exists()
        if not user_obj:
            #主动添加错误
            self.add_error('idnumber','手机号或证件号不存在,')

        return idnumber

    def clean_password(self):

        idnumber = self.cleaned_data['idnumber']
        password=self.cleaned_data['password']
        user_obj = models.Userinfo.objects.filter(Q(idnumber=idnumber) | Q(mobile_phone=idnumber)).first()
        if user_obj:
            if user_obj.password!=password:
                raise ValidationError('密码错误，请重新输入')

        return password

    def clean_code(self):
        code = self.cleaned_data['code']
        #往session取验证码
        session_code = self.request.session.get('captch_code')
        if not session_code:
            raise ValidationError("验证码过期，请重新点击")
        if code.upper().strip() != session_code.upper():
            raise ValidationError("验证码输入错误")
        return code

class RegisterMOdelFrom(BootStrapForm,forms.ModelForm):
    #加入正则验证，手机号格式
    mobile_phone = forms.CharField(label='手机号', validators=[RegexValidator(r'^(1[3|4|5|6|7|8|9])\d{9}$', '手机号格式错误'), ])
    password = forms.CharField(
        label='密码',
        min_length=6,
        max_length=32,
        error_messages={
            'min_length': '密码长度不低于6个字符',
            'max_length': "密码长度不多于32个字符"
        }
    )


    comfirm_password = forms.CharField(label='再次输入密码', widget=forms.PasswordInput(

    ))

    code = forms.CharField(label='验证码')


    def __init__(self,request,*args,**kwargs):
        super().__init__(*args,**kwargs)
        self.request=request

    class Meta:
        model=models.Userinfo
        fields=['idnumber','mobile_phone','password','comfirm_password','code']

    def clean_idnumber(self):
        idnumber=self.cleaned_data['idnumber']

        if models.Userinfo.objects.filter(idnumber=idnumber).exists():
            raise ValidationError('证件号已被注册')
        return idnumber

    def clean_mobile_phone(self):
        phone=self.cleaned_data['mobile_phone']
        if models.Userinfo.objects.filter(mobile_phone=phone).exists():
            raise ValidationError('手机号已被注册')
        return phone

    def clean_comfirm_password(self):
        confilm_password = self.cleaned_data['comfirm_password']
        password = self.cleaned_data['password']
        if password != confilm_password:
            raise ValidationError("两次密码不一致，请重新输入")

    def clean_code(self):

        code = self.cleaned_data['code']

        session_code = self.request.session.get('captch_code')
        if not session_code:
            raise ValidationError("验证码过期，请重新点击")
        if code.upper().strip() != session_code.upper():
            raise ValidationError("验证码输入错误")
        return code

