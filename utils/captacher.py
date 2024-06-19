"""
code speace
@Time    : 2024/3/7 17:55
@Author  : 泪懿:dgl
@File    : captacher.py
"""

from PIL import Image,ImageDraw,ImageFont
import random
import os


characters='ABCDEFGHIJKLMNPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789'


def generate_verificaition_code(length=5):
    """
    生成验证码
    :param length:
    :return:
    """
    code = ''.join(random.choice(characters) for _ in range(length))
    return code

def create_verfication_image(code,image_size=(128,32),if_fill_line=True,if_file_nose=True,font_path=None,font_size=None):
    image=Image.new("RGB",image_size,color='white')
    draw=ImageDraw.Draw(image)
    if not font_path:
        font_path=os.path.join(os.path.dirname(__file__),'msyh.ttf')

    try:
        font=ImageFont.truetype(font_path,font_size)
    except Exception as e:
        font=ImageFont.load_default()

        # 设置每个字母的随机颜色
    for i, char in enumerate(code):
        char_color = (random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))
        x = random.randint(font_size-2,font_size)*i+random.uniform(0,3)
        y = random.randint(0,2)
        draw.text((x,y),char,fill=char_color,font=font)

    if if_fill_line:
        # 添加随机线条并随机弯曲
        for _ in range(random.randint(2, 5)):
            start_point = (random.randint(0, image_size[0]), random.randint(0, image_size[1]))
            end_point = (random.randint(0, image_size[0]), random.randint(0, image_size[1]))
            line_color = (random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))

            # 随机选择控制点位置来实现弯曲效果
            x1, y1 = start_point
            x2, y2 = end_point
            control_point1 = (x1 + random.randint(-20, 20), y1 + random.randint(-10, 10))
            control_point2 = (x2 + random.randint(-20, 20), y2 + random.randint(-10, 10))

            # 绘制贝塞尔曲线
            draw.line([start_point, control_point1, control_point2, end_point], fill=line_color,
                      width=random.randint(1, 3))

    if if_file_nose:
        # 添加随机噪声
        for _ in range(random.randint(0, 20)):
            x = random.randint(0, image_size[0])
            y = random.randint(0, image_size[1])
            pixel_color = (random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))
            draw.point((x, y), fill=pixel_color)

    return code,image

def get_img_code():

    length=5
    if_nose=True
    if_line=False

    code=generate_verificaition_code(length=length)
    return create_verfication_image(code, font_size=25, if_fill_line=if_line,
                             if_file_nose=if_nose)

if __name__ == '__main__':
    code,img=get_img_code()
    print(code)
    img.save('2.png')
