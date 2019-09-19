import tornado.web
import tornado
import tornado.ioloop

import time
import uuid
import pymysql
import pyaes
import json
from remove_tags import *
from auth import *
from cross_origin import *
from cc_brand import *
from db import *

import hashlib



@jwtauth
class merchant_retrive(BaseHandler):
    def get(self):
        username = remove_tag(self.get_argument('username'))
        connection, cursor = db_connect()
        sql_select_Query = ("SELECT merchant.username,merchant.full_name,merchant.email,merchant.countrycode,merchant.phone,merchant.isGA,merchant_account.merchant_id,merchant_account.account_name,merchant_account.Role,merchant_account.currency,merchant_account.created FROM merchant INNER JOIN merchant_account ON merchant.username=merchant_account.username WHERE  merchant_account.Role='owner' AND merchant.username=cast(%s as char)")
        cursor.execute(sql_select_Query,(username,))
        records = cursor.fetchall()

        if records:
                
            result = {
                        "username" : records[0][0],
                        "full_name" :  str(records[0][1]),
                        "email" : str(records[0][2]),
                        "countrycode" :records[0][3],
                        "phone" : records[0][4],
                        "isGA" : records[0][5],
                        "merchant_id" : str(records[0][6]),
                        "account_name" :records[0][7],
                        "Role" : records[0][8],
                        "currency" : records[0][9],
                        "created" : str(records[0][10]),
                    }
            
            response = {"status": "success", "code": 200,
                        "data": result,
                        "message": ""}
            self.write(response)
        else:
            response = {
                "status": "error",
                    "code": 404,
                    "data": "null",
                    "message": "No more data available",
                }
            raise tornado.web.Finish(response)




@jwtauth
class list_merchant(BaseHandler):
    def get(self):
        created = remove_tag(self.get_argument('created', False))
        opration = remove_tag(self.get_argument('operation', False))
        # customerId =regex(remove_tag( self.get_argument('customerId', False)))
        limit = remove_tag(self.get_argument('limit', False))
        startingAfterId = remove_tag(self.get_argument('startingAfterId', False))
        endingBeforeId = remove_tag(self.get_argument('endingBeforeId', False))

        connection, cursor = db_connect()
        print('hello')
        print('aaa gyaaaaaa',endingBeforeId)
        sql_length_query = ("SELECT COUNT(*) FROM merchant INNER JOIN merchant_account ON merchant.username=merchant_account.username WHERE  merchant_account.Role='owner'")
        cursor.execute(sql_length_query)
        length = cursor.fetchall()

        len_records=length[0][0]
        #print("length",len_records)

        if limit ==False:
            limit=10
        else:
            limit=int(limit)
        if created:

            if opration=="lt" or opration=="lte" or opration=="gt" or opration=="gte":

                if opration == "lt":
                    sql_select_Query = ("SELECT merchant.username,merchant.full_name,merchant.email,merchant.countrycode,merchant.phone,merchant_account.created FROM merchant INNER JOIN merchant_account ON merchant.username=merchant_account.username WHERE merchant_account.created < %s AND merchant_account.Role='owner' ORDER BY merchant_account.created DESC LIMIT %s")
                elif opration == "lte":
                    sql_select_Query = ("SELECT merchant.username,merchant.full_name,merchant.email,merchant.countrycode,merchant.phone,merchant_account.created FROM merchant INNER JOIN merchant_account ON merchant.username=merchant_account.username WHERE merchant_account.created <= %s AND merchant_account.Role='owner' ORDER BY merchant_account.created DESC LIMIT %s")
                elif opration == "gt":
                    sql_select_Query = ("SELECT merchant.username,merchant.full_name,merchant.email,merchant.countrycode,merchant.phone,merchant_account.created FROM merchant INNER JOIN merchant_account ON merchant.username=merchant_account.username WHERE merchant_account.created > %s AND merchant_account.Role='owner' ORDER BY merchant_account.created DESC LIMIT %s")
                elif opration == "gte":
                    sql_select_Query = ("SELECT merchant.username,merchant.full_name,merchant.email,merchant.countrycode,merchant.phone,merchant_account.created FROM merchant INNER JOIN merchant_account ON merchant.username=merchant_account.username WHERE merchant_account.created >= %s AND merchant_account.Role='owner' ORDER BY merchant_account.created DESC LIMIT %s")

                cursor.execute(sql_select_Query, (float(created),int(limit)))
                records = cursor.fetchall()
                #print(records)

                connection.commit()
                # len_records = len(records)
                limit = len(records)

                if len(records)==limit and len(records)>0:
                    result=[]
                    for i in range(limit):
                        
                        data={
                                "username" : records[i][0],
                                "full_name" :  str(records[i][1]),
                                "email" : str(records[i][2]),
                                "countrycode" :records[i][3],
                                "phone" : records[i][4],
                                "created":str(records[i][5])
                            }
                        result.append(data)
                        

                    response = {"status": "success","code": 200,
                                "data": result,
                                "data_length":len_records,
                                "message": ""}
                    self.write(response)
                else:
                    response = {
                        "status": "error",
                        "code": 404,
                        "data": "",
                        "message": "No  data available",
                    }
                    raise tornado.web.Finish(response)

        # else:
        #     response = {
        #         "status": "error",
        #         "code": 404,
        #         "data": "null",
        #         "message": "Please provide created time",
        #     }
        #     self.write(response)

        

        if startingAfterId:

            sql_select_Query = ("SELECT created FROM merchant_account WHERE username =cast(%s as char) and Role='owner' ")
            cursor.execute(sql_select_Query, (startingAfterId))
            record = cursor.fetchall()
            sql_select_Query = ("SELECT merchant.username,merchant.full_name,merchant.email,merchant.countrycode,merchant.phone FROM merchant INNER JOIN merchant_account ON merchant.username=merchant_account.username WHERE merchant_account.created>%s AND merchant_account.Role='owner' ORDER BY merchant_account.created ASC LIMIT %s ")
            cursor.execute(sql_select_Query, (record[0][0],limit))
            records = cursor.fetchall()
            #print(records)
            results = []
            if records:
                for i in range(len(records)):
                    result = {
                                "username" : records[i][0],
                                "full_name" :  str(records[i][1]),
                                "email" : str(records[i][2]),
                                "countrycode" :records[i][3],
                                "phone" : records[i][4],
                            }
                    results.append(result)
                results = results[::-1]
                response = {"status": "success", "code": 200,
                            "data": results,
                            "message": ""}
                self.write(response)
            else:
                response = {
                    "status": "error",
                        "code": 404,
                        "data": "null",
                        "message": "No more data available",
                    }
                raise tornado.web.Finish(response)

        if endingBeforeId:
            print('aaa gyaaaaaa',endingBeforeId)

            sql_select_Query = ("SELECT created FROM merchant_account WHERE username =cast(%s as char) and Role='owner'")
            cursor.execute(sql_select_Query, (endingBeforeId))
            record = cursor.fetchall()
            sql_select_Query = ("SELECT merchant.username,merchant.full_name,merchant.email,merchant.countrycode,merchant.phone FROM merchant INNER JOIN merchant_account ON merchant.username=merchant_account.username WHERE merchant_account.created<%s AND merchant_account.Role='owner' ORDER BY merchant_account.created DESC LIMIT %s ")
            cursor.execute(sql_select_Query, (record[0][0],limit))
            records = cursor.fetchall()
            print('ye bhi aa gya',records)
            results = []
            if records:
                for i in range(len(records)):
                    result = {
                                "username" : records[i][0],
                                "full_name" :  str(records[i][1]),
                                "email" : str(records[i][2]),
                                "countrycode" :records[i][3],
                                "phone" : records[i][4],
                            }
                    results.append(result)
                response = {"status": "success", "code": 200,
                            "data": results,
                            "message": ""}
                self.write(response)
            else:
                response = {
                    "status": "error",
                        "code": 404,
                        "data": "null",
                        "message": "No more data available",
                    }
                raise tornado.web.Finish(response)