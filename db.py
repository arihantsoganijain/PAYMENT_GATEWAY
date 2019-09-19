import pymysql
from setup import *


HOST=HOST
user=user
paswd=paswd
db=db



def db_connect():
    connection = pymysql.connect(host=HOST, user=user, password=paswd, db=db)
    cursor = connection.cursor()
    return connection,cursor


def sql_connect():
    connection = pymysql.connect(host=HOST, user=user, password=paswd)
    cursor = connection.cursor()
    return connection,cursor