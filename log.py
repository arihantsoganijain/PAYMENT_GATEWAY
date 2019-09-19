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


@jwtauth
class log(BaseHandler):
    def get(self):
        log_id = regex(remove_tag(self.get_argument('log_id',False)))


        if log_id:
            connection, cursor = db_connect()

            sql_select_Query = "SELECT * FROM log WHERE log = cast(%s as char)"

            cursor.execute(sql_select_Query, (log_id,))
            records = cursor.fetchall()
            #print("card_rec----",records)
            if records:
                result={
                      "id" : records[0][0],
                      "created" : str(records[0][1]),
                      "method" : records[0][2],
                      "url" : records[0][3],
                      "status" :records[0][4],
                        "ip" : records[0][5],
                        "source" : str(records[0][6]),
                        "request_body" : records[0][7],
                        "response_body" : records[0][8],
                    }
                response = {"status": "success","code": 200,
                            "data": result,
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


@jwtauth
class com_log(BaseHandler):
    def get(self):
        id = regex(remove_tag(self.get_argument('chargeId',False)))


        if id:
            connection, cursor = db_connect()

            sql_select_Query = "SELECT log FROM event WHERE com_id = cast(%s as char)"

            cursor.execute(sql_select_Query, (id,))
            log_id = cursor.fetchall()
            if log_id:
                results=[]
                for j in range(len(log_id)):
                    sql_select_Query = "SELECT * FROM log WHERE log = cast(%s as char)"

                    cursor.execute(sql_select_Query, (log_id[j][0],))
                    records = cursor.fetchall()
                    #print("card_rec----",records)
                    if records:
                        for i in range(len(records)):
                            result={
                                "id" : records[i][0],
                                "created" : str(records[i][1]),
                                "method" : records[i][2],
                                "url" : records[i][3],
                                "status" :records[i][4],
                                    "ip" : records[i][5],
                                    "source" : str(records[i][6]),
                                    "request_body" : records[i][7],
                                    "response_body" : records[i][8],
                                }
                            results.append(result)
                    else:
                        response = {
                            "status": "error",
                            "code": 404,
                            "data": "",
                            "message": "data not available",
                        }
                        raise tornado.web.Finish(response)
                response = {"status": "success","code": 200,
                            "data": results,
                            "message": ""}
                self.write(response)
                
            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "",
                    "message": "Charge id not exit",
                }
                raise tornado.web.Finish(response)


@jwtauth
class cus_log(BaseHandler):
    def get(self):
        id = regex(remove_tag(self.get_argument('customerId',False)))
        csoid = regex(remove_tag(self.get_argument('csoId',False)))


        if id:
            connection, cursor = db_connect()

            sql_select_Query = "SELECT log FROM event WHERE customer_id = cast(%s as char)"

            cursor.execute(sql_select_Query, (id,))
            log_id = cursor.fetchall()
            if log_id:
                results=[]
                for j in range(len(log_id)):
                    sql_select_Query = "SELECT * FROM log WHERE log = cast(%s as char)"
                    cursor.execute(sql_select_Query, (log_id[j][0],))
                    records = cursor.fetchall()
                    #print("card_rec----",records)
                    if records:
                        for i in range(len(records)):
                            result={
                                "id" : records[i][0],
                                "created" : str(records[i][1]),
                                "method" : records[i][2],
                                "url" : records[i][3],
                                "status" :records[i][4],
                                    "ip" : records[i][5],
                                    "source" : str(records[i][6]),
                                    "request_body" : records[i][7],
                                    "response_body" : records[i][8],
                                }
                            results.append(result)
                    else:
                        response = {
                            "status": "error",
                            "code": 404,
                            "data": "",
                            "message": "data not available",
                        }
                        raise tornado.web.Finish(response)
                response = {"status": "success","code": 200,
                            "data": results,
                            "message": ""}
                self.write(response)
                
            else:
                response = {
                        "status": "error",
                        "code": 404,
                        "data": "",
                        "message": "customer has no log",
                    }
                raise tornado.web.Finish(response)
        elif csoid:
            connection, cursor = db_connect()

            sql_select_Query = "SELECT log FROM event WHERE com_id = cast(%s as char)"

            cursor.execute(sql_select_Query, (csoid,))
            log_id = cursor.fetchall()
            if log_id:
                results=[]
                for j in range(len(log_id)):
                    sql_select_Query = "SELECT * FROM log WHERE log = cast(%s as char)"
                    cursor.execute(sql_select_Query, (log_id[j][0],))
                    records = cursor.fetchall()
                    #print("card_rec----",records)
                    if records:
                        
                        for i in range(len(records)):
                            result={
                                "id" : records[i][0],
                                "created" : str(records[i][1]),
                                "method" : records[i][2],
                                "url" : records[i][3],
                                "status" :records[i][4],
                                    "ip" : records[i][5],
                                    "source" : str(records[i][6]),
                                    "request_body" : records[i][7],
                                    "response_body" : records[i][8],
                                }
                            results.append(result)
                    else:
                        response = {
                            "status": "error",
                            "code": 404,
                            "data": "",
                            "message": "data not available",
                        }
                        raise tornado.web.Finish(response)
                response = {"status": "success","code": 200,
                            "data": results,
                            "message": ""}
                self.write(response)
                
            else:
                response = {
                        "status": "error",
                        "code": 404,
                        "data": "",
                        "message": "customer has no log",
                    }
                raise tornado.web.Finish(response)


@jwtauth
class list_log(BaseHandler):
    def get(self):
        created = remove_tag(self.get_argument('created', False))
        operation = remove_tag(self.get_argument('operation', False))
        limit = remove_tag(self.get_argument('limit', False))
        startingAfterId = regex(remove_tag(self.get_argument('startingAfterId', False)))
        endingBeforeId = regex(remove_tag(self.get_argument('endingBeforeId', False)))

        connection, cursor = db_connect()

        sql_length_query = ("SELECT COUNT(*) FROM log")
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
                sql_select_Query = ("SELECT * FROM log WHERE created < %s ORDER BY created DESC LIMIT %s")
            elif operation == "lte":
                sql_select_Query = ("SELECT * FROM log WHERE created <= %s ORDER BY created DESC LIMIT %s")
            elif operation == "gt":
                sql_select_Query = ("SELECT * FROM log WHERE created > %s ORDER BY created DESC LIMIT %s")
            elif operation == "gte":
                sql_select_Query = ("SELECT * FROM log WHERE created >= %s ORDER BY created DESC LIMIT %s")

            cursor.execute(sql_select_Query, (float(created), int(limit)))
            records = cursor.fetchall()

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
                              "method" : records[i][2],
                              "url" : records[i][3],
                              "status" :records[i][4],
                                "ip" : records[i][5],
                                "source" : str(records[i][6]),
                                "request_body" : records[i][7],
                                "response_body" : records[i][8],
                            }
                        result.append(data)
                    else:
                        result.append({})

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

            sql_select_Query = ("SELECT * FROM log WHERE created > (SELECT created FROM log WHERE log=cast(%s as char)) ORDER BY created ASC LIMIT 10")
            cursor.execute(sql_select_Query, (startingAfterId))
            records = cursor.fetchall()
            results = []
            if records:
                for i in range(len(records)):
                    result ={
                          "id" : records[i][0],
                          "created" : str(records[i][1]),
                          "method" : records[i][2],
                          "url" : records[i][3],
                          "status" :records[i][4],
                            "ip" : records[i][5],
                            "source" : str(records[i][6]),
                            "request_body" : records[i][7],
                            "response_body" : records[i][8],
                        }
                    results.append(result)
                results = results[::-1]

                response = {"status": "success","code": 200,
                            "data": results,
                            "data_length": len_records,
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

        if endingBeforeId:

            sql_select_Query = ("SELECT * FROM log WHERE created < (SELECT created FROM log WHERE log=cast(%s as char)) ORDER BY created DESC LIMIT 10")
            cursor.execute(sql_select_Query, (endingBeforeId))
            records = cursor.fetchall()
            results = []

            if records:
                for i in range(len(records)):
                    result = {
                          "id" : records[i][0],
                          "created" : str(records[i][1]),
                          "method" : records[i][2],
                          "url" : records[i][3],
                          "status" :records[i][4],
                            "ip" : records[i][5],
                            "source" : str(records[i][6]),
                            "request_body" : records[i][7],
                            "response_body" : records[i][8],
                        }
                    results.append(result)

                response = {"status": "success","code": 200,
                            "data": results,
                            "data_length": len_records,
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
class log_filter(BaseHandler):
    def post(self):
        start_date = remove_tag(self.get_argument('start_date', False))
        last_date = remove_tag(self.get_argument('last_date', False))
        chargeId =regex(remove_tag( self.get_argument('chargeId', False)))
        customerId = remove_tag(self.get_argument('customerId', False))
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


        # #print(merchant_id,'merchant_id')
        connection, cursor = db_connect()

        query = f"SELECT * FROM log INNER JOIN event ON log.log = event.log WHERE log.created<{time}"
        count_query = f"SELECT COUNT(*) FROM log INNER JOIN event ON log.log = event.log WHERE log.created<{time}"
        if pre_time:
            query = f"SELECT * FROM log INNER JOIN event ON log.log = event.log WHERE log.created>{pre_time}"

        if start_date and last_date:
            if query[-5:] == "WHERE":
                add = f" log.created BETWEEN {start_date} AND {last_date}"
            else:
                add = f" AND log.created BETWEEN {start_date} AND {last_date}"

            query = query + add
            count_query=count_query+add

        if chargeId:
            if query[-5:] == "WHERE":
                add = f" event.com_id = '{chargeId}'"
            else:
                add = f" AND event.com_id = '{chargeId}'"

            query = query + add
            count_query=count_query+add

        if customerId:
            if query[-5:] == "WHERE":
                add = f" event.customer_id = '{customerId}'"
            else:
                add = f" AND event.customer_id = '{customerId}'"
        
            query = query + add
            count_query=count_query+add
        if time:
            if query[-5:] == "WHERE":
                add = f" ORDER BY log.created DESC LIMIT {limit}"

            else:
                add = f"  ORDER BY log.created DESC LIMIT {limit}"
        if pre_time:
            if query[-5:] == "WHERE":
                add = f" ORDER BY log.created ASC LIMIT {limit}"

            else:
                add = f"  ORDER BY log.created ASC LIMIT {limit}"
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
                        "id" : records[i][0],
                        "created" : str(records[i][1]),
                        "method" : records[i][2],
                        "url" : records[i][3],
                        "status" :records[i][4],
                        "ip" : records[i][5],
                        "source" : str(records[i][6]),
                        "request_body" : records[i][7],
                        "response_body" : records[i][8],
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
        