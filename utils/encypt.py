"""
code speace
@Time    : 2024/3/31 17:55
@Author  : 泪懿:dgl
@File    : encypt.py
"""
import hashlib
from django.conf import settings

def md5(string:str):
    hashlib_object=hashlib.md5(settings.SECRET_KEY.encode('utf-8'))
    hashlib_object.update(string.encode('utf-8'))
    return hashlib_object.hexdigest()

