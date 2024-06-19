"""
code speace
@Time    : 2024/3/31 14:26
@Author  : 泪懿:dgl
@File    : manage.py
"""
from django.shortcuts import  redirect,render,reverse
from web.forms.manage import  LoginModelForm,RegisterMOdelFrom
from utils.captacher import get_img_code
from io import BytesIO
from web import models
from django.db.models import Q
from django.http import HttpResponse,JsonResponse
from django.views.decorators.csrf import csrf_exempt
from web.forms.student import StudentFrom
from web.forms.teacher import TeacherFrom
from web.forms.manager import ManagerFrom

#csrf_exempt作用:取消csrf验证，
@csrf_exempt
def login(request):

    if request.method=='GET':

        #判断登录还是直接跳转
        level=request.manage.level
        if level == 1:
            return redirect('web:student')
        if level == 2:
            return redirect('web:teacher_course')
        if level == 3:
            return redirect('web:manage_course')

        form=LoginModelForm(request)
        return render(request,'login.html',{'form':form})

    else:
        form = LoginModelForm(request,request.POST)
        if form.is_valid():
            """
            验证clean后是否通过
            """
            idnumber=form.cleaned_data['idnumber']
            user_obj=models.Userinfo.objects.filter(Q(idnumber=idnumber)|Q(mobile_phone=idnumber)).first()
            level=user_obj.level
            #从数据库提取，保存sesssion
            request.session['user_id']=user_obj.id
            request.session['level']=level

            request.session.set_expiry(60*60*24)

            if level==1:
                student=models.Student.objects.filter(user=user_obj).first()
                if student.name=='--':
                    return JsonResponse({
                        'status': True,
                        'data': '/user/'
                    })
                return JsonResponse({
                    'status':True,
                    'data':'/student/'
                })
            if level==2:
                teacher = models.Teacher.objects.filter(user=user_obj).first()
                if  teacher.name=='--':
                    return JsonResponse({
                        'status': True,
                        'data': '/user/'
                    })
                return JsonResponse({
                    'status': True,
                    'data': '/teacher/'
                })
            if level==3:
                manager=models.Manager.objects.filter(user=user_obj).first()
                if  manager.name=='--':
                    return JsonResponse({
                        'status': True,
                        'data': '/user/'
                    })
                return JsonResponse({
                    'status': True,
                    'data': '/manage_course/'
                })



        else:
            return JsonResponse({
                'status':False,
                'error':form.errors
            })


@csrf_exempt
def register(request):
    level = request.session.get('register_level')
    sign=request.session.get('sign')
    if not level:
        level=1
    register_name = '学生'
    if level == 2:
        register_name = '教师'
    elif level == 3:
        register_name = '管理员'
    if request.method=='GET':
        form=RegisterMOdelFrom(request)
        return render(request,'register.html',{'form':form,'register_name':register_name})
    else:
        form=RegisterMOdelFrom(request,request.POST)

        if form.is_valid():
            """form.instance 数据表模型对象  models.Userinfo.objects.filter(id=1).first()"""
            form.instance.level=level
            form.save()

            if level==1:
                """
                新增学生，将新注册的userinfo关联到学生对象
                """
                student=models.Student()
                student.name='--'
                student.user=form.instance
                student.save()

            elif level==2:
                teacher=models.Teacher()
                teacher.user=form.instance
                teacher.name='--'
                teacher.save()
                invite_object = models.Invitesign.objects.filter(sign=sign).first()
                invite_object.count+=1
                invite_object.save()
                request.session['sign']=''
                request.session['register_level']=''

            elif level == 3:
                manager = models.Manager()
                manager.user = form.instance
                manager.name = '--'
                manager.save()
                invite_object = models.Invitesign.objects.filter(sign=sign).first()
                invite_object.count += 1
                invite_object.save()
                request.session['sign']=''
                request.session['register_level'] = ''

            return JsonResponse({
                'status': True,
                'data': '/login/'
            })
        else:
            return JsonResponse({
                'status': False,
                'error': form.errors
            })


def capth(request):
    """
    获取验证码
    :param request:
    :return:
    """
    code,img=get_img_code()
    request.session['captch_code']=code
    request.session.set_expiry(60)
    stram=BytesIO()
    img.save(stram,'png')
    return HttpResponse(
        stram.getvalue()
    )


def invite(request,sign):
    if sign:

        invite_object=models.Invitesign.objects.filter(sign=sign).first()
        if invite_object:
            if invite_object.count<invite_object.allow_count:
                level=invite_object.level
                request.session['register_level']=level
                request.session['sign']=sign
                request.session.set_expiry(60*5)
                return redirect('web:register')
            else:
                invite_object.delete()
                return HttpResponse("<h1>邀请地址失效</h1>")

        return HttpResponse("<h1>邀请注册地址不存在</h1>")


    return HttpResponse("<h1>错误界面</h1>")


def logout(request):
    """
    退出
    :param request:
    :return:
    """
    request.session.flush()#清除所有session信息
    return redirect('web:login')

def user(request):
    user_obj=request.manage.user
    level=request.manage.level

    form=''
    if  request.method=='GET':
        if level==1:
            #往表单自动填充数据
            form=StudentFrom(instance=user_obj)

        if level == 2:
            form = TeacherFrom( instance=user_obj)

        if level == 3:
            form = ManagerFrom( instance=user_obj)

        return render(request,'user.html',{'form':form})

    else:

        if level == 1:
            #把原本数据库表的信息更新为 form请求的数据，
            form = StudentFrom(data=request.POST,instance=user_obj)

        if level == 2:
            form = TeacherFrom(data=request.POST, instance=user_obj)

        if level == 3:
            form = ManagerFrom(data=request.POST, instance=user_obj)


        if form.is_valid():
            form.save()

            return JsonResponse({'status': True})
        else:
            return JsonResponse({'status': False, 'error': form.errors})


@csrf_exempt
def update_password(request):
    """
    更改密码
    :param request:
    :return:
    """
    password = request.POST.get('password')
    newpassword = request.POST.get('newpassword')
    type = request.POST.get('type')
    id = request.POST.get('id')
    if not type:
        turepassword=request.manage.user.user.password
        if password!=turepassword:
            return JsonResponse({
                'status':False,
                'data':'密码错误,可以联系管理员更改'
            })
        else:
            request.manage.user.user.password=newpassword
            request.manage.user.user.save()
            return JsonResponse({
                'status': True,
                'data': '更改成功'
            })

    else:
        level = request.manage.level

        # 管理员改密码，type,id

        if type == 'teacher' and level == 3:
            teacher=models.Teacher.objects.filter(id=id).first()
            teacher.user.password=newpassword
            teacher.user.save()
            teacher.save()
            return JsonResponse({
                'status': True,
                'data': '更改成功'
            })

        if type == 'student' and level == 3:
            student=models.Student.objects.filter(id=id).first()
            student.user.password=newpassword
            student.user.save()
            student.save()
            return JsonResponse({
                'status': True,
                'data': '更改成功'
            })










