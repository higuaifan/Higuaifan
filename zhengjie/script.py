# coding:utf-8
import pymysql
import copy
import codecs


def controller(tablename, curlist):
    Table = tablename[0].capitalize() + tablename[1:]
    f = codecs.open("pythonCreate/" + tablename + "Controller.java", "w", "utf-8")
    f.writelines('public class ' + tablename + 'Controller extends Controller {\r')
    f.writelines('    ' + Table + ' ' + tablename + ' = new ' + Table + '();\r')
    f.writelines('\r')
    f.writelines('\r')
    f.writelines('    public void index() {\r')
    f.writelines('        renderJson(' + tablename + '.get' + Table + '());\r')
    f.writelines('    }\r')
    f.writelines('\r')
    f.writelines('\r')
    f.writelines('    public void insert() {\r')

    count = 1
    list = copy.copy(curlist)
    for c in list:
        if count == 1:
            f.writelines('')
        else:
            if c[1].find('int') != -1:
                f.writelines('        int ' + c[0] + ' = getParaToInt("' + c[0] + '");\r')
            else:
                f.writelines('        String ' + c[0] + ' = getPara("' + c[0] + '");\r')
        count = count + 1

    f.writelines('        renderJson(' + tablename + '.insert' + Table + '(')

    count = 1
    list = copy.copy(curlist)
    for c in list:
        if count == curlist.rowcount:
            f.writelines(c[0])
        elif count == 1:
            f.writelines('')
        else:
            f.writelines(c[0] + ',')
        count = count + 1

    f.writelines('));\r')

    f.writelines('    }\r')
    f.writelines('\r')
    f.writelines('    public void update() {\r')

    list = copy.copy(curlist)
    for c in list:
        if c[1].find('int') != -1:
            f.writelines('        int ' + c[0] + ' = getParaToInt("' + c[0] + '");\r')
        else:
            f.writelines('        String ' + c[0] + ' = getPara("' + c[0] + '");\r')

    f.writelines('        renderJson(' + tablename + '.update' + Table + '(')
    count = 1
    list = copy.copy(curlist)
    for c in list:
        if count == curlist.rowcount:
            f.writelines(c[0])
        else:
            f.writelines(c[0] + ',')
        count = count + 1

    f.writelines('));\r')

    f.writelines('    }\r')
    f.writelines('\r')
    f.writelines('    public void delete(){\r')
    f.writelines('        int id=getParaToInt("id");\r')
    f.writelines('        renderJson(' + tablename + '.delete' + Table + '(id));\r')
    f.writelines('    }\r')
    f.writelines('}\r')
    f.writelines('\r')

    for c in curlist:
        if c[1].find('int') != -1:
            print c[0] + ':int'
        else:
            print c[0] + ':string'
            # print(c[1])


def model(table, cur_list):
    big_table = table[0].capitalize() + table[1:]
    f = codecs.open("pythonCreate/model/" + big_table + ".java", "w", "utf-8")
    f.writelines('public class '+big_table+' extends Base'+big_table+'<'+big_table+'> {\r')
    f.writelines('    public List get' + big_table + '(){\r')
    f.writelines('        return ' + big_table + '.dao.find("select * from ' + table + '");\r')
    f.writelines('    }\r')
    f.writelines('\r')
    f.writelines('    public boolean insert' + big_table + '(')

    count = 1
    list = copy.copy(cur_list)
    for c in list:
        if count == 1:
            f.writelines('')
        else:
            if c[1].find('int') != -1:
                f.writelines('int ' + c[0])
            else:
                f.writelines('String ' + c[0])
            if count != cur_list.rowcount:
                f.writelines(',')
        count = count + 1

    f.writelines(') {\r')
    f.writelines('        return new ' + big_table + '()')

    count = 1
    list = copy.copy(cur_list)
    for c in list:
        if count != 1:
            f.writelines('.set("' + c[0] + '",' + c[0] + ')')
        count = count + 1

    f.writelines('.save();\r')
    f.writelines('    }\r')
    f.writelines('\r')
    f.writelines('    public boolean update' + big_table + '(')

    count = 1
    list = copy.copy(cur_list)
    for c in list:
        if c[1].find('int') != -1:
            f.writelines('int ' + c[0])
        else:
            f.writelines('String ' + c[0])
        if count != cur_list.rowcount:
            f.writelines(',')
        count = count + 1

    f.writelines(') {\r')
    f.writelines('        return ' + big_table + '.dao.findById(id)')
    count = 1
    list = copy.copy(cur_list)
    for c in list:
        if count != 1:
            line = c[0]
            c_big = line[0].capitalize() + line[1:]
            f.writelines('.set' + c_big + '(' + c[0] + ')')
        count = count + 1

    f.writelines('.update();\r')
    f.writelines('    }\r')
    f.writelines('\r')
    f.writelines('    public boolean delete'+big_table+'(int id){\r')
    f.writelines('        return '+big_table+'.dao.findById(id).delete();\r')
    f.writelines('    }\r')
    f.writelines('\r')
    f.writelines('}\r')
    f.writelines('\r')
    f.writelines('\r')
    f.writelines('\r')
    f.writelines('\r')
    f.writelines('\r')




conn = pymysql.connect(user='root', passwd='root', host='localhost',
                       db='zhenjie')  # 链接数据库
cur = conn.cursor()  # 生成游标
cur.execute("show tables")  # 表名
table = copy.copy(cur)

print table

for each in table:
    cur.execute("SHOW FULL COLUMNS FROM " + each[0])
    model(each[0], cur)
    print '表：' + each[0] + '\r\r'

# cur.execute("SHOW FULL COLUMNS FROM fee")
# js('fee',cur)
# Get('fee',cur)
# Update('fee',cur)
# Insert('fee',cur)
# Delete('fee',cur)

cur.close()
conn.close()
