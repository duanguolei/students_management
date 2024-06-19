
class BootStrapForm(object):
    """
    bootstrap form表单全局样式设置,
    为每个input框设置样式

    """

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for name, field in self.fields.items():

            if field.widget.attrs.get('class'):
                field.widget.attrs['class']=field.widget.attrs.get('class')+' form-control'
            else:
                field.widget.attrs['class'] = 'form-control'
            field.widget.attrs['placeholder'] = '请输入%s' % (field.label,)

