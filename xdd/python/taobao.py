# -*- coding: UTF-8 -*-
from bs4 import BeautifulSoup
import requests
import re
import json
import codecs
import copy
import pymysql
import time

conn = pymysql.connect(user='root', passwd='root', host='localhost',
                       db='xdd', charset="utf8"
                       )


def fh_get_type_and_link(url):
    html = requests.get(url)
    string = html.content
    soup = BeautifulSoup(string, "html.parser")
    h2 = soup.find_all('script')
    data = h2[8]
    json_data = re.search('{[^;]*', data.text).group()
    json_str = json.loads(json_data)
    get(json_str)


    # try:
    #     fh_get_link(a.attrs['href'], h.text)
    # print h.text
    # except:
    #     continue


def insert(title, img, url,price):
    cur = conn.cursor()
    sql = 'insert into shopping(title,image,url,`from`,price) values (%s,%s,%s,0,%s)'
    try:
        cur.execute(sql, (title, img, url,price))
        conn.commit()
    except:
        print "error"
    cur.close()


def get(json_data):
    item = json_data['itemList']
    for i in item:
        base_info = i['baseinfo']
        i_name = i['name']
        image = base_info['picUrl']
        item_url = base_info['itemUrl']
        print image
        print item_url
        short_name = i_name['shortName']
        print short_name
<<<<<<< HEAD
        insert(short_name, image, item_url)
=======
        print price
        
        insert(short_name, image, item_url,price)
>>>>>>> 7af75cacd007d26215dfb4fa28e2435769ab8915


fh_get_type_and_link('https://ju.taobao.com/')
conn.commit()
conn.close()
