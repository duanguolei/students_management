# Generated by Django 5.0.3 on 2024-04-01 11:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0005_alter_student_sex_alter_teacher_sex_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='student',
            name='sex',
            field=models.SmallIntegerField(choices=[('1', '男'), ('2', '女')], null=True, verbose_name='性别'),
        ),
        migrations.AlterField(
            model_name='teacher',
            name='sex',
            field=models.SmallIntegerField(choices=[('1', '男'), ('2', '女')], null=True, verbose_name='性别'),
        ),
    ]
