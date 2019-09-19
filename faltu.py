import time
import requests
from db import *
# #
# # card_data = {'customerId': "ebefb1ad-681d-11e9-afe7-e0d55e366d75"}
# #
# #
# # headers = {'content-type': 'application/json',"Authorization":"bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyaWQiOiJwIiwiYSI6eyIyIjp0cnVlfSwiZXhwIjo1MTU1Njg2MTYwMH0.O23ncJrpB5ZhDVo1LoXvKkKW5Dr832bCaA8rLNtB_Ps" }
# # count=0
# # stime=time.time()
# # print(stime)
# # while True:
# #     myResponse = requests.post("http://localhost:8888/api/v1/customer/create",card_data,headers)
# #     if myResponse:
# #
# #         count+=1
# #         print(myResponse,"--",count)
# #         continue
# #     else:
# #         etime=time.time()
# #         print(myResponse,count,etime-stime)
# #         break
# import pymysql
#
# connection, cursor = db_connect()
# # sql_select_Query = ("SELECT * FROM charge WHERE id=%s")
# sql_select_Query=("SELECT * FROM log ")
# cursor.execute(sql_select_Query)
# records = cursor.fetchall()
# print("----....",records)


# a="bad"
# b = "gud"
# c={a:b}
# print(c,type(c))

connection, cursor = db_connect()
# sql_length_query = ("SELECT merchant_id FROM merchant_account")
# cursor.execute(sql_length_query)
# length = cursor.fetchall()

for i in range(35):
    
    sql_length_query = ("DELETE FROM merchant_account WHERE Role='owner' LIMIT 1")
    cursor.execute(sql_length_query)
    connection.commit()
    