"""
code speace
@Time    : 2024/4/1 11:22
@Author  : 泪懿:dgl
@File    : teacher.py
"""
import datetime
from django.shortcuts import  render
from web.forms.teacher import CourseModelForm
from web.forms.course import TeacherCourseRcordModelForm,CourseRcordModelForm
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from web import models


def teacher(request):
    if request.method=='GET':
        return render(request,'teacher.html')


@csrf_exempt
def teacher_course_cord_data(request):
    #获取该老师所有课程考勤完成率
    data_list=[]
    teacher=request.manage.user
    coursers=models.Course.objects.filter(teacher=teacher).all()
    for course in coursers:
        name=course.name
        total_counts=0#存储总的签到人次
        signs=models.Course_Sign.objects.filter(course=course).all()
        now_student_count=course.join_counts*models.Course_Sign.objects.filter(course=course).count()
        for sign in signs:
            total_counts+=sign.sign_counts

        # if no
        not_total_counts=now_student_count-total_counts
        if  now_student_count==0:
            rate=0
        else:
            rate=not_total_counts/now_student_count*100
        # print(not_total_counts,now_student_count,total_counts)
        data_list.append([name,rate])

    return JsonResponse({'status':True,'data':data_list})

@csrf_exempt
def teacher_msg(request):
    user=request.manage.user
    msg_data_list=[]
    course=models.Course.objects.filter(teacher=user).all()

    now_datetime=datetime.datetime.now()
    later_datetime=now_datetime-datetime.timedelta(days=3)

    course_all_user=models.Course_user.objects.filter(course__in=course,create_datetime__gte=later_datetime).all().order_by('-id')
    for user in course_all_user:
        student_name=user.joiner.name
        class_name=user.joiner.classes

        course_name=user.course.name
        join_date=str(user.create_datetime.strftime('%Y-%m-%d %H:%M'))
        if class_name:
            msg_formt=f"{class_name}的{student_name}于{join_date}加入{course_name}班级"
        else:
            msg_formt = f"{student_name}于{join_date}加入{course_name}班级"

        msg_data_list.append(msg_formt)

    return JsonResponse({'status':True,'data':msg_data_list})


















@csrf_exempt
def teacher_course_data(request):
    #返回该老师所有课程的人数
    categories=[]#
    teacher=request.manage.user

    results=models.Course.objects.filter(teacher=teacher).values()

    data_list=[]
    pre_count={'name':'课程预设人数','data':[]}
    count={'name':'课程人数','data':[]}

    for result in results:

        categories.append(result['name'])
        pre_count['data'].append(result['counts'])
        count['data'].append(result['join_counts'])

    return JsonResponse({
        'status':True,
        'categories':categories,
        'data':[pre_count,count]

    })






@csrf_exempt
def teacher_course(request):
    if  request.method=='GET':
        form = CourseModelForm()
        return render(request,'teacher_course.html',{'form':form})
    else:
        form=CourseModelForm(request.POST)
        if form.is_valid():
            form.instance.teacher=request.manage.user
            form.save()

            return JsonResponse({'status': True})
        else:
            return JsonResponse({'status':False,'error':form.errors})


@csrf_exempt
def teacher_coruse_record(request):

    if request.method == "GET":
        form=TeacherCourseRcordModelForm(request)
        return render(request,'teacher_course_redcord.html',{'form':form})

    else:
        level = request.manage.level
        if level==3:
            form = CourseRcordModelForm(request.POST)
        if level==2:
            form=TeacherCourseRcordModelForm(request,request.POST)
        if form.is_valid():

            if level==3:
               form.instance.creator=models.Teacher.objects.filter(id=request.POST.get('creator')).first()
            if level==2:
                form.instance.creator=request.manage.user

            form.save()

            return JsonResponse({'status': True})
        else:
            return JsonResponse({'status': False, 'error': form.errors})


