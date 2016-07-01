import pymysql
import copy

def insert(list,table):
    f = open("E:/sql/insert/"+table+".php",'w')
    f.write('<?php\r//insert sql\rinclude "../../checksession.php";\rinclude "../../../conn.php";\r            // ini_set("display_errors", "On");\r    	    // error_reporting(E_ALL | E_STRICT);\r')
    count=0
    list2=copy.copy(list)
    list3=copy.copy(list)
    for li in list:
        #print(li)
        if li[0]!='ID':
            f.write("$"+li[0]+"=$_POST['"+li[0]+"'];\r")
            count=count+1
    n=0
    #sql语句开始
    f.write("$sql=\"insert into "+table+"(")
    for li in list2:
        if li[0]!='ID':
            if n<count-1:
                f.write(li[0]+",")
            else:
                f.write(li[0])
        n=n+1
    f.write(') values (')
    n=0
    for li in list3:
        if li[0]!='ID':
            print(li[0])
            if n<count-1:
                f.write("'"+li[0]+"',")
            else:
                f.write("'"+li[0]+"')\";")
        n=n+1
    #sql语句结束
    f.write("\r$sql=iconv('UTF-8','GB2312//IGNORE',$sql);\r// echo $sql;\r$result=mysql_query($sql,$conn);\rif ($result){\r	echo json_encode(array('msg'=>'success'));\r} else {\r	echo json_encode(array('msg'=>mysql_error()));\r}\r?>")
    f.close()

def update(list,table):
    f = open("E:/sql/update/"+table+".php",'w')
    f.write('<?php\r//update sql\rinclude "../../checksession.php";\rinclude "../../../conn.php";\r            // ini_set("display_errors", "On");\r    	    // error_reporting(E_ALL | E_STRICT);\r')
    count=0
    list2=copy.copy(list)
    for li in list:
        f.write("$"+li[0]+"=$_POST['"+li[0]+"'];\r")
        count=count+1
    n=0
    f.write("$sql=\"update "+table+" set ")
    equalid=""
    for li in list2:
        if li[0]!='ID':
            if n<count-1:
                f.write(li[0]+"='"+li[0]+"',")
            else:
                f.write(li[0]+"='"+li[0]+"' where ID=$ID\";")
        n=n+1
    f.write("\r$sql=iconv('UTF-8','GB2312//IGNORE',$sql);\r// echo $sql;\r$result=mysql_query($sql,$conn);\rif ($result){\r	echo json_encode(array('msg'=>'success'));\r} else {\r	echo json_encode(array('msg'=>mysql_error()));\r}\r?>")
    f.close()

def delete(list,table):
    f = open("E:/sql/delete/"+table+".php",'w')
    f.write('<?php\r//delete sql\rinclude "../../checksession.php";\rinclude "../../../conn.php";\r            // ini_set("display_errors", "On");\r    	    // error_reporting(E_ALL | E_STRICT);\r')
    f.write("$ID=$_POST['ID'];\r")
    f.write("$sql=\"delete from "+table+" where ID=$ID\";")
    f.write("\r$sql=iconv('UTF-8','GB2312//IGNORE',$sql);\r// echo $sql;\r$result=mysql_query($sql,$conn);\rif ($result){\r	echo json_encode(array('msg'=>'success'));\r} else {\r	echo json_encode(array('msg'=>mysql_error()));\r}\r?>")
    f.close()

def search(list,table):
    f = open("E:/sql/search/"+table+".txt",'w')
    f.write("<select name=\"li\">\r")
    for li in list:
        f.write("<option value=\""+li[0]+"\">"+li[0]+"</option>\r")
    f.write("</select>\r")
    f.close()

conn = pymysql.connect(user='qdm112455407', passwd='mysqlfortest',
                 host='qdm112455407.my3w.com', db='qdm112455407_db')
cur = conn.cursor()
cur.execute("show tables")#表名
#DESCRIBE Admin 列名
table=copy.copy(cur)
for each in table:
    #print("DESCRIBE "+each[0])
    cur.execute("DESCRIBE "+each[0])
    search(cur,each[0])
    '''
    for each2 in cur:#单个的列名
        print(each2[0])
    '''
    print()

cur.close()    
conn.close()