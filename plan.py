import tornado.web
import tornado
import tornado.ioloop

import time
import uuid
import pymysql
import json
from remove_tags import *
import time
from cross_origin import *
from auth import *
import urllib
from db import *



class BaseHandler1(tornado.web.RequestHandler):

    def set_default_headers(self):
        #print("setting headers!!!")
        self.set_header("Access-Control-Allow-Origin", "*")
        # self.add_header('Access-Control-Allow-Origin', self.request.headers.get('Origin', '*'))
        self.set_header('Access-Control-Allow-Methods', 'POST, GET')
        # self.add_header('Access-Control-Request-Method', 'GET')
        self.set_header('Access-Control-Allow-Headers', 'Content-Type')
        # self.add_header('Access-Control-Allow-Headers', 'X-Requested-With')
        self.set_header("Access-Control-Allow-Credentials", "false")
        # self.set_header('Access-Control-Max-Age', '86400')

        self.set_header("Access-Control-Allow-Headers", "browser,ipaddress,platform,x-requested-with,access-control-allow-origin,X-PINGOTHER,authorization")
        #print("set headers!!!")

    def post(self):
        self.write('some post')

    def get(self):
        self.write('some get')

@jwtauth
class plan(BaseHandler1):
    def post(self):

        data = self.request.body

        amount = remove_tag(self.get_argument('amount'))
        currency = remove_tag(self.get_argument('currency'))
        interval = remove_tag(self.get_argument('interval'))
        name = remove_tag(self.get_argument('name'))
        intervalCount = remove_tag(self.get_argument('intervalCount', False))
        billingCycles = remove_tag(self.get_argument('billingCycles', False))
        trialPeriodDays = remove_tag(self.get_argument('trialPeriodDays', False))
        recursTo = remove_tag(self.get_argument('recursTo', False))
        metadata = remove_tag(self.get_argument('metadata', False))
        #print(data,type(data))

        if amount and currency and interval and name:
            if interval not in ['hour', 'day', 'week', 'month', 'year']:
                self.write("please give a valid interval")
            else:
                connection, cursor = db_connect()

                #print(metadata,type(metadata))

                plan_id = "plan_" + str(uuid.uuid1())
                created = time.time()
                if trialPeriodDays==False:
                    trialPeriodDays=0
                if intervalCount==False:
                    intervalCount=1
                if billingCycles==False:
                    billingCycles="null"

                sql_plan = "INSERT INTO plan(plan_id ,created,objectType ,amount ,currency ,intervals ,intervalCount ,billingCycles,name ,trialPeriodDays ,recursTo,metadata,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                cursor.execute(sql_plan,(str(plan_id) ,float(created),"plan",float(amount) ,str(currency) ,str(interval) ,int(intervalCount) ,str(billingCycles),str(name) ,int(trialPeriodDays) ,str(recursTo),str(metadata),"admin"))
                connection.commit()

                sql_select_Query = "SELECT * FROM plan WHERE plan_id=cast(%s as char) "
                cursor.execute(sql_select_Query, (str(plan_id),))
                records = cursor.fetchall()
                #print(records)
                result={
                      "id" : records[0][0],
                      "created" : str(records[0][1]),
                      "objectType" : records[0][2],
                      "amount" : records[0][3],
                      "currency" : records[0][4],
                      "interval" : records[0][5],
                      "intervalCount" : records[0][6],
                      "name" : records[0][8],
                      "trialPeriodDays" : records[0][9]
                    }
                type_event = "PLAN_CREATED"
                id = "event_" + str(uuid.uuid1())
                data = "char_" + str(uuid.uuid1())
                log = "log_" + str(uuid.uuid1())
                created = time.time()

                url = "/api/v1/plan/create"
                platform = self.request.headers.get('platform')
                ipaddress = self.request.headers.get('ipaddress')

                request_body= {"amount":amount,"currency":currency,"interval":interval,"name":name,
                "intervalCount":intervalCount,"billingCycles":billingCycles,
                "trialPeriodDays":trialPeriodDays,"recursTo":recursTo,"metadata":metadata}

                Insert_log = (
                    "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_log, (str(log), float(created), "post", url, int(200), str(ipaddress), str(platform), str(request_body), str(result),"admin"))


                Insert_event = (
                    "INSERT INTO event(event_id ,created ,objectType ,type ,data ,log,com_id,customer_id,merchant_id ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_event, (id, created, "event", type_event, data, log,result["id"],"admin","admin"))

                Insert_data = (
                    "INSERT INTO data(data_id ,created ,objectType ,amount ,currency ,merchant_id) VALUES (%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_data, (
                    data, created, "plan_create", float(records[0][3]), records[0][4],"admin"))
                connection.commit()

                response = {"status": "success","code": 200,
                            "data": result,
                            "message": "plan created successfully"}
                self.write(response)
        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "null",
                "message": "Bad REquest",
            }
            raise tornado.web.Finish(response)



    def get(self):
        plan_id = regex(remove_tag(self.get_argument('planId')))
        if plan_id:
            connection, cursor = db_connect()

            sql_select_Query = "SELECT * FROM plan WHERE plan_id=cast(%s as char) "
            cursor.execute(sql_select_Query, (str(plan_id)))
            records = cursor.fetchall()
            #print("records",records,"planId",plan_id,type(plan_id))

            if records:
                result={
                      "id" : records[0][0],
                      "created" : str(records[0][1]),
                      "objectType" : records[0][2],
                      "amount" : records[0][3],
                      "currency" : records[0][4],
                      "interval" : records[0][5],
                      "intervalCount" : records[0][6],
                      "name" : records[0][8],
                      "trialPeriodDays" : records[0][9]
                    }

                response = {"status": "success",
                            "code": 200,
                            "data": result,
                            "message": ""}
                self.write(response)
            else:
                response = {
                    "status": "error",
                    "code": 400,
                    "data": "",
                    "message": "Data not available",
                }
                raise tornado.web.Finish(response)
        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "",
                "message": "Bad REquest",
            }
            raise tornado.web.Finish(response)

@jwtauth
class delete_plan(BaseHandler1):
    def post(self):
        plan_id = regex(remove_tag(self.get_argument('planId')))
        if plan_id:
            connection, cursor = db_connect()

            # try:

            sql_select_Query = "SELECT * FROM plan WHERE plan_id=cast(%s as char) "
            cursor.execute(sql_select_Query, (str(plan_id),))
            records = cursor.fetchall()
            if records:
                sql_plan = "INSERT INTO deleted_plan(plan_id ,created,objectType ,amount ,currency ,intervals ,intervalCount ,billingCycles,name ,trialPeriodDays ,recursTo,metadata,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                cursor.execute(sql_plan, (
                    str(records[0][0]), float(records[0][1]), "plan", float(records[0][3]), str(records[0][4]),
                    str(records[0][5]), int(records[0][6]),
                    str(records[0][7]), str(records[0][8]), int(records[0][9]), str(records[0][10]), str(records[0][11]),"admin"))
                connection.commit()

                ##print(records)

                sql_plan = "DELETE FROM plan WHERE plan_id=cast(%s as char)"
                cursor.execute(sql_plan, (str(plan_id),))
                connection.commit()

                result = {"plan_id": plan_id}
                type_event = "PLAN_DELETED"
                id = "event_" + str(uuid.uuid1())
                data = "char_" + str(uuid.uuid1())
                log = "log_" + str(uuid.uuid1())
                created = time.time()

                url = "/api/v1/plan/delete"
                platform = self.request.headers.get('platform')
                ipaddress = self.request.headers.get('ipaddress')

                request_body= {"plan_id":plan_id}

                Insert_log = (
                    "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_log, (str(log), float(created), "post", url, int(200), str(ipaddress), str(platform), str(request_body), str(result),"admin"))


                Insert_event = (
                    "INSERT INTO event(event_id ,created ,objectType ,type ,data ,log,com_id,customer_id,merchant_id ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_event, (id, created, "event", type_event, data, log,result["plan_id"],"admin","admin"))

                Insert_data = (
                    "INSERT INTO data(data_id ,created ,objectType ,amount ,currency,merchant_id ) VALUES (%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_data, (
                    data, created, "plan_delete", records[0][3], records[0][4],"admin"))
                connection.commit()

                response = {"status": "success",
                            "code": 200,
                            "data": result,
                            "message": "plan deleted successfully"}
                self.write(response)
            else:
                connection.commit()
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "null",
                    "message": "plan id does't exist",
                }

                raise tornado.web.Finish(response)
        #     except:
        #         response = {
        #             "status": "error",
        #             "code": 404,
        #             "data": "null",
        #             "message": "Something is wrong",
        #         }
        #         raise tornado.web.Finish(response)
        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "null",
                "message": "Bad REquest",
            }
            raise tornado.web.Finish(response)
@jwtauth
class plan_update(BaseHandler1):
    def post(self):
        plan_id = regex(remove_tag(self.get_argument('planId')))
        amount = remove_tag(self.get_argument('amount',False))
        currency = remove_tag(self.get_argument('currency',False))
        name = remove_tag(self.get_argument('name',False))
        metadata = remove_tag(self.get_argument('metadata',False))

        if plan_id:
            connection, cursor = db_connect()

            if amount==False and currency==False and name==False and metadata==False:
                self.write("nothing to update")
            else:


                if amount :
                    sql_plan = "UPDATE plan SET amount = %s WHERE  plan_id=cast(%s as char)"
                    cursor.execute(sql_plan, (float(amount), str(plan_id),))

                if currency :
                    sql_plan = "UPDATE plan SET currency = %s WHERE  plan_id=cast(%s as char)"
                    cursor.execute(sql_plan, (str(currency), str(plan_id),))

                if name :
                    sql_plan = "UPDATE plan SET name = %s WHERE  plan_id=cast(%s as char)"
                    cursor.execute(sql_plan, (str(name), str(plan_id),))

                if metadata :
                    sql_plan = "UPDATE plan SET metadata = %s WHERE  plan_id=cast(%s as char)"
                    cursor.execute(sql_plan, (str(metadata), str(plan_id),))

                connection.commit()

                sql_select_Query = "SELECT * FROM plan WHERE plan_id=cast(%s as char) "

                cursor.execute(sql_select_Query, (str(plan_id),))

                records = cursor.fetchall()
                ##print(records)
                result = {
                    "id": records[0][0],
                    "created": str(records[0][1]),
                    "objectType": records[0][2],
                    "amount": records[0][3],
                    "currency": records[0][4],
                    "interval": records[0][5],
                    "intervalCount": records[0][6],
                    "name": records[0][8],
                    "trialPeriodDays": records[0][9]
                }
                type_event = "PLAN_UPDATED"
                id = "event_" + str(uuid.uuid1())
                data = "char_" + str(uuid.uuid1())
                log = "log_" + str(uuid.uuid1())
                created = time.time()

                url = "/api/v1/plan/update"
                platform = self.request.headers.get('platform')
                ipaddress = self.request.headers.get('ipaddress')

                request_body= {"plan_id":plan_id,"amount":amount,"currency":currency,"name":name,"metadata":metadata}

                Insert_log = (
                    "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_log, (str(log), float(created), "post", url, int(200), str(ipaddress), str(platform), str(request_body), str(result),"admin"))

                Insert_event = (
                    "INSERT INTO event(event_id ,created ,objectType ,type ,data ,log,com_id,customer_id,merchant_id ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_event, (id, created, "event", type_event, data, log,result["id"],"admin","admin"))

                Insert_data = (
                    "INSERT INTO data(data_id ,created ,objectType ,amount ,currency,merchant_id ) VALUES (%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_data, (
                    data, created, "plan_update", float(records[0][3]), records[0][4],"admin"))
                connection.commit()

                response = {"status": "success","code": 200,
                            "data": result,
                            "message": "plan updated successfully"}
                self.write(response)
        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "null",
                "message": "Bad REquest",
            }
            raise tornado.web.Finish(response)


@jwtauth
class list_plan(BaseHandler1):
    def get(self):
        created = remove_tag(self.get_argument('created', False))
        operation = remove_tag(self.get_argument('operation', False))
        deleted = remove_tag(self.get_argument('deleted', False))
        limit = remove_tag(self.get_argument('limit', False))
        startingAfterId = regex(remove_tag(self.get_argument('startingAfterId', False)))
        endingBeforeId = regex(remove_tag(self.get_argument('endingBeforeId', False)))

        connection, cursor = db_connect()

        sql_length_query = ("SELECT COUNT(*) FROM plan")
        cursor.execute(sql_length_query)
        length = cursor.fetchall()
        len_records = length[0][0]
        #print("length", len_records)

        if int(limit) == False:
            limit = 10
        elif int(limit)>100:
            limit=100
        if deleted == False or deleted == "0":
            if operation == "lt" or operation == "lte" or operation == "gt" or operation == "gte" and created:

                if operation == "lt":
                    sql_select_Query = ("SELECT * FROM plan WHERE created < %s  ORDER BY created DESC LIMIT %s")
                elif operation == "lte":
                    sql_select_Query = ("SELECT * FROM plan WHERE created <= %s ORDER BY created DESC LIMIT %s")
                elif operation == "gt":
                    sql_select_Query = ("SELECT * FROM plan WHERE created > %s  ORDER BY created DESC LIMIT %s")
                elif operation == "gte":
                    sql_select_Query = ("SELECT * FROM plan WHERE created <= %s ORDER BY created DESC LIMIT %s")

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
                                  "amount" : records[i][3],
                                  "currency" : records[i][4],
                                  "interval" : records[i][5],
                                  "intervalCount" : records[i][6],
                                  "name" : records[i][8],
                                  "trialPeriodDays" : records[i][9]
                                }
                            result.append(data)

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
                    self.write(response)


            if startingAfterId:


                sql_select_Query = ("SELECT * FROM plan WHERE created>= (SELECT created FROM plan WHERE plan_id = cast(%s as char)) ORDER BY created DESC LIMIT 10 ")
                cursor.execute(sql_select_Query, (startingAfterId,))
                records = cursor.fetchall()
                #print(records)
                results = []
                for i in range(len(records)):
                    result ={
                              "id" : records[i][0],
                              "created" : str(records[i][1]),
                              "objectType" : records[i][2],
                              "amount" : records[i][3],
                              "currency" : records[i][4],
                              "interval" : records[i][5],
                              "intervalCount" : records[i][6],
                              "name" : records[i][8],
                              "trialPeriodDays" : records[i][9]
                            }
                    results.append(result)

                response = {"status": "success","code": 200,
                            "data": results,
                            "data_length": len_records,
                            "message": ""}
                self.write(response)

            if endingBeforeId:


                sql_select_Query = (
                    "SELECT * FROM plan WHERE created<=(SELECT created FROM plan WHERE plan_id =cast(%s as char)) ORDER BY created ASC LIMIT 10 ")
                cursor.execute(sql_select_Query, (endingBeforeId))
                records = cursor.fetchall()
                #print(records)
                results = []
                for i in range(len(records)):
                    result = {
                              "id" : records[i][0],
                              "created" : str(records[i][1]),
                              "objectType" : records[i][2],
                              "amount" : records[i][3],
                              "currency" : records[i][4],
                              "interval" : records[i][5],
                              "intervalCount" : records[i][6],
                              "name" : records[i][8],
                              "trialPeriodDays" : records[i][9]
                            }
                    results.append(result)

                response = {"status": "success","code": 200,
                            "data": results,
                            "data_length": len_records,
                            "message": ""}
                self.write(response)


        if deleted:
            if operation == "lt" or operation == "lte" or operation == "gt" or operation == "gte" and created:

                if operation == "lt":
                    sql_select_Query = ("SELECT * FROM deleted_plan WHERE created < %s  ORDER BY created DESC LIMIT %s")
                elif operation == "lte":
                    sql_select_Query = ("SELECT * FROM deleted_plan WHERE created <= %s ORDER BY created DESC LIMIT %s")
                elif operation == "gt":
                    sql_select_Query = ("SELECT * FROM deleted_plan WHERE created > %s  ORDER BY created DESC LIMIT %s")
                elif operation == "gte":
                    sql_select_Query = ("SELECT * FROM deleted_plan WHERE created <= %s ORDER BY created DESC LIMIT %s")

                cursor.execute(sql_select_Query, (float(created), int(limit)))
                records = cursor.fetchall()
                #print(records)
                connection.commit()
                #print(len(records), len(limit))
                if len(records) == int(limit):
                    #print(len(records), len(limit))
                    result = []
                    for i in range(int(limit)):
                        if records[i] != ():
                            data = {
                                "id": records[i][0],
                                "created": str(records[i][1]),
                                "objectType": records[i][2],
                                "amount": records[i][3],
                                "currency": records[i][4],
                                "interval": records[i][5],
                                "intervalCount": records[i][6],
                                "name": records[i][8],
                                "trialPeriodDays": records[i][9]
                            }
                            result.append(data)

                    response = {"status": "success","code": 200,
                                "data": result,
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
                    self.write(response)

            if startingAfterId:

                sql_select_Query = ("SELECT * FROM deleted_plan WHERE created>= (SELECT created FROM deleted_plan WHERE sub_id = cast(%s as char)) ORDER BY created ASC LIMIT 10 ")
                cursor.execute(sql_select_Query, (startingAfterId))
                records = cursor.fetchall()
                #print(records)
                results = []
                for i in range(len(records)):
                    result = {
                        "id": records[i][0],
                        "created": str(records[i][1]),
                        "objectType": records[i][2],
                        "amount": records[i][3],
                        "currency": records[i][4],
                        "interval": records[i][5],
                        "intervalCount": records[i][6],
                        "name": records[i][8],
                        "trialPeriodDays": records[i][9]
                    }
                    results.append(result)
                results = results[::-1]

                response = {"status": "success","code": 200,
                            "data": results,
                            "data_length": len_records,
                            "message": ""}
                self.write(response)

            if endingBeforeId:

                sql_select_Query = ("SELECT * FROM deleted_plan WHERE created<= (SELECT created FROM deleted_plan WHERE sub_id =cast(%s as char)) ORDER BY created ASC LIMIT 10 ")
                cursor.execute(sql_select_Query, (endingBeforeId))
                records = cursor.fetchall()
                #print(records)
                results = []
                for i in range(len(records)):
                    result = {
                        "id": records[i][0],
                        "created": str(records[i][1]),
                        "objectType": records[i][2],
                        "amount": records[i][3],
                        "currency": records[i][4],
                        "interval": records[i][5],
                        "intervalCount": records[i][6],
                        "name": records[i][8],
                        "trialPeriodDays": records[i][9]
                    }
                    results.append(result)

                response = {"status": "success","code": 200,
                            "data": results,
                            "data_length": len_records,
                            "message": ""}
                self.write(response)
