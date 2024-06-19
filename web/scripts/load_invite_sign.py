"""
code speace
@Time    : 2024/3/31 18:01
@Author  : 泪懿:dgl
@File    : load_invite_sign.py
"""
import base
from utils.encypt import md5
import uuid
from web import models
from django.shortcuts import  reverse
sign=md5(str(uuid.uuid4()))

invite_object=models.Invitesign(
    sign=sign,
    level=2,
    allow_count=3,
)
invite_object.save()
url=reverse('web:invite',kwargs={'sign':sign})
print('教师邀请码:{}'.format(url))

sign=md5(str(uuid.uuid4()))

invite_object=models.Invitesign(
    sign=sign,
    level=3,
    allow_count=3
)
invite_object.save()
url=reverse('web:invite',kwargs={'sign':sign})
print('管理员邀请码:{}'.format(url))

