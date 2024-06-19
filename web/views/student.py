"""
code speace
@Time    : 2024/3/31 21:09
@Author  : 泪懿:dgl
@File    : student.py
"""
from django.shortcuts import  render

from django.views.decorators.csrf import csrf_exempt
from web.forms.course import StudentCourseRcordModelForm
from web import models
from django.http import JsonResponse
import datetime

def student(request):
    """
    返回主页
    :param request:
    :return:
    """
    return render(request,'student.html')


@csrf_exempt
def student_course_data(request):
    """
    课程信息
    :param request:
    :return:
    """
    user=request.manage.user
    data_lits=[]
    courses=models.Course_user.objects.filter(joiner=user).all()
    for course in courses:
        item={}
        item['id']=course.course.id
        item['name']=course.course.name
        item['teacher']=course.course.teacher.name
        item['phone']=course.course.teacher.user.mobile_phone
        item['counts']=course.course.join_counts
        item['danger_counts']=course.danger_counts
        data_lits.append(item)
        # print(item)
    return JsonResponse({'status':True,'data':data_lits})

@csrf_exempt
def student_course_cords_data(request):
    """
    返回考勤记录的
    :param request:
    :return:
    """
    user = request.manage.user
    categories = []#保存已选课程名称,
    courses=models.Course_user.objects.filter(joiner=user).all()

    total_courd={'name':'签到总数','data':[]}
    not_courd={'name':'未签到数','data':[]}
    courd={'name':'已签数','data':[]}
    for course in courses:

        course=course.course
        categories.append(course.name)
        course_signs=models.Course_Sign.objects.filter(course=course,create_datetime__gte=course.create_datetime).all()
        total_count=models.Course_Sign.objects.filter(course=course,create_datetime__gte=course.create_datetime).count()

        #获取该课程下学生签到的总数
        course_cords_student_counts = models.Course_cords.objects.filter(student=user,course_sign__in=course_signs).count()

        not_count = total_count - course_cords_student_counts
        total_courd['data'].append(total_count)
        not_courd['data'].append(not_count)
        courd['data'].append(course_cords_student_counts)

    data_list=[
        total_courd,courd,not_courd
    ]


    return JsonResponse({'status':True,'data':data_list,'categories':categories})



@csrf_exempt
def student_dangers_data(request):
    """
    返回给学生所有i警告信息
    :param request:
    :return:
    """

    user=request.manage.user
    now_datetime=datetime.datetime.now()
    last_month=now_datetime-datetime.timedelta(days=30)
    dangers=models.Student_waring.objects.filter(student=user,create_datetime__gte=last_month).all().order_by('-id').order_by('status').reverse()
    data_list=[]
    STATUS_CHOICE_dict=dict(models.Student_waring.STATUS_CHOICE)

    for danger in dangers:

        item={}
        teacher=models.Teacher.objects.filter(user=danger.creator)
        if teacher.exists():
            creator=teacher.first()
        else:
            creator=models.Manager.objects.filter(user=danger.creator).first()

        item['id']=danger.id
        item['creator']=creator.name
        item['phone']=creator.user.mobile_phone
        item['course']=danger.course.name
        item['course_id']=danger.course.id
        item['status']=STATUS_CHOICE_dict.get(danger.status)
        item['create_datetime']=danger.create_datetime.strftime('%Y-%m-%d %H:%M')
        data_list.append(item)
    return JsonResponse({'status':True,'data':data_list})








def student_course(request):
    return render(request,'student_course.html')

@csrf_exempt
def student_course_record(request):
    if request.method=='GET':
        form1=StudentCourseRcordModelForm(ifshowcode=True)
        form=StudentCourseRcordModelForm(ifshowcode=False)
        return render(request,'student_course_record.html',{'form':form,'form1':form1})
    else:
        #学生请求签到
        id=request.POST.get('id')
        code=request.POST.get('code')
        user = request.manage.user
        course_sign = models.Course_Sign.objects.filter(id=id).first()
        enddate = course_sign.end_datetime
        if code:
            if code.strip()!=course_sign.code:
                return JsonResponse({'status':False,'error':'口令错误'})


        else:


            loaction=request.POST.get('loaction').split(',')


            signlocaton=course_sign.loaction.split(',')
            distance=course_sign.distance


            lat1,lng1=float(loaction[0]),float(loaction[1])
            lat2,lng2=float(signlocaton[0]),float(signlocaton[1])

            from geopy.distance import geodesic
            now_distance = geodesic((lat1, lng1), (lat2, lng2)).m

            if now_distance>distance:
                return JsonResponse({'status':False,'error':'超过距离限制'})

        nowtime=datetime.datetime.now()
        if nowtime>enddate:
            return JsonResponse({'status':False,'error':'打卡超时'})

        course_cords=models.Course_cords(sign=1,student=user,course_sign=course_sign)

        course_cords.save()
        course_sign.sign_counts+=1
        course_sign.save()

        return JsonResponse({'status':True})

