"""
code speace
@Time    : 2024/4/3 0:17
@Author  : 泪懿:dgl
@File    : manager.py
"""


from django.shortcuts import  render,redirect

from django.views.decorators.csrf import csrf_exempt
from web.forms.course import StudentCourseRcordModelForm,CourseRcordModelForm
from web.forms.manager import ManagerCoursemodelForm
from web.forms.teacher import TeacherFrom
from web.forms.student import StudentFrom

from web.forms.manage import RegisterMOdelFrom
from web import models
from django.http import JsonResponse,HttpResponse
import datetime

@csrf_exempt
def manage_course(request):

    if request.method=='GET':

        form =ManagerCoursemodelForm()
        return render(request,'manage_course.html',{'form':form})
    else:
        form=ManagerCoursemodelForm(request.POST)
        if form.is_valid():

            form.save()
            return JsonResponse({'status': True})
        else:
            return JsonResponse({'status':False,'error':form.errors})

    return render(request, 'manage_course.html')

def manage_course_record(request):
    form=CourseRcordModelForm()
    return render(request, 'manage_course_record.html',{'form':form})

def manage_student(request):
    level=request.manage.level
    print(level)
    if level==3:
        if request.method=='GET':
            form=RegisterMOdelFrom(request)
            return render(request,'manage_student.html',{'form':form})
        if request.method=='POST':

            form = RegisterMOdelFrom(request, request.POST)
            if form.is_valid():
                student = models.Student()
                student.name = str('--')  # 避免返回空
                form.instance.level = 1

                student.user = form.instance

                form.save()
                student.save()

                return JsonResponse({'status': True})
            else:
                return JsonResponse({'status': False, 'error': form.errors})

    return render(request, 'manage_student.html')



@csrf_exempt
def manage_teacher(request):
    """教师管理"""
    level=request.manage.level
    if level==3:
        if request.method=='GET':
            form=RegisterMOdelFrom(request)
            return render(request,'manage_teacher.html',{'form':form})
        if request.method=='POST':
            form = RegisterMOdelFrom(request, request.POST)
            if form.is_valid():
                teacher =models.Teacher()
                teacher.name=str('--')#避免返回空
                form.instance.level=2
                form.save()
                teacher.user=form.instance#userinfo
                teacher.save()
                return JsonResponse({'status':True})

            else:
                return JsonResponse({'status': False,'error':form.errors})


    return  render(request,'manage_teacher.html')


@csrf_exempt
def manage_teacher_course(request):
    pass


@csrf_exempt
def manage_teacher_course_data(request):
    """
    获取该老师的所有课程
    :param request:
    :return:
    """

    user = request.manage.user
    id = request.POST.get('id')
    level = request.manage.level

    if level == 3:
        coursers = models.Course.objects.filter(teacher_id=id).all()

        data = []
        for  courser in coursers:
            item = {
                'name': courser.name,
                'id': courser.id,
                'teacher':courser.teacher.name,
                'classes': courser.classroom,
                'join_counts':courser.join_counts,
                'create_date': courser.create_datetime.strftime("%Y-%m-%d")
            }
            data.append(item)

        return JsonResponse({'status': True, 'data': data})
    return JsonResponse({'status': False})



def manage_teacher_data(request):
    level=request.manage.level
    data_list = []
    if level==3:
        PROFESSION=dict(models.Teacher.PROFESSION)
        SEX=dict(models.Teacher.SEX_CHOICES)
        teachers=models.Teacher.objects.values()
        for teacher in teachers:
            user=models.Userinfo.objects.filter(id=teacher['user_id']).first()
            teacher['idnumber']=user.idnumber
            teacher['mobile_phone']=user.mobile_phone
            teacher['password']=user.password
            teacher['sex']=SEX.get(teacher['sex'])
            teacher['profession']=PROFESSION.get(teacher['profession'])

            data_list.append(teacher)

    return JsonResponse({'data':data_list})

def manage_student_data(request):
    level = request.manage.level
    data_list = []
    if level == 3:

        SEX = dict(models.Student.SEX_CHOICES)
        students= models.Student.objects.values()
        for student in students:
            user = models.Userinfo.objects.filter(id=student['user_id']).first()
            student['idnumber'] = user.idnumber
            student['mobile_phone'] = user.mobile_phone
            student['password'] = user.password
            student['sex'] = SEX.get(student['sex'])


            data_list.append(student)

    return JsonResponse({'data': data_list})


@csrf_exempt
def deel_teacher(request):
    level=request.manage.level
    id=request.POST.get('id')
    type=request.POST.get('type')
    updatetype=request.session.get('update_type')

    if level==3:
        if type=='delete':
            teacher=models.Teacher.objects.filter(id=id)

            if teacher.first():
                teacher.first().user.delete()
                teacher.first().delete()

            return JsonResponse({'status':True})

        if updatetype=='updata':
            id=request.session.get('update_id')
            teacher_object=models.Teacher.objects.filter(id=id).first()
            form=TeacherFrom(request.POST,instance=teacher_object)

            if form.is_valid():
                form.save()
                return JsonResponse({'status':True})
            else:
                return JsonResponse({'status':False,'error':form.errors})

    return JsonResponse({'status': False})

@csrf_exempt
def deel_student(request):
    level = request.manage.level
    id = request.POST.get('id')
    type = request.POST.get('type')
    updatetype = request.session.get('update_type')
    if level == 3:
        if type == 'delete':
            student= models.Student.objects.filter(id=id)
            if student.first():
                student.first().user.delete()
                student.first().delete()
            return JsonResponse({'status': True})

        if updatetype == 'updata':
            id = request.session.get('update_id')
            student_object = models.Student.objects.filter(id=id).first()
            form =StudentFrom(request.POST, instance=student_object)

            if form.is_valid():
                form.save()
                return JsonResponse({'status': True})
            else:
                return JsonResponse({'status': False, 'error': form.errors})

    return JsonResponse({'status': False})




