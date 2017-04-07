import requests
import os
import time

t=0
while 1:
    try:
        r = requests.get(url='https://www.baidu.com', timeout=5)
        t=0
        time.sleep(20)
    except:
        t+=1
        if t>3:
            os.system('shutdown -s')


