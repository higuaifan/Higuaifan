# -*- coding: UTF-8 -*-
import random

import math
import pymysql
import os
from prettytable import PrettyTable

conn = pymysql.connect(user='zxmysql', passwd='ZX123456zx!', host='rm-wz9h86151kd3mlx1io.mysql.rds.aliyuncs.com',
                       db='news', charset="utf8")


# def insert(i):
#     cur = conn.cursor()
#     sql = 'insert into visitor(`name`,password) values (%s,%s)'
#     try:
#         cur.execute(sql, (i, ''.join(map(lambda xx: (hex(ord(xx))[2:]), os.urandom(16)))))
#         conn.commit()
#     except:
#         print
#         "error"
#     cur.close()
#
#
# def check(l, num):
#     flag = False
#     for i in l:
#         if i == num:
#             flag = True
#     return flag
#
#
# def insert(user, l):
#     type = random.randint(3, 26)
#     i = 0
#     while check(l, type):
#         type = random.randint(26, 26)
#         i += 1
#         if i > 23:
#             return l
#     l.append(type)
#     cur = conn.cursor()
#     sql = 'insert into visitor_type(`visitor`,`type`) values (%s,%s)'
#     try:
#         cur.execute(sql, (user, type))
#         conn.commit()
#     except:
#         print
#         "error"
#     cur.close()
#     return l
#
#
# i = 1
# while i < 100:
#     l = []
#     times = random.randint(5, 23)
#     print 'times:' + str(times)
#     while times > 1:
#         times -= 1
#         l = insert(i, l)
#     print l
#     i += 1

def create_list(num):
    # 创建二维数组
    num_list = []
    row = num
    while row > 0:
        col = num
        row -= 1
        c = []
        while col > 0:
            c.append(0)
            col -= 1
        num_list.append(c)
    return num_list


def print_list(num_list):
    i = 24
    title = ['矩阵']
    while i > 0:
        title.append(24 - i + 3),
        i -= 1
    table = PrettyTable(title)
    for list in num_list:
        items = [i + 3]
        for item in list:
            items.append(item)
        table.add_row(items)
        i += 1
    print table


def select(i):
    cur = conn.cursor()
    sql = 'select type from visitor_type where visitor = %s'
    cur.execute(sql, i)
    result = cur.fetchall()
    l = []
    for r in result:
        l.append(r[0])
    return sorted(l)


def real_symmetry_matrix(num_list, table):
    num_list_back_up = num_list  # 备份一下数据
    for n in num_list:
        num = n - 3  # 获取编号
        line = table[num]  # 该行
        table[num][num] += 1
        for n2 in num_list_back_up:
            num_back_up = n2 - 3
            if num_back_up != num:
                line[num_back_up] += 1

    return table


def cos_table(table):
    i = 0
    for line in table:
        num = line[i]
        j = 0
        for item in line:
            if j != i:
                if num * table[j][j] != 0:
                    line[j] = round(item / math.sqrt(num * table[j][j]), 2)
            j += 1
        i += 1
    return table


def find_no(user):
    no = []
    i = 26
    while i >= 3:
        flag = True
        for u in user:
            if u == i:
                flag = False
                break
        if flag:
            no.append(i)
        i -= 1
    return sorted(no)


def set_list(own, no, table):
    rank_list = []
    for n in no:
        num = 0
        for o in own:
            num += table[o - 3][n - 3]
        rank_list.append(round(num, 2))
    return rank_list


def get_max(rank_list, no):
    max_num = rank_list[0]
    index = 0
    i = 0
    for r in rank_list:
        if r > max_num:
            max_num = r
            index = i
        i += 1
    return no[index]


def set_user_may_like(i):
    visitor = select(i)  # 选一个用户
    print visitor
    no_user = find_no(visitor)
    print no_user
    rank_list = set_list(visitor, no_user, num_list)
    print rank_list
    max_item = get_max(rank_list, no_user)
    print max_item
    cur = conn.cursor()
    sql = 'update visitor set `may_like`=%s ,`is_recommend`="0" where id = %s'
    try:
        cur.execute(sql, (str(max_item), int(i)))
        conn.commit()
    except:
        print "error"
    cur.close()


num_list = create_list(24)

# 获取所有用户爱好信息
user = []
i = 1
while i < 100:
    user.append(select(i))
    i += 1

# 输出一个行



for u in user:
    num_list = real_symmetry_matrix(u, num_list)

print_list(num_list)
cos_table(num_list)
print_list(num_list)

i = 100
while i < 110:
    set_user_may_like(i)
    i += 1
