from django.db import models

# Create your models here.


class Userinfo(models.Model):

    idnumber = models.CharField(verbose_name='证件号', max_length=32,help_text='学号或教师号')
    mobile_phone=models.CharField(verbose_name='手机号',max_length=32,)
    password=models.CharField(verbose_name='密码',max_length=32)

    LEVEL_CHOICE=(
        (1,'学生'),
        (2,'教师'),
        (3,'管理员')
    )
    level=models.SmallIntegerField(verbose_name='级别',choices=LEVEL_CHOICE,default=1)

    def __str__(self):
        return self.idnumber


class Student(models.Model):
    user=models.ForeignKey(verbose_name='学生',to='Userinfo',on_delete=models.CASCADE)
    name = models.CharField(verbose_name='姓名', max_length=32,null=True,blank=True)
    email=models.EmailField(verbose_name='邮箱',null=True,blank=True)
    SEX_CHOICES=(
        (1,'男'),
        (2,'女')
    )
    sex = models.SmallIntegerField(verbose_name='性别', choices=SEX_CHOICES, null=True,blank=True)
    classes=models.CharField(verbose_name='班级',max_length=32,null=True,blank=True)
    college = models.CharField(verbose_name='学院', max_length=32,null=True,blank=True)

    def __str__(self):
        return self.name

class Teacher(models.Model):
     user= models.ForeignKey(verbose_name='教师', to='Userinfo', on_delete=models.CASCADE)
     name = models.CharField(verbose_name='姓名', max_length=32,null=True,blank=True)
     email = models.EmailField(verbose_name='邮箱',null=True,blank=True)
     SEX_CHOICES = (
         (1, '男'),
         (2, '女')
     )
     sex = models.SmallIntegerField(verbose_name='性别',choices=SEX_CHOICES,null=True,blank=True)
     college = models.CharField(verbose_name='学院', max_length=32, null=True,blank=True)
     PROFESSION=(
         ( 1,'教师'),
         (2,'导员'),
         (3,'教授'),
         (4,'副教授')
     )

     profession=models.SmallIntegerField(verbose_name='职称',choices=PROFESSION,default=1)

     def __str__(self):
         return self.name





class Manager(models.Model):
    SEX_CHOICES = (
        (1, '男'),
        (2, '女')
    )
    sex = models.SmallIntegerField(verbose_name='性别', choices=SEX_CHOICES, null=True)
    user = models.ForeignKey(verbose_name='管理者', to='Userinfo', on_delete=models.CASCADE)
    name = models.CharField(verbose_name='姓名', max_length=32, null=True, blank=True)
    email = models.EmailField(verbose_name='邮箱', null=True)

    def __str__(self):
        return self.name


class Course(models.Model):
    name=models.CharField(verbose_name='课程名称',max_length=32)
    counts=models.IntegerField(verbose_name='课程预设人数')
    join_counts=models.IntegerField(verbose_name='已参加人数',default=0)

    classroom=models.CharField(verbose_name='上课教室',max_length=32)
    teacher = models.ForeignKey(verbose_name='授课老师', to='Teacher', on_delete=models.CASCADE)
    create_datetime = models.DateTimeField(verbose_name='课程创建时间', auto_now_add=True)

    def __str__(self):
        return str(self.name)

class Course_user(models.Model):
    joiner=models.ForeignKey(verbose_name='选课学生', to='Student', on_delete=models.CASCADE)
    course=models.ForeignKey(verbose_name='课程',to='Course',on_delete=models.CASCADE)
    danger_counts=models.IntegerField(verbose_name='警告次数',default=0)
    create_datetime = models.DateTimeField(verbose_name='加入时间', auto_now_add=True)

class Course_cords(models.Model):
    SIGN_CHOICES = (
        (1, '已签到'),
        (2, '未签到')
    )
    sign = models.IntegerField(verbose_name='签到', choices=SIGN_CHOICES,default=2)
    student=models.ForeignKey(verbose_name='学生',to='Student',on_delete=models.CASCADE)
    course_sign=models.ForeignKey(verbose_name='课程签到',to='Course_Sign',null=True,on_delete=models.CASCADE)

    create_datetime = models.DateTimeField(verbose_name='签到时间', auto_now_add=True)


class Course_Sign(models.Model):

    creator=models.ForeignKey(verbose_name='发起教师',to='Teacher',on_delete=models.CASCADE)
    sign_counts=models.IntegerField(verbose_name='签到人数',default=0)
    course=models.ForeignKey(verbose_name='签到课程',to='Course',on_delete=models.CASCADE,default=1)

    code = models.CharField(verbose_name='签到口令', max_length=4,null=True,help_text='(可选)',blank=True)
    loaction=models.CharField(verbose_name='签到地点',max_length=32,null=True,blank=True,help_text='(可选)')
    distance=models.IntegerField(verbose_name='签到距离',help_text='半径(m) 可选',null=True,blank=True)
    create_datetime = models.DateTimeField(verbose_name='签到时间', auto_now_add=True)
    end_datetime = models.DateTimeField(verbose_name='结束时间')

class Invitesign(models.Model):
    sign=models.CharField(verbose_name='邀请码',max_length=64)
    create_datetime = models.DateTimeField(verbose_name='创建', auto_now_add=True)
    LEVEL_CHOICE=(  (2,'教师'),
        (3,'管理员')
    )

    allow_count=models.IntegerField(verbose_name='允许访问次数',default=10)
    count=models.IntegerField(verbose_name='已访问次数',default=0)

    level=models.SmallIntegerField(verbose_name='邀请级别',choices=LEVEL_CHOICE,default=1)




class Student_waring(models.Model):
    student=models.ForeignKey(verbose_name='警告者',to='Student',on_delete=models.CASCADE)
    creator=models.ForeignKey(verbose_name='发起人',to='Userinfo',on_delete=models.CASCADE)
    course = models.ForeignKey(verbose_name='警告课程', to='Course', on_delete=models.CASCADE,default=1)

    STATUS_CHOICE=(
        (1,'已处理'),
        (2,'未处理')
    )
    status=models.SmallIntegerField(verbose_name='处理状态',choices=STATUS_CHOICE,default=2)
    create_datetime = models.DateTimeField(verbose_name='警告时间', auto_now_add=True)























