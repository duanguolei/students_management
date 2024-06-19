"""
code speace
@Time    : 2024/4/1 16:26
@Author  : 泪懿:dgl
@File    : course.py
"""

import json
import datetime
from django.shortcuts import render,redirect
from django.views.decorators.csrf import  csrf_exempt
input_format = "%Y-%m-%d"

from web.forms.teacher import CourseModelForm,TeacherFrom
from web.forms.student import StudentFrom
from web.forms.manager import ManagerCoursemodelForm
from web.forms.course import CourseRcordModelForm
from django.http import HttpResponse,JsonResponse,HttpResponseRedirect,Http404
from web import models



def get_course_data(request):
    """
    获取课程列表
    :param request:
    :return:
    """
    user_obj=request.manage.user
    level=request.manage.level

    data_list=[]
    if level==2:
        #获取老师所属课程列表
        couser=models.Course.objects.filter(teacher=user_obj).values().order_by('-id')
        for item in couser:
            item['teacher']=models.Teacher.objects.filter(id=item['teacher_id']).first().name
            item['create_datetime']=str(item['create_datetime'])
            data_list.append(item)

    if level==1:
        couser = models.Course.objects.values().order_by('-id')
        for item in couser:
            item['teacher'] = models.Teacher.objects.filter(id=item['teacher_id']).first().name
            item['create_datetime'] = str(item['create_datetime'])
            if models.Course_user.objects.filter(joiner=user_obj,course_id=item['id']).exists():
                item['select']=True
            else:
                item['select']=False

            data_list.append(item)
    if level==3:
        couser = models.Course.objects.values().order_by()
        for item in couser:
            item['teacher'] = models.Teacher.objects.filter(id=item['teacher_id']).first().name
            item['create_datetime'] = str(item['create_datetime'])
            data_list.append(item)

    return JsonResponse({'data':data_list})

@csrf_exempt
def deel_course_data(request):
    type=request.POST.get('type')
    level=request.manage.level
    id=request.POST.get('id')
    user=request.manage.user

    if type=='delete':
        if level==2:
            courser = models.Course.objects.filter(id=id,teacher=request.manage.user).first()
            if courser:
                courser.delete()
                return JsonResponse({'status':True,'data':'删除成功'})
            else:
                return JsonResponse({'status': False, 'data': '删除失败'})
        if level==3:
            courser = models.Course.objects.filter(id=id).first()
            if courser:
                courser.delete()
                return JsonResponse({'status': True, 'data': '删除成功'})
            else:
                return JsonResponse({'status': False, 'data': '删除失败'})
    if type=='update':
        level = request.manage.level
        user=request.manage.user
        id = request.session.get('update_id')

        if level==2:
            couser_obj=models.Course.objects.filter(id=id,teacher=user).first()
        if level == 3:
            couser_obj = models.Course.objects.filter(id=id).first()

        if couser_obj:
            form = CourseModelForm(request.POST, instance=couser_obj)
            if form.is_valid():
                form.save()
                couser_obj.save()
                return JsonResponse({'status': True})
            else:
                return JsonResponse({'status': False, 'error': form.errors})
        else:
            return JsonResponse({'status': False, 'error': '更新失败'})


    if type=='join':
        #学生选课
        if level==1:
            if models.Course_user.objects.filter(course_id=id,joiner=user).exists():
                return JsonResponse({'status':False,'data':'课程已选择'})
            else:

                course = models.Course.objects.filter(id=id).first()
                if course.join_counts>=course.counts:
                    return JsonResponse({'status': False, 'data': '课程已满'})

                course_user=models.Course_user(joiner=user,course_id=id)
                course_user.save()
                course.join_counts+=1
                course.save()

                return JsonResponse({'status':True})

    if type=='delete_course':
        """学生退课"""
        if level==1:
            couser_user=models.Course_user.objects.filter(course_id=id, joiner=user)
            if couser_user.exists():
                couser_user.first().delete()
                course = models.Course.objects.filter(id=id).first()
                course.join_counts-= 1
                course.save()
                return JsonResponse({'status':True})



    return JsonResponse({'status':False})



@csrf_exempt
def course_student(request):
    """获取改课程的所有学生"""

    user=request.manage.user
    id = request.POST.get('id')
    level = request.manage.level

    if level == 2:
        students = models.Course_user.objects.filter(course_id=id,course__teacher=user).all()
    if  level == 3:
        students=models.Course_user.objects.filter(course_id=id).all()
    data=[]
    for student in students:
        item={
            'name':student.joiner.name,
            'id':student.joiner.user.idnumber,
            'classes':student.joiner.classes,
            'phone':student.joiner.user.mobile_phone,
            'emial':student.joiner.email,
            'create_date':student.create_datetime.strftime("%Y-%m-%d")
        }
        data.append(item)

    return JsonResponse({'status': True,'data':data})


@csrf_exempt
def updateform(request):
    if request.method=='POST':
        "保存post更新请求的信息到会话中去"
        title=request.POST.get('title')
        id=request.POST.get('id')
        type=request.POST.get('type')
        request.session['update_id']=id
        request.session['update_type']=type
        request.session['update_title']=title
        request.session.set_expiry(60*60)

        return JsonResponse({'status':True,'data':'/updateform/'})

    if request.method == 'GET':
        """
        打开更新界面，把session中存储的信息拿出，得出不同的form传递
        """
        user = request.manage.user
        level = request.manage.level
        title=request.session.get('update_title')
        type=request.session.get('update_type')
        id=request.session.get('update_id')

        if level==2:
            if not id:
                # e = '页面不存在,请重新点击更新按钮'
                return redirect('web:teacher_course')
            if title=="课程更新":
                if type=='updata':
                    couser_obj=models.Course.objects.filter(id=id,teacher=user).first()
                    if couser_obj:
                        form=CourseModelForm(instance=couser_obj)
                        return render(request,'updatecourseform.html',{'form':form,'title':title})

        if level == 3:
            if not id:
                e = '页面不存在,请重新点击更新按钮'
                return redirect('web:manage_course')
            if title == "课程更新":
                if type == 'updata':
                    couser_obj = models.Course.objects.filter(id=id).first()
                    if couser_obj:
                        form =ManagerCoursemodelForm(instance=couser_obj)
                        return render(request, 'updatecourseform.html', {'form': form, 'title': title})
            if title == "考勤更新":
                if type == 'updata':
                    couser_obj = models.Course_Sign.objects.filter(id=id).first()
                    if couser_obj:
                        form = CourseRcordModelForm(instance=couser_obj)
                        return render(request, 'updatecourseform.html', {'form': form, 'title': title})
            if title=='教师更新':
                if type=='updata':
                    teacher_obj=models.Teacher.objects.filter(id=id).first()

                    form=TeacherFrom(instance=teacher_obj)
                    return render(request, 'updatecourseform.html', {'form': form, 'title': title})

            if title == '学生更新':
                if type == 'updata':
                    student_obj = models.Student.objects.filter(id=id).first()

                    form = StudentFrom(instance=student_obj)
                    return render(request, 'updatecourseform.html', {'form': form, 'title': title})

        return render(request, 'updatecourseform.html')


def course_record_data(request):
    """
    获取签到信息
    :param request:
    :return:
    """
    user = request.manage.user
    level = request.manage.level
    data_list = []

    if level!=1:
        if level==2:
            result=models.Course_Sign.objects.filter(creator=user).values().order_by('-id')
        if level==3:
            result = models.Course_Sign.objects.values().order_by('-id')

        for item in result:
            if item['course_id']:
                item['teacher'] = models.Teacher.objects.filter(id=item['creator_id']).first().name

                course= models.Course.objects.filter(id=item['course_id']).first()
                item['course'] =course.name
                item['counts']=course.join_counts
                item['create_datetime']=item['create_datetime'].strftime('%Y-%m-%d %H:%M')

                data_list.append(item)
    if level==1:
        """获取该学生对应所有课程的签到列表"""
        #获取该学生所有参加的课程
        couser=models.Course_user.objects.filter(joiner=user).values('course').all()
        #获取所有课程所发布的考勤记录
        result = models.Course_Sign.objects.filter(course__in=couser).values().order_by('-id')

        for item in result:
            item['teacher'] = models.Teacher.objects.filter(id=item['creator_id']).first().name
            course = models.Course.objects.filter(id=item['course_id']).first()
            item['course'] = course.name
            item['counts'] = course.join_counts
            del item['create_datetime']
            del item['loaction']
            del item['distance']
            # 获取学生自己在改考勤下是否签到的记录
            coures_signcord = models.Course_cords.objects.filter(student=user,course_sign_id=item['id'])

            if coures_signcord.first():
                item['sign'] = True
            else:
                item['sign'] = False

            if item['code']:
                item['code']=True
            else:
                item['code']=False

            data_list.append(item)



    return JsonResponse({'data':data_list})

@csrf_exempt
def course_cords_student(request):
    """
    学生签到信息
    :param request:
    :return:
    """
    id = request.POST.get('id')
    level = request.manage.level

    if level == 2:
        #获取课程考勤信息
        course_sign=models.Course_Sign.objects.filter(id=id,course__teacher=request.manage.user).first()
        #获取该考勤所属课程
        course=course_sign.course
        #获取该课程的所有学生的记录
        Course_student=models.Course_user.objects.filter(course=course).all()
    if  level==3:
        course_sign = models.Course_Sign.objects.filter(id=id).first()
        course = course_sign.course
        Course_student = models.Course_user.objects.filter(course=course).all()

    data = []

    #存储签到总数
    counts=0

    for student in Course_student:

        #获取该学生在该考勤的签到
        coures_signcord=models.Course_cords.objects.filter(student=student.joiner,course_sign_id=id,create_datetime__gte=student.create_datetime)

        item = {
            'name': student.joiner.name,
            'id': student.joiner.user.idnumber,
            'courseid': '',
            'create_date': '',
            'ifdanger':True,
            'danger_counts':student.danger_counts
        }

        item['courseid'] = course.id

        laste_one_daty = datetime.datetime.now() - datetime.timedelta(days=1)

        student_waring_object = models.Student_waring.objects.filter(student=student.joiner, status=2, course=course)
        if student_waring_object.exists():
            # 没有超过一天未处理的警告可以取消警告，
            if not student_waring_object.filter(create_datetime__lte=laste_one_daty).exists():
                item['ifdanger'] = False

        if coures_signcord.exists():

            item['create_date']=coures_signcord.first().create_datetime
            #如果该课程在该考勤没有 未处理(2)，则不警告

            sign=coures_signcord.first().sign
            item['sign']='签到'
            item['create_date']=coures_signcord.first().create_datetime.strftime("%Y-%m-%d %H-%M")
            counts += 1

        else:
            item['sign'] = '未签到'

        #统计每个学生缺勤次数
        #该学生在该课程总的签到总数
        student_course_count_cords=models.Course_cords.objects.filter(student=student.joiner,course_sign__course=course).count()
        #统计一下该课程发布考勤总数

        course_count_cords=models.Course_Sign.objects.filter(course=course,create_datetime__gte=student.create_datetime).count()

        item['student_not_cords']=course_count_cords-student_course_count_cords

        data.append(item)


    total_counts=course.join_counts

    if total_counts!=0:
        progerees='{:.2f}'.format(counts/total_counts)
    else:
        progerees=0

    return JsonResponse({'status': True, 'data': data,'progerees':progerees})

@csrf_exempt
def student_waring(request):
    """
    保存到数据表该课程该学生的警告信息
    :param request:
    :return:
    """
    idnumber=request.POST.get('id')#学号
    courseid=request.POST.get('courseid')
    course=models.Course.objects.filter(id=courseid).first()

    creaotr=models.Userinfo.objects.filter(id=request.manage.idnumber).first()

    level=request.manage.level

    student_user_info=models.Userinfo.objects.filter(idnumber=idnumber).first()

    student=models.Student.objects.filter(user=student_user_info).first()

    if level==1:
        return JsonResponse({'status':False})
    else:
        waring=models.Student_waring(student=student,creator=creaotr,course=course)
        waring.save()
        #该课程的学生记录

        course_student=models.Course_user.objects.filter(joiner=student,course=course).first()
        course_student.danger_counts+=1
        course_student.save()
        return JsonResponse({'status':True})

@csrf_exempt
def deel_waring(request):
    id=request.POST.get('id')
    danger=models.Student_waring.objects.filter(id=id).first()
    danger.status=1
    danger.save()
    return JsonResponse({'status':True})

def course_cords_data(request):
    """
    获取该课程下所有学生的签到情况
    :param request:
    :return:
    """
    id=request.GET.get('id')
    course=models.Course.objects.filter(id=id).first()

    #获取该课程下的所有学生
    students=models.Course_user.objects.filter(course=course).all()

    categories=[]
    #该课程下所有发布考勤的总数
    course_count_cords = models.Course_Sign.objects.filter(course=course).count()

    counts_list=[]
    not_count_list=[]

    for student in students:
        name=student.joiner.name
        categories.append(name)#往里面添加名称
        #获取该课程，该学生的签到总数
        # 3个条件
        # 该学生
        # 所有发布考勤(属于该课程)记录
        # 已签到数
        count=models.Course_cords.objects.filter(student=student.joiner,course_sign__course=course,sign=1).count()

        not_count=course_count_cords-count

        counts_list.append(count)
        not_count_list.append(not_count)

    data=[
        {'name':'签到',
         'data':counts_list},
        {'name': '未签到',
         'data': not_count_list}
    ]
    # print(data)

    return JsonResponse({'status':True,'categories':categories,'data':data})

@csrf_exempt
def deel_course_record(request):
    level=request.manage.level
    user=request.manage.user
    type=request.POST.get('type')
    id=request.POST.get('id')

    if level==3:
        if type=='delete':
            course_sign=models.Course_Sign.objects.filter(id=id).first()
            course_sign.delete()
            return JsonResponse({'status':True})
        if type=='update':
            id=request.session.get('update_id')
            course_sign = models.Course_Sign.objects.filter(id=id).first()
            form=CourseRcordModelForm(request.POST,instance=course_sign)

            if form.is_valid():
                form.save()
                return JsonResponse({'status': True})
            else:
                return JsonResponse({'status': False,'error':form.errors})


    return JsonResponse({'status': False})