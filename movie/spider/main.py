import requests
import pymysql


def movie_print(m):
    print m['title']
    print m['score']
    for m_actor in m['actors']:
        print m_actor,
    print ' '
    print m['release_date']
    print m['cover_url']
    for m_type in m['types']:
        print m_type,
    print ' '
    for m_regions in m['regions']:
        print m_regions,
    print ' '
    print ' '


conn = pymysql.connect(user='zxmysql', passwd='ZX123456zx!', host='rm-wz9h86151kd3mlx1io.mysql.rds.aliyuncs.com',
                       db='spider', charset="utf8")


def movie_insert(m):
    str_actor = ''
    for m_actor in m['actors']:
        str_actor = str_actor + ' ' + m_actor
    str_type = ''
    for m_type in m['types']:
        str_type = str_type + ' ' + m_type

    str_regions = ''
    for m_regions in m['regions']:
        str_regions = str_regions + ' ' + m_regions

    cur = conn.cursor()
    sql = 'insert into ' \
          'movie (`title`,`score`,`actors`,`release_date`,`cover_url`,`types`,`regions`) ' \
          'values (%s,%s,%s,%s,%s,%s,%s)'
    try:
        cur.execute(sql, (
        m['title'].encode('utf-8'), m['score'].encode('utf-8'), str_actor, m['release_date'].encode('utf-8'),
        m['cover_url'].encode('utf-8'), str_type, str_regions))
        conn.commit()
    except EnvironmentError:
        print EnvironmentError
    cur.close()


search_type = 1
search_max = 100
search_min = 90
search_start = 0
search_limit = 20

url = 'https://movie.douban.com/j/chart/top_list?type=' + str(search_type) + '&interval_id=' + str(
    search_max) + '%3A' + str(search_min) + '&action=&start=' + str(search_start) + '&limit=' + str(search_limit)

print url

data = requests.get(url=url)

arr = data.json()

for movie in arr:
    movie_print(movie)
    movie_insert(movie)
