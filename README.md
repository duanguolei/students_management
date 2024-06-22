# django学生考勤管理系统
> 基于django的学生考勤管理系统，具有可视化，教师管理，学生管理，考勤统计，考勤记录，邀请注册等功能，分为学生，教师，管理员三个角色。


## 部分项目简单展示

### 学生端
![img_6.png](./images/img_6.png)
![img_7.png](./images/img_7.png)
![img_8.png](./images/img_8.png)
![img_9.png](./images/img_9.png)
![img_10.png](./images/img_10.png)
![img_11.png](./images/img_11.png)
### 教师端
![img.png](./images/img.png)
![img_2.png](./images/img_2.png)
![img_1.png](./images/img_1.png)
![img_3.png](./images/img_3.png)
![img_4.png](./images/img_4.png)
![img_5.png](./images/img_5.png)
### 管理员端
![img_12.png](./images/img_12.png)
![img_13.png](./images/img_13.png)
![img_14.png](./images/img_14.png)
![img_15.png](./images/img_15.png)
## 运行
1.下载项目
```shell
git clone https://github.com/duanguolei/students_management.git
```

2.下载依赖
```shell
cd students_management
```
```shell
pip install -r requirements.txt
```

3.配置环境

> 并配置mysql,redis

4.迁移数据库
```shell
python manage.py makemigrations

python manage.py migrate
```

5.运行
```shell
python manage.py runserver
```

访问: http://127.0.0.1:8000/login

## 注意
### 1.注册
管理员，教师注册，需要运行脚本生成注册码
```shell
python web/scripts/load_invite_sign.py
```
生成后点击注册码，跳转到注册位置
### 2.定位
定位采用腾讯地图api,网上找的一个，可能失效请自行更改,见配置文件

---

__代码中存在一定逻辑漏洞，不完善之处，欢迎点评指正__
