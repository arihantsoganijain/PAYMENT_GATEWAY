import tornado.web
import tornado
import tornado.ioloop

import time
import uuid
import pymysql
import pyaes
import json
import hashlib
from remove_tags import *
from auth import *
from cross_origin import *
from db import *

@jwtauth
class event(BaseHandler):
    def get(self):
        event_id = regex(remove_tag(self.get_argument('eventId',False)))
        id = regex(remove_tag(self.get_argument('id',False)))

        if event_id:
            connection, cursor = db_connect()

            sql_select_Query = "SELECT * FROM event INNER JOIN data ON (data.data_id = event.data) INNER JOIN cards ON (cards.card_id = data.card) WHERE event.event_id = cast(%s as char)"

            cursor.execute(sql_select_Query, (event_id,))
            records = cursor.fetchall()
            #print("card_rec----",records)
            if records:
                result={
                          "id" : records[0][0],
                          "created" : str(records[0][1]),
                          "objectType" : records[0][2],
                          "type" : records[0][3],
                          "data" : {
                            "id" : records[0][9],
                            "created" : str(records[0][10]),
                            "objectType" : records[0][11],
                            "amount" : records[0][12],
                            "currency" : records[0][13],
                            "description" : records[0][14],
                            "card" : {
                                "id" : records[0][20],
                                "created" : str(records[0][21]),
                                "objectType" :records[0][22],
                                "first6" : records[0][23],
                                "last4" : records[0][24],
                                "fingerprint" : records[0][25],
                                "expMonth" : records[0][26],
                                "expYear" : records[0][27],
                                "cardholderName" : records[0][28],
                                "customerId" : records[0][29],
                                "brand" : records[0][30],
                                "type" : records[0][31],
                                "country" : records[0][32]
                              },
                            "captured" : records[0][16],
                            "refunded" : records[0][17],
                            "disputed" : records[0][18]
                          },
                          "log" : records[0][5]
                        }
                response = {"status": "success","code": 200,
                            "data": result,
                            "message": ""}
                self.write(response)
            elif records==():
                sql_select_Query = "SELECT * FROM event INNER JOIN data ON (data.data_id = event.data) WHERE event.event_id = cast(%s as char)"

                cursor.execute(sql_select_Query, (event_id,))
                records = cursor.fetchall()
                if records:
                    result = {
                        "id": records[0][0],
                        "created": str(records[0][1]),
                        "objectType": records[0][2],
                        "type": records[0][3],
                        "data": {
                            "id": records[0][9],
                            "created": str(records[0][10]),
                            "objectType": records[0][11],
                            "amount": records[0][12],
                            "currency": records[0][13],
                            "description": records[0][14],
                            "card":records[0][18],
                             "captured": records[0][16],
                             "refunded": records[0][17],
                             "disputed": records[0][18]
                             },
                             "log": records[0][5]
                    }
                    response = {"status": "success","code": 200,
                                "data": result,
                                "message": ""}
                    self.write(response)
                else:
                    response = {
                        "status": "error",
                        "code": 404,
                        "data": "null",
                        "message": "eventId not exist",
                    }
                    raise tornado.web.Finish(response)
            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "null",
                    "message": "eventId not exist",
                }
                raise tornado.web.Finish(response)
        elif id:
            connection, cursor = db_connect()

            sql_select_Query = "SELECT * FROM event INNER JOIN data ON (data.data_id = event.data) INNER JOIN cards ON (cards.card_id = data.card) WHERE event.data = cast(%s as char)"

            cursor.execute(sql_select_Query, (id,))
            records = cursor.fetchall()
            #print("card_rec----", records)
            if records:
                result = {
                    "id": records[0][0],
                    "created": str(records[0][1]),
                    "objectType": records[0][2],
                    "type": records[0][3],
                    "data": {
                        "id": records[0][9],
                        "created": records[0][10],
                        "objectType": records[0][11],
                        "amount": records[0][12],
                        "currency": records[0][13],
                        "description": records[0][14],
                        "card": {
                            "id": records[0][20],
                            "created": str(records[0][21]),
                            "objectType": records[0][22],
                            "first6": records[0][23],
                            "last4": records[0][24],
                            "fingerprint": records[0][25],
                            "expMonth": records[0][26],
                            "expYear": records[0][27],
                            "cardholderName": records[0][28],
                            "customerId": records[0][29],
                            "brand": records[0][30],
                            "type": records[0][31],
                            "country": records[0][32]
                        },
                        "captured": records[0][16],
                        "refunded": records[0][17],
                        "disputed": records[0][18]
                    },
                    "log": records[0][5]
                }
                response = {"status": "success", "code": 200,
                            "data": result,
                            "message": ""}
                self.write(response)
            elif records == ():
                sql_select_Query = "SELECT * FROM event INNER JOIN data ON (data.data_id = event.data) WHERE event.data = cast(%s as char)"

                cursor.execute(sql_select_Query, (id,))
                records = cursor.fetchall()
                if records:
                    result = {
                        "id": records[0][0],
                        "created": str(records[0][1]),
                        "objectType": records[0][2],
                        "type": records[0][3],
                        "data": {
                            "id": records[0][9],
                            "created": str(records[0][10]),
                            "objectType": records[0][11],
                            "amount": records[0][12],
                            "currency": records[0][13],
                            "description": records[0][14],
                            "card": records[0][18],
                            "captured": records[0][16],
                            "refunded": records[0][17],
                            "disputed": records[0][18]
                        },
                        "log": records[0][5]
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
                        "message": "id not exist",
                    }
                    raise tornado.web.Finish(response)
            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "null",
                    "message": "id not exist",
                }
                raise tornado.web.Finish(response)


        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "null",
                "message": "Bad request",
            }
            raise tornado.web.Finish(response)

@jwtauth
class com_event(BaseHandler):
    def get(self):
        id = regex(remove_tag(self.get_argument('chargeId',False)))
        csoId = regex(remove_tag(self.get_argument('csoId',False)))

        if id:
            connection, cursor = db_connect()

            sql_select_Query = "SELECT * FROM event INNER JOIN data ON (data.data_id = event.data) INNER JOIN cards ON (cards.card_id = data.card) WHERE event.com_id = cast(%s as char)"

            cursor.execute(sql_select_Query, (id,))
            records = cursor.fetchall()
            print(records,"wwwwwwwwwwwwww")
            #print("card_rec----",records)
            if records:
                results=[]
                for i in range(len(records)):

                    result={
                          "id" : records[i][0],
                          "created" : str(records[i][1]),
                          "objectType" : records[i][2],
                          "type" : records[i][3],
                          "data" : {
                            "id" : records[i][9],
                            "created" : str(records[i][10]),
                            "objectType" : records[i][11],
                            "amount" : records[i][12],
                            "currency" : records[i][13],
                            "description" : records[i][14],
                            "card" : {
                                "id" : records[i][20],
                                "created" : str(records[i][21]),
                                "objectType" :records[i][22],
                                "first6" : records[i][23],
                                "last4" : records[i][24],
                                "fingerprint" : records[i][25],
                                "expMonth" : records[i][26],
                                "expYear" : records[i][27],
                                "cardholderName" : records[i][28],
                                "customerId" : records[i][29],
                                "brand" : records[i][30],
                                "type" : records[i][31],
                                "country" : records[i][32]
                              },
                            "captured" : records[i][16],
                            "refunded" : records[i][17],
                            "disputed" : records[i][18]
                          },
                          "log" : records[i][5]
                        }
                    results.append(result)
                response = {"status": "success","code": 200,
                            "data": results,
                            "message": ""}
                self.write(response)
            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "null",
                    "message": "data not available",
                }
                raise tornado.web.Finish(response)
        if csoId:
            connection, cursor = db_connect()

            sql_select_Query = "SELECT * FROM event INNER JOIN data ON (data.data_id = event.data) WHERE event.com_id = cast(%s as char)"

            cursor.execute(sql_select_Query, (csoId,))
            records = cursor.fetchall()
            #print("card_rec----",records)
            if records:
                results=[]
                for i in range(len(records)):
                    result={
                          "id" : records[i][0],
                          "created" : str(records[i][1]),
                          "objectType" : records[i][2],
                          "type" : records[i][3],
                          "data" : {
                            "id" : records[i][9],
                            "created" : str(records[i][10]),
                            "objectType" : records[i][11],
                            "amount" : records[i][12],
                            "currency" : records[i][13],
                            "description" : records[i][14],
                          "log" : records[i][5]
                        }}
                    results.append(result)
                response = {"status": "success","code": 200,
                            "data": results,
                            "message": ""}
                self.write(response)
            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "null",
                    "message": "data not available",
                }
                raise tornado.web.Finish(response)

@jwtauth
class cus_event(BaseHandler):
    def get(self):
        id = regex(remove_tag(self.get_argument('customerId',False)))

        if id:
            connection, cursor = db_connect()

            sql_select_Query = "SELECT * FROM event WHERE customer_id = cast(%s as char)"

            cursor.execute(sql_select_Query, (id,))
            records = cursor.fetchall()
            #print("card_rec----",records)
            if records:
                results=[]
                for i in range(len(records)):

                    result={
                          "id" : records[i][0],
                          "created" : str(records[i][1]),
                          "objectType" : records[i][2],
                          "type" : records[i][3],
                          # "data" : {
                          #   "id" : records[i][9],
                          #   "created" : str(records[i][10]),
                          #   "objectType" : records[i][11],
                          #   "amount" : records[i][12],
                          #   "currency" : records[i][13],
                          #   "description" : records[i][14],
                          #   "card" : {
                          #       "id" : records[i][20],
                          #       "created" : str(records[i][21]),
                          #       "objectType" :records[i][22],
                          #       "first6" : records[i][23],
                          #       "last4" : records[i][24],
                          #       "fingerprint" : records[i][25],
                          #       "expMonth" : records[i][26],
                          #       "expYear" : records[i][27],
                          #       "cardholderName" : records[i][28],
                          #       "customerId" : records[i][29],
                          #       "brand" : records[i][30],
                          #       "type" : records[i][31],
                          #       "country" : records[i][32]
                          #     },
                          #   "captured" : records[i][16],
                          #   "refunded" : records[i][17],
                          #   "disputed" : records[i][18]
                          # },
                          "log" : records[i][5]
                        }
                    results.append(result)
                response = {"status": "success","code": 200,
                            "data": results,
                            "message": ""}
                self.write(response)
            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "null",
                    "message": "data not available",
                }
                raise tornado.web.Finish(response)


@jwtauth
class list_event(BaseHandler):
    def get(self):
        created = remove_tag(self.get_argument('created', False))
        operation = remove_tag(self.get_argument('operation', False))
        limit = remove_tag(self.get_argument('limit', False))
        startingAfterId = regex(remove_tag(self.get_argument('startingAfterId', False)))
        endingBeforeId = regex(remove_tag(self.get_argument('endingBeforeId', False)))

        connection, cursor = db_connect()

        sql_length_query = ("SELECT COUNT(*) FROM event")
        cursor.execute(sql_length_query)
        length = cursor.fetchall()

        len_records = length[0][0]
        #print("length", len_records)


        if int(limit) == False:
            limit = 10
        elif int(limit)>100:
            limit=100

        if operation == "lt" or operation == "lte" or operation == "gt" or operation == "gte" and created:

            if operation == "lt":
                sql_select_Query = ("SELECT * FROM event INNER JOIN data ON event.data = data.data_id WHERE event.created < %s ORDER BY event.created DESC LIMIT %s")
            elif operation == "lte":
                sql_select_Query = ("SELECT * FROM event INNER JOIN data ON event.data = data.data_id WHERE event.created <= %s ORDER BY event.created DESC LIMIT %s")
            elif operation == "gt":
                sql_select_Query = ("SELECT * FROM event INNER JOIN data ON event.data = data.data_id WHERE event.created > %s ORDER BY event.created DESC LIMIT %s")
            elif operation == "gte":
                sql_select_Query = ("SELECT * FROM event INNER JOIN data ON event.data = data.data_id WHERE event.created >= %s ORDER BY event.created DESC LIMIT %s")

            cursor.execute(sql_select_Query, (float(created), int(limit)))
            records = cursor.fetchall()
            #print(records)
            connection.commit()
            # len_records = len(records)
            limit = len(records)
            if len(records) == int(limit) and len(records)>0:

                result = []
                for i in range(int(limit)):
                    if records[i] != ():
                        data = {
                              "id" : records[i][0],
                              "created" : str(records[i][1]),
                              "objectType" : records[i][2],
                              "type" : records[i][3],
                              "data" : {
                                "id" : records[i][9],
                                "created" : str(records[i][10]),
                                "objectType" : records[i][11],
                                "amount" : records[i][12],
                                "currency" : records[i][13],
                                "description" : records[i][14],
                                "card" : records[i][15],
                                "captured" : records[i][16],
                                "refunded" : records[i][17],
                                "disputed" : records[i][18]
                              },
                              "log" : records[i][5]
                            }
                        result.append(data)
                    else:
                        result.append({})
                #print("result---------------",result)
                response = {"status": "success","code": 200,
                            "data": result,
                            "data_length": len_records,
                            "message": ""}
                self.write(response)
            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "",
                    "message": "data not available",
                }
                raise tornado.web.Finish(response)

        if startingAfterId:

            sql_select_Query = ("SELECT * FROM event INNER JOIN data ON event.data = data.data_id WHERE event.created > (SELECT event.created FROM event WHERE event.event_id=cast(%s as char)) ORDER BY event.created ASC LIMIT 10")
            cursor.execute(sql_select_Query, (startingAfterId))
            data_records = cursor.fetchall()
            results = []
            for i in range(len(data_records)):
                result ={
                              "id" : data_records[i][0],
                              "created" : str(data_records[i][1]),
                              "objectType" : data_records[i][2],
                              "type" : data_records[i][3],
                              "data" :{
                                "id" : data_records[i][9],
                                "created" : str(data_records[i][10]),
                                "objectType" : data_records[i][11],
                                "amount" : data_records[i][12],
                                "currency" : data_records[i][13],
                                "description" : data_records[i][14],
                                "card" : data_records[i][15] ,
                                "captured" : data_records[i][16],
                                "refunded" : data_records[i][17],
                                "disputed" : data_records[i][18]
                              },
                              "log" : data_records[i][5]
                            }
                results.append(result)
            results = results[::-1]

            response = {"status": "success","code": 200,
                        "data": results,
                        "data_length": len_records,
                        "message": ""}
            self.write(response)

        if endingBeforeId:

            sql_select_Query = ("SELECT * FROM event INNER JOIN data ON event.data = data.data_id WHERE event.created < (SELECT event.created FROM event WHERE event.event_id=cast(%s as char)) ORDER BY event.created DESC LIMIT 10")
            cursor.execute(sql_select_Query, (endingBeforeId))
            data_records = cursor.fetchall()
            results = []
            for i in range(len(data_records)):
                result = {
                    "id": data_records[i][0],
                    "created": str(data_records[i][1]),
                    "objectType": data_records[i][2],
                    "type": data_records[i][3],
                    "data": {
                        "id": data_records[i][9],
                        "created": str(data_records[i][10]),
                        "objectType": data_records[i][11],
                        "amount": data_records[i][12],
                        "currency": data_records[i][13],
                        "description": data_records[i][14],
                        "card": data_records[i][15],
                        "captured": data_records[i][16],
                        "refunded": data_records[i][17],
                        "disputed": data_records[i][18]
                    },
                    "log": data_records[0][5]
                }
                results.append(result)

            response = {"status": "success","code": 200,
                        "data": results,
                        "data_length": len_records,
                        "message": ""}
            self.write(response)

# class event_filter(BaseHandler):
#     def get(self):
#         first_date = remove_tag(self.get_argument('first_date', False))
#         last_date = remove_tag(self.get_argument('last_date', False))
#         charge_id = remove_tag(self.get_argument('charge_id', False))
#         customerId = regex(remove_tag(self.get_argument('customerId', False)))
@jwtauth
class event_filter(BaseHandler):
    def post(self):
        start_date = remove_tag(self.get_argument('start_date', False))
        last_date = remove_tag(self.get_argument('last_date', False))
        chargeId =regex(remove_tag( self.get_argument('chargeId', False)))
        customerId = remove_tag(self.get_argument('customerId', False))
        type = remove_tag(self.get_argument('type', False))
        token = self.request.headers.get('Authorization')
        # m_id = remove_tag(self.get_argument('m_id'))
        limit=self.get_argument('limit', False)
        time=self.get_argument('time', False)
        pre_time=self.get_argument('pre_time', False)

        if limit ==False:
            limit=10
        else:
            limit=int(limit)
        
        if limit>100:
            limit=100

        
        connection, cursor = db_connect()

        query = f"SELECT * FROM event WHERE created<{time}"
        count_query = f"SELECT COUNT(*) FROM event WHERE created<{time}"
        if pre_time:
            query = f"SELECT * FROM event WHERE created>{pre_time}"
        if start_date and last_date:
            if query[-5:] == "WHERE":
                add = f" created BETWEEN {start_date} AND {last_date}"
            else:
                add = f" AND created BETWEEN {start_date} AND {last_date}"

            query = query + add
            count_query=count_query+add

        if chargeId:
            if query[-5:] == "WHERE":
                add = f" com_id = '{chargeId}'"
            else:
                add = f" AND com_id = '{chargeId}'"

            query = query + add
            count_query=count_query+add

        if customerId:
            if query[-5:] == "WHERE":
                add = f" customer_id = '{customerId}'"
            else:
                add = f" AND customer_id = '{customerId}'"
        
            query = query + add
            count_query=count_query+add
        if time:
            if query[-5:] == "WHERE":
                add = f" ORDER BY created DESC LIMIT {limit}"

            else:
                add = f" ORDER BY created DESC LIMIT {limit}"
        if pre_time:
            if query[-5:] == "WHERE":
                add = f" ORDER BY created ASC LIMIT {limit}"

            else:
                add = f" ORDER BY created ASC LIMIT {limit}"
        #print(add,"sdfgsdf")
        query = query + add
        #print("query",query)
        cursor.execute(query)
        records = cursor.fetchall()
        cursor.execute(count_query)
        count = cursor.fetchall()
        if records:
            results=[]
            for i in range(len(records)):
                result = {
                "id": records[i][0],
                "created": str(records[i][1]),
                "objectType": records[i][2],
                "type": records[i][3],
                "data": records[i][4],
                "log": records[0][5]
                }
                results.append(result)
            if pre_time:
                results=results[::-1]
            response = {"status": "success","code": 200,
                        "data": results,
                        "data_length":count[0][0],
                        "message": ""}
            self.write(response)
        else:
            response = {
                "status": "error",
                "code": 404,
                "data": "",
                "message": "data not available",
            }
            raise tornado.web.Finish(response)
        