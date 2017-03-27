# -*- coding: UTF-8 -*-
from bs4 import BeautifulSoup
import requests
import codecs
import copy
import pymysql
import time

conn = pymysql.connect(user='zxmysql', passwd='ZX123456zx!', host='rm-wz9h86151kd3mlx1io.mysql.rds.aliyuncs.com',
                       db='news', charset="utf8"
                       )


def fh_get_type_and_link(url):

    html = requests.get(url)
    string = html.content
    soup = BeautifulSoup(string, "html.parser")
    h2 = soup.find_all('h2')
    for h in h2:
        a = h.a
        try:
            # 添加
            # if check_type(h.text):
            #     insert_type(h.text)

            fh_get_link(a.attrs['href'], h.text)
            # print h.text
        except:
            continue

def fh_get_link(url, type):
    count = 0
    html = requests.get(url)
    string = html.content
    soup = BeautifulSoup(string, "html.parser")
    a_dom = soup.find_all('a')
    for a in a_dom:
        if len(a.text) > 14:
            if 'http' in a.attrs['href']:
                count += 1
                if count > 10:
                    return
                title = a.text
                fh_get_html(a.attrs['href'], title, type)
                # print a.text

def fh_get_html(url, title, type):
    html = requests.get(url)
    string = html.content
    soup = BeautifulSoup(string, "html.parser")
    try:
        text = soup.find_all(id='photo_info')
        img = soup.find_all(id='photo_bigImg')
        if text == [] and img == []:
            try:
                text = soup.find_all(id='main_content')
                img = [text[0].img]
            except:
                return

        for t in text:
            content = t.text
        for i in img:
            img_url = i.attrs['src']
        insert(title, content[:2500], img_url, '凤凰网', type)
    except:
        return

def insert(title, content, img, web, text_type):
    cur = conn.cursor()
    t = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
    sql = 'insert into new(title,content,`time`,img,`from`,type) values (%s,%s,%s,%s,%s,%s)'
    # print title, content, img, web, text_type
    try:
        cur.execute(sql, (title, content, t, img, web, text_type))
        conn.commit()
    except:
        print
        "error"
    cur.close()


# type模块
def insert_type(new_type):
    cur = conn.cursor()
    sql = 'insert into type(name) values (%s)'
    # print title, content, img, web, text_type
    try:
        cur.execute(sql, (new_type))
        conn.commit()
    except:
        print "error"
    cur.close()

def get_type():
    sql = 'select `name` from type'
    cur = conn.cursor()
    cur.execute(sql, ())
    result = cur.fetchall()
    list = []
    for r in result:
        list.append(r[0].encode('utf-8'))
    return list

def check_type(new_type):
    flag=True
    for t in type_list:
        if t.decode("utf-8")==new_type:
            flag=False
    return flag




type_list = get_type()
fh_get_type_and_link('http://www.ifeng.com/daohang/')
get_type()
conn.commit()
conn.close()
