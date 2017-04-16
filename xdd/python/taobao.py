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
    item = json_data['itemList']
    for i in item:
        base_info = i['baseinfo']
        i_name = i['name']
        price_arr = i['price']
        price = price_arr['actPrice']
        image = base_info['picUrl']
        item_url = base_info['itemUrl']
        print image
        print item_url
        short_name = i_name['shortName']
        long_name = i_name['longName']
        print short_name
        print long_name
        print price

        insert(short_name, long_name, image, item_url, price)


fh_get_type_and_link('https://ju.taobao.com/')
conn.commit()
conn.close()
