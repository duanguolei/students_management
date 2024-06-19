"""
code speace
@Time    : 2024/3/31 18:01
@Author  : 泪懿:dgl
@File    : base.py
"""
import django
import os

basr_dir=os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
import sys
sys.path.append(basr_dir)
os.environ.setdefault('DJANGO_SETTINGS_MODULE','students_management.settings')
django.setup()