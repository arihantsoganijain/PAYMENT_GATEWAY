import tornado.web
import tornado
import tornado.ioloop
import pyaes
import time
import uuid
import pymysql
import json
from remove_tags import *
from auth import *
from cross_origin import *
from db import *
import datetime
from datetime import timedelta
import time
import hashlib



@jwtauth
class admin_dashboard(BaseHandler):

    def get(self):
        try:
            connection, cursor = db_connect()

            sql_length_query = ("SELECT COUNT(*) FROM customers ")
            cursor.execute(sql_length_query,)
            length = cursor.fetchall()
            len_customer_created = length[0][0]
            #print("len_customer_created", len_customer_created)

            sql_length_query = ("SELECT COUNT(*) FROM charge WHERE captured=1")
            cursor.execute(sql_length_query)
            length = cursor.fetchall()
            len_successfull_payments = length[0][0]
            #print("len_successfull_payments", len_successfull_payments)

            sql_length_query = ("SELECT COUNT(*) FROM charge WHERE refunded=1")
            cursor.execute(sql_length_query, )
            length = cursor.fetchall()
            len_chargebacks = length[0][0]
            #print("len_chargebacks", len_chargebacks)

            sql_length_query = ("SELECT COUNT(*) FROM subscription")
            cursor.execute(sql_length_query)
            length = cursor.fetchall()
            len_subscriptions = length[0][0]
            #print("len_subscriptions", len_subscriptions)

            


            response = {"customer_created":len_customer_created,
                        "successfull_payments":len_successfull_payments,
                        "chargebacks":len_chargebacks,
                        "subscriptions":len_subscriptions}

            response = {"status": "success", "code": 200,
                        "data": response,
                        "message": "dashboard data"}

            self.write(response)


        except:
            response = {
                "status": "error",
                "code": 400,
                "data": "null",
                "message": "error",
            }

            raise tornado.web.Finish(response)

@jwtauth
class admin_graph(BaseHandler):

    def get(self):
        connection, cursor = db_connect()
        todaydate=datetime.datetime.now()
        # #print(todaydate.date()-timedelta(days=15))
        result=[]
        result1=[]
        for i in range(15):
            date=todaydate.date()-timedelta(days=i)
            date1 = todaydate.date() - timedelta(days=i+1)
            data=str(date)
            data1 = str(date1)
            # #print((data[0:4]))
            d1 = datetime.datetime(int(data[0:4]),int(data[5:7]), int(data[-2:]))
            d2 = datetime.datetime(int(data1[0:4]), int(data1[5:7]), int(data1[-2:]))
            unixtime = time.mktime(d1.timetuple())
            unixtime1 = time.mktime(d2.timetuple())
            # #print(d1,type(d1))
            #print(unixtime,unixtime1)
            date=datetime.datetime.fromtimestamp(unixtime1).strftime('%Y-%m-%d')
            
            sql_length_query = ("SELECT COUNT(*) FROM customers WHERE created BETWEEN %s AND %s")
            cursor.execute(sql_length_query, (unixtime1,unixtime))
            length = cursor.fetchall()
            #print(length)
            data={"date":str(date),"cus_count":str(length[0][0])}
            result.append(data)
            sql_length_query = ("SELECT COUNT(*) FROM charge WHERE  created BETWEEN %s AND %s")
            cursor.execute(sql_length_query, (unixtime1,unixtime))
            length1 = cursor.fetchall()
            #print(length1)
            data1={"date":str(date),"charge_count":str(length1[0][0])}
            result1.append(data1)
        #print(result)
        response = {"status": "success", "code": 200,
                    "data": result,
                    "data1": result1,
                    "message": "dashboard graph"}
        self.write(response)
                
