import pymysql
import copy


def insert(tablename,curlist):
    colnumber=0
    
    f = open("E:/sql/insert/"+tablename+".php",'w')
    f.write('<?php\r//insert sql\rinclude "../../checksession.php";\rinclude "../../../conn.php";\r            // ini_set("display_errors", "On");\r    	    // error_reporting(E_ALL | E_STRICT);\r')


    countlist=copy.copy(curlist)
    for col in countlist:#post生成
        if col[0]!='ID':
            f.write("$"+col[0]+"=$_POST['"+col[0]+"'];\r")


    #组成sql
    countlist=copy.copy(curlist)

    f.write("$sql=\"insert into "+tablename+" (")

    for col in countlist:
        colnumber=colnumber+1
    countlist=copy.copy(curlist)
    count=1
    for col in countlist:#value前括号内的内容

        if col[0]!='ID':
            if count<colnumber:
                f.write(col[0]+",")
            else:
                f.write(col[0]+")")
        count=count+1
    f.write(" values (")

    countlist=copy.copy(curlist)
    count=1
    for col in countlist:#value后括号内的内容
        if col[0]!='ID':
            if col[1].count('int')>0:
                if count<colnumber:
                    f.write("$"+col[0]+",")
                else:
                    f.write("$"+col[0]+")\";")
            else:
                if count<colnumber:
                    f.write("'$"+col[0]+"',")
                else:
                    f.write("'$"+col[0]+"')\";")
        count=count+1

    #组成完毕

    #最后部分输出
    f.write("\r$sql=iconv('UTF-8','GB2312//IGNORE',$sql);\r// echo $sql;\r$result=mysql_query($sql,$conn);\rif ($result){\r	echo json_encode(array('msg'=>'success'));\r} else {\r	echo json_encode(array('msg'=>mysql_error()));\r}\r")

def update(tablename,curlist):
    f = open("E:/sql/update/"+tablename+".php",'w')
    f.write('<?php\r//update sql\rinclude "../../checksession.php";\rinclude "../../../conn.php";\r            // ini_set("display_errors", "On");\r    	    // error_reporting(E_ALL | E_STRICT);\r')
    countlist=copy.copy(curlist)
    for col in countlist:#post生成
        f.write("$"+col[0]+"=$_POST['"+col[0]+"'];\r")
    #组成sql
    countlist=copy.copy(curlist)

    f.write("$sql=\"update "+tablename+" set ")


    for col in countlist:#where 前的内容
        if col[0]!='ID':
            if col[1].count('int')>0:
                f.write(col[0]+"=$"+col[0]+" ")
            else:
                f.write(col[0]+"='$"+col[0]+"' ")
    f.write("where ID=$ID\";")

    #组成完毕

    #最后部分输出
    f.write("\r$sql=iconv('UTF-8','GB2312//IGNORE',$sql);\r// echo $sql;\r$result=mysql_query($sql,$conn);\rif ($result){\r	echo json_encode(array('msg'=>'success'));\r} else {\r	echo json_encode(array('msg'=>mysql_error()));\r}\r")

def delete(tablename,curlist):
    f = open("E:/sql/delete/"+tablename+".php",'w')
    f.write('<?php\r//delete sql\rinclude "../../checksession.php";\rinclude "../../../conn.php";\r            // ini_set("display_errors", "On");\r    	    // error_reporting(E_ALL | E_STRICT);\r')
    f.write('$sql="delete from '+tablename+' where ID=$ID";')
    f.write("\r$sql=iconv('UTF-8','GB2312//IGNORE',$sql);\r// echo $sql;\r$result=mysql_query($sql,$conn);\rif ($result){\r	echo json_encode(array('msg'=>'success'));\r} else {\r	echo json_encode(array('msg'=>mysql_error()));\r}\r")


conn = pymysql.connect(user='qdm112455407', passwd='mysqlfortest',host='qdm112455407.my3w.com', db='qdm112455407_db')#链接数据库
cur = conn.cursor()#生成游标
cur.execute("show tables")#表名
#DESCRIBE Admin 列名
table=copy.copy(cur)

for each in table:
   cur.execute("SHOW FULL COLUMNS FROM "+each[0])
   #insert(each[0],cur)
   delete(each[0],cur)
   print()


cur.close()    
conn.close()