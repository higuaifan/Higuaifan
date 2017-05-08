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
    json_data = re.search('\(.*', soup.text).group()
    json_str = json.loads(json_data[1:-2])
    get(json_str)


    # try:
    #     fh_get_link(a.attrs['href'], h.text)
    # print h.text
    # except:
    #     continue


def insert(title, describe, img, url, price):
    cur = conn.cursor()
    sql = 'insert into shopping(title,`describe`,image,url,`from`,price) values (%s,%s,%s,%s,0,%s)'
    try:
        cur.execute(sql, (title, describe, img, url, price))
        conn.commit()
    except:
        print "error"
    cur.close()


def get(json_data):
    item = json_data['miaoShaList']
    for i in item:
        price = i['miaoShaPrice']
        image = i['imageurl']
        item_url = "https://item.jd.com/" + i['wareId']+".html"
        short_name = i['wname']
        long_name = i['wname']
        print image
        print item_url
        print short_name
        print long_name
        print price
        #
        insert(short_name, long_name, image, item_url, price)


fh_get_type_and_link('https://ai.jd.com/index_new?app=Seckill&action=pcMiaoShaAreaList&callback=pcMiaoShaAreaList')
conn.commit()
conn.close()
