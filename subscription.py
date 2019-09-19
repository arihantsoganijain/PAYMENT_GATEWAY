import tornado.web
import tornado
import tornado.ioloop
import time
import time
import uuid
import pymysql
import pyaes
import json
import hashlib
from remove_tags import *
from auth import *
from cross_origin import *
import time
from db import *


@jwtauth
class subscription_create(BaseHandler):
    def post(self):
        customer_id = regex(remove_tag(self.get_argument('customerId')))
        planId = regex(remove_tag(self.get_argument('planId')))
        card_id = regex(remove_tag(self.get_argument('card', False)))
        quantity = remove_tag(self.get_argument('quantity', False))
        captureCharges = remove_tag(self.get_argument('captureCharges', False))
        trialEnd = remove_tag(self.get_argument('trialEnd', False))
        sh_name = remove_tag(self.get_argument('sh_name', False))
        sh_address1 = remove_tag(self.get_argument('sh_address1', False))
        sh_address2 = remove_tag(self.get_argument('sh_address2', False))
        sh_zip = remove_tag(self.get_argument('sh_zip', False))
        sh_city = remove_tag(self.get_argument('sh_city', False))
        sh_state = remove_tag(self.get_argument('sh_state', False))
        sh_country = remove_tag(self.get_argument('sh_country', False))

        bil_name = remove_tag(self.get_argument('bil_name', False))
        bil_address1 = remove_tag(self.get_argument('bil_address1', False))
        bil_address2 = remove_tag(self.get_argument('bil_address2', False))
        bil_zip = remove_tag(self.get_argument('bil_zip', False))
        bil_city = remove_tag(self.get_argument('bil_city', False))
        bil_state = remove_tag(self.get_argument('bil_state', False))
        bil_country = remove_tag(self.get_argument('bil_country', False))
        vat=remove_tag(self.get_argument('vat', False))


        metadata = remove_tag(self.get_argument('metadata', False))
        #print(customer_id , planId)
        if customer_id and planId:


            records =0
            records1 =0
            records2 =0
            connection, cursor = db_connect()
            sql_select_Query = ("SELECT * FROM customers WHERE id = cast(%s as char)")

            cursor.execute(sql_select_Query, (customer_id,))
            records = cursor.fetchall()



            sql_select_Query = ("SELECT * FROM plan WHERE plan_id=cast(%s as char)")

            cursor.execute(sql_select_Query, (planId,))
            records1 = cursor.fetchall()

            #print(card_id)
            if card_id !=0:
                if card_id.startswith('card_'):

                    sql_select_Query = ("SELECT * FROM cards WHERE card_id=cast(%s as char)")

                    cursor.execute(sql_select_Query, (card_id,))
                    card_records = cursor.fetchall()
                    if card_records:
                        sql_update_Query = ("UPDATE customers SET defaultCardId = %s WHERE  id = cast(%s as char)")
                        cursor.execute(sql_update_Query, (card_id, customer_id,))
                        connection.commit()
                    else:
                        response = {
                            "status": "error",
                            "code": 404,
                            "data": "null",
                            "message": "card does not exist",
                        }
                        raise tornado.web.Finish(response)


                elif card_id.startswith('tok_'):

                    sql_select_Query = ("SELECT * FROM token WHERE id=%s")

                    cursor.execute(sql_select_Query, (card_id,))
                    tok_records = cursor.fetchall()
                    if tok_records:
                        sql_update_Query = ("UPDATE customers SET defaultCardId = %s WHERE  id = cast(%s as char)")
                        cursor.execute(sql_update_Query, (tok_records[0][18], customer_id,))
                        connection.commit()
                    else:
                        response = {
                            "status": "error",
                            "code": 404,
                            "data": "null",
                            "message": "card does not exist",
                        }
                        raise tornado.web.Finish(response)


            if records and records1 :

                sub_id = "sub_"+str(uuid.uuid1())
                created =time.time()
                if quantity==False:
                    quantity=1
                if captureCharges==False:
                    captureCharges=0
                elif captureCharges==True:
                    captureCharges=1
                if trialEnd==False:
                    trialEnd=0

                if sh_name and sh_address1 and sh_address2 and sh_zip and sh_city and sh_state and sh_country:
                    Insert_subscription = "INSERT INTO subscription(sh_name , sh_address1 ,  sh_address2 , sh_zip , sh_city , sh_state , sh_country,merchant_id)VALUES (%s,%s,%s,%s,%s,%s,%s,%s)"
                    cursor.execute(Insert_subscription, (str(sh_name) , str(sh_address1 ),  str(sh_address2 ), int(sh_zip) , str(sh_city) , str(sh_state) , str(sh_country),"admin"))

                if bil_name and bil_address1 and bil_address2 and bil_zip and bil_city and bil_state and bil_country:
                    Insert_subscription = "INSERT INTO subscription(bil_name , bil_address1 ,  bil_address2 , bil_zip , bil_city , bil_state , bil_country,vat,merchant_id)VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                    cursor.execute(Insert_subscription, (str(bil_name) , str(bil_address1 ),  str(bil_address2 ), int(bil_zip) , str(bil_city) , str(bil_state) , str(bil_country),str(vat),"admin"))

                sql_select_Query = "SELECT intervals FROM plan WHERE plan_id=cast(%s as char) "
                cursor.execute(sql_select_Query, (planId,))
                records = cursor.fetchall()
                #print(records)
                if records=="hour":
                    interval_time = 3600
                elif records == "day":
                    interval_time=86400
                elif records=="week":
                    interval_time = 604800
                elif records=="month":
                    interval_time = 2419200
                elif records=="year":
                    interval_time = 31536000
                else:
                    interval_time = 0


                a=float(float(created)+interval_time)



                Insert_subscription= "INSERT INTO subscription(sub_id ,created ,objectType ,planId ,customer_id ,quantity,captureCharges,status_active ,start ,currentPeriodStart  ,currentPeriodEnd  ,canceledAt  ,endedAt , trialStart , trialEnd ,cancelAtPeriodEnd  ,metadata ,merchant_id)VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                cursor.execute(Insert_subscription,(str(sub_id),float(created),"subscription",str(planId),str(customer_id),int(quantity),int(captureCharges),"active",float(created),float(created),a,float(0),float(0),float(0),float(trialEnd),int(0),metadata,"admin"))
                connection.commit()




                sql_select_Query = "SELECT * FROM subscription WHERE  sub_id=cast(%s as char) AND  customer_id=cast(%s as char)"
                cursor.execute(sql_select_Query, (str(sub_id),str(customer_id),))
                records = cursor.fetchall()
                #print(records)
                result={
                      "id" : records[0][0],
                      "created" :  str(records[0][1]),
                      "objectType" : records[0][2],
                      "planId" : records[0][3],
                      "customerId" : records[0][4],
                      "quantity" : records[0][5],
                      "status" : records[0][8],
                      "start" : records[0][13],
                      "currentPeriodStart" : records[0][14],
                      "currentPeriodEnd" : records[0][15],
                      "cancelAtPeriodEnd" : records[0][20]
                    }
                type_event = "CUSTOMER_SUBSCRIPTION_CREATED"
                id = "event_" + str(uuid.uuid1())
                data = "char_" + str(uuid.uuid1())
                log = "log_" + str(uuid.uuid1())
                created = time.time()

                url = "/api/v1/subscription/create"
                platform = self.request.headers.get('platform')
                ipaddress = self.request.headers.get('ipaddress')

                request_body= {"customer_id":customer_id,"planId":planId,"card_id":card_id,"quantity":quantity,"captureCharges":captureCharges,
                "trialEnd":trialEnd,"sh_name":sh_name,"sh_address1":sh_address1,"sh_address2":sh_address2,
                "sh_zip":sh_zip,"sh_city":sh_city,"sh_state":sh_state,"sh_country":sh_country,"bil_name":bil_name,
                "bil_address1":bil_address1,"bil_address2":bil_address2,"bil_city":bil_city,
                "bil_state":bil_state,"bil_country":bil_country,"vat":vat,"metadata":metadata}

                Insert_log = (
                    "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_log, (str(log), float(created), "post", url, int(200), str(ipaddress), str(platform), str(request_body), str(result),"admin"))



                Insert_event = (
                    "INSERT INTO event(event_id ,created ,objectType ,type ,data ,log,com_id,customer_id,merchant_id ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_event, (id, created, "event", type_event, data, log,result["id"],result["customerId"],"admin"))

                Insert_data = (
                    "INSERT INTO data(data_id ,created ,objectType  ,card ,captured,merchant_id) VALUES (%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_data, (
                    data, created, "subscription_create", card_id, captureCharges,"admin"))
                connection.commit()

                response = {"status": "success","code": 200,
                            "data": result,
                            "message": "subscription created succesfully"}
                self.write(response)

            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "null",
                    "message": "customer does not exist",
                }

                raise tornado.web.Finish(response)
        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "null",
                "message": "Bad Request",
            }
            raise tornado.web.Finish(response)


    def get(self):
        customer_id = regex(remove_tag(self.get_argument('customerId',False)))
        sub_id = regex(remove_tag(self.get_argument('subcriptionId',False)))
        planId = remove_tag(self.get_argument('planId',False))
        if customer_id and sub_id:
            connection, cursor = db_connect()

            sql_select_Query = "SELECT * FROM subscription WHERE customer_id=cast(%s as char) AND sub_id=cast(%s as char)"

            cursor.execute(sql_select_Query, (customer_id, sub_id,))
            records = cursor.fetchall()

            result = {
                "id": records[0][0],
                "created": str(records[0][1]),
                "objectType": records[0][2],
                "planId": records[0][3],
                "customerId": records[0][4],
                "quantity": records[0][5],
                "status": records[0][8],
                "start": records[0][14],
                "currentPeriodStart": records[0][15],
                "currentPeriodEnd": records[0][16],
                "cancelAtPeriodEnd": records[0][20]
            }
            response = {"status": "success", "code": 200,
                        "data": result,
                        "message": ""}
            self.write(response)

        elif planId:
            connection, cursor = db_connect()

            sql_select_Query = "SELECT * FROM subscription WHERE planId=cast(%s as char) "

            cursor.execute(sql_select_Query, (planId))
            records = cursor.fetchall()
            if records:
                
                
                
                results = []
                for i in range(len(records)):
                    sql_select_Query = "SELECT email FROM customers WHERE id=cast(%s as char) "

                    cursor.execute(sql_select_Query, (records[i][4]))
                    email = cursor.fetchall()
                    # #print(records[0][4],email,"55555555555555555555555555555555")
                    result = {
                        "id": records[i][0],
                        "created": str(records[i][1]),
                        "objectType": records[i][2],
                        "planId": records[i][3],
                        "customerId": records[i][4],
                        "email":email[0][0],
                        "quantity": records[i][5],
                        "status": records[i][8],
                        "start": records[i][14],
                        "currentPeriodStart": records[i][15],
                        "currentPeriodEnd": records[i][16],
                        "cancelAtPeriodEnd": records[i][20]
                    }
                    results.append(result)
                response = {"status": "success", "code": 200,
                            "data": results,
                            "data_length": len(records),
                            "message": ""}
                self.write(response)
                # else:
                #     response = {
                #         "status": "error",
                #         "code": 400,
                #         "data": "null",
                #         "message": "No subscribers",
                #     }
                #     raise tornado.web.Finish(response)
            else:
                response = {
                    "status": "error",
                    "code": 400,
                    "data": "null",
                    "message": "Id doen't exists",
                }
                raise tornado.web.Finish(response)
        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "null",
                "message": "Bad Request",
            }
            raise tornado.web.Finish(response)

@jwtauth
class delete_subscription(BaseHandler):


    def post(self):
        customer_id = regex(remove_tag(self.get_argument('customerId')))
        subscriptionId = regex(remove_tag(self.get_argument('subscriptionId')))
        atPeriodEnd = remove_tag(self.get_argument('atPeriodEnd', False))

        if customer_id and subscriptionId:

            connection, cursor = db_connect()


            if atPeriodEnd ==True or atPeriodEnd =="true":
                atPeriodEnd = 1
            else:
                atPeriodEnd = 0


            sql_select_Query = ("SELECT * FROM subscription WHERE sub_id=cast(%s as char) AND customer_id=cast(%s as char)")

            cursor.execute(sql_select_Query, (subscriptionId,customer_id,))
            records = cursor.fetchall()

            cancel_time=time.time()
            if records:
                sql_select_Query = "UPDATE subscription SET cancelAtPeriodEnd = %s, status_active= %s WHERE  customer_id=cast(%s as char) AND sub_id=cast(%s as char)"

                cursor.execute(sql_select_Query, (int(atPeriodEnd),"canceled", customer_id, subscriptionId,))

                sql_select_Query = "SELECT * FROM subscription WHERE customer_id=cast(%s as char) AND sub_id=cast(%s as char)"

                cursor.execute(sql_select_Query, (customer_id, subscriptionId,))
                records = cursor.fetchall()

                result = {
                          "id" : records[0][0],
                          "created" :  str(records[0][1]),
                          "objectType" :records[0][2],
                          "planId" : records[0][3],
                          "customerId" : records[0][4],
                          "quantity" : records[0][5],
                          "status" : records[0][8],
                          "start" :records[0][13],
                          "currentPeriodStart" : records[0][14],
                          "currentPeriodEnd" : records[0][15],
                          "canceledAt" : records[0][16],
                          "endedAt" : records[0][17],
                          "cancelAtPeriodEnd" : records[0][20]
                        }

                connection.commit()

                type_event = "CUSTOMER_SUBSCRIPTION_DELETED"
                id = "event_" + str(uuid.uuid1())
                data = "char_" + str(uuid.uuid1())
                log = "log_" + str(uuid.uuid1())
                created = time.time()

                url = "/api/v1/subscription/delete"
                platform = self.request.headers.get('platform')
                ipaddress = self.request.headers.get('ipaddress')

                request_body= {"customer_id":customer_id,"subscriptionId":subscriptionId,"atPeriodEnd":atPeriodEnd}

                Insert_log = (
                    "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_log, (str(log), float(created), "post", url, int(200), str(ipaddress), str(platform), str(request_body), str(result),"admin"))

                Insert_event = (
                    "INSERT INTO event(event_id ,created ,objectType ,type ,data ,log,com_id,customer_id,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_event, (id, created, "event", type_event, data, log,result["id"],result["customerId"],"admin"))

                Insert_data = (
                    "INSERT INTO data(data_id ,created ,objectType,merchant_id) VALUES (%s,%s,%s,%s)")
                cursor.execute(Insert_data, (
                    data, created, "subscription_delete","admin"))
                connection.commit()

                response = {"status": "success","code": 200,
                            "data": result,
                            "message": "subscription deleted succesfully"}
                self.write(response)
            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "null",
                    "message": "Something went wrong",
                }
                raise tornado.web.Finish(response)
        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "null",
                "message": "Bad Request",
            }
            raise tornado.web.Finish(response)

@jwtauth
class subscription_update(BaseHandler):
    def post(self):
        customer_id = regex(remove_tag(self.get_argument('customerId')))
        subscriptionId = regex(remove_tag(self.get_argument('subscriptionId')))
        planId = regex(remove_tag(self.get_argument('planId',False)))
        card_id = regex(remove_tag(self.get_argument('card', False)))
        quantity = remove_tag(self.get_argument('quantity', False))
        captureCharges = remove_tag(self.get_argument('captureCharges', False))
        trialEnd = remove_tag(self.get_argument('trialEnd', False))

        sh_name = remove_tag(self.get_argument('sh_name', False))
        sh_address1 = remove_tag(self.get_argument('sh_address1', False))
        sh_address2 = remove_tag(self.get_argument('sh_address2', False))
        sh_zip = remove_tag(self.get_argument('sh_zip', False))
        sh_city = remove_tag(self.get_argument('sh_city', False))
        sh_state = remove_tag(self.get_argument('sh_state', False))
        sh_country = remove_tag(self.get_argument('sh_country', False))

        bil_name = remove_tag(self.get_argument('bil_name', False))
        bil_address1 = remove_tag(self.get_argument('bil_address1', False))
        bil_address2 = remove_tag(self.get_argument('bil_address2', False))
        bil_zip = remove_tag(self.get_argument('bil_zip', False))
        bil_city = remove_tag(self.get_argument('bil_city', False))
        bil_state = remove_tag(self.get_argument('bil_state', False))
        bil_country = remove_tag(self.get_argument('bil_country', False))

        metadata = remove_tag(self.get_argument('metadata', False))


        if customer_id and subscriptionId:
            quantity=eval(quantity)
            connection, cursor = db_connect()
            sql_select_Query = "SELECT * FROM subscription WHERE customer_id=cast(%s as char) AND sub_id=cast(%s as char)"

            cursor.execute(sql_select_Query, (customer_id, subscriptionId,))
            records = cursor.fetchall()

            if records:

                if card_id != 0:
                    if card_id.startswith('card_'):

                        sql_select_Query = ("SELECT * FROM cards WHERE card_id=cast(%s as char)")

                        cursor.execute(sql_select_Query, (card_id,))
                        card_records = cursor.fetchall()
                        if card_records:
                            sql_update_Query = ("UPDATE customers SET defaultCardId = %s WHERE  id = cast(%s as char)")
                            cursor.execute(sql_update_Query, (card_id, customer_id,))
                            connection.commit()

                if planId:
                    sql_sub= "UPDATE subscription SET planId = %s WHERE  customer_id=cast(%s as char) AND sub_id=cast(%s as char)"
                    cursor.execute(sql_sub, (str(planId),str(customer_id), str(subscriptionId),))

                if quantity:
                    sql_sub = "UPDATE subscription SET quantity = %s WHERE  customer_id=cast(%s as char) AND sub_id=cast(%s as char)"
                    cursor.execute(sql_sub, (int(quantity),str(customer_id), str(subscriptionId),))

                if captureCharges:
                    sql_sub = "UPDATE subscription SET captureCharges = %s WHERE  customer_id=cast(%s as char) AND sub_id=cast(%s as char)"
                    cursor.execute(sql_sub, (str(captureCharges), str(customer_id), str(subscriptionId),))

                if trialEnd:
                    sql_sub = "UPDATE subscription SET trialEnd = %s WHERE  customer_id=cast(%s as char) AND sub_id=cast(%s as char)"
                    cursor.execute(sql_sub, (str(trialEnd), str(customer_id), str(subscriptionId),))

                if sh_name and sh_address1 and sh_address2 and sh_zip and sh_city and sh_state and sh_country :
                    sql_sub = "UPDATE subscription SET sh_name = %s, sh_address1 = %s, sh_address2 = %s, sh_zip = %s, sh_city = %s, sh_state = %s, sh_country = %s WHERE  customer_id=cast(%s as char) AND sub_id=cast(%s as char)"
                    cursor.execute(sql_sub, (str(sh_name) , str(sh_address1) , str(sh_address2) , int(sh_zip) , str(sh_city) , str(sh_state) , str(sh_country), str(customer_id), str(subscriptionId),))

                if bil_name and bil_address1 and bil_address2 and int(bil_zip) and bil_city and bil_state and bil_country:
                    sql_sub = "UPDATE subscription SET bil_name = %s, bil_address1 = %s, bil_address2 = %s, bil_zip = %s, bil_city = %s, bil_state = %s, bil_country = %s WHERE  customer_id=cast(%s as char) AND sub_id=cast(%s as char)"
                    cursor.execute(sql_sub, (str(bil_name) , str(bil_address1) , str(bil_address2), int(bil_zip) ,str( bil_city) , str(bil_state) , str(bil_country), str(customer_id), str(subscriptionId),))

                if metadata:
                    sql_sub = "UPDATE subscription SET metadata = %s WHERE  customer_id=cast(%s as char) AND sub_id=cast(%s as char)"
                    cursor.execute(sql_sub, (str(metadata), str(customer_id), str(subscriptionId),))

                connection.commit()






            sql_select_Query = "SELECT * FROM subscription WHERE customer_id=cast(%s as char) AND sub_id=cast(%s as char) "

            cursor.execute(sql_select_Query, (str(customer_id),str(subscriptionId)))

            records = cursor.fetchall()
            result = {
                  "id" : records[0][0],
                  "created" :  str(records[0][1]),
                  "objectType" : records[0][2],
                  "planId" : records[0][3],
                  "customerId" : records[0][4],
                  "quantity" : records[0][5],
                  "status" : records[0][8],
                  "start" : records[0][13],
                  "currentPeriodStart" : records[0][14],
                  "currentPeriodEnd" : records[0][15],
                  "cancelAtPeriodEnd" : records[0][20],

                    }
            type_event = "CUSTOMER_SUBSCRIPTION_UPDATED"
            id = "event_" + str(uuid.uuid1())
            data = "char_" + str(uuid.uuid1())
            log = "log_" + str(uuid.uuid1())
            created = time.time()

            url = "/api/v1/subscription/update"
            platform = self.request.headers.get('platform')
            ipaddress = self.request.headers.get('ipaddress')

            request_body= {"customer_id":customer_id,"subscriptionId":subscriptionId,"planId":planId,"card_id":card_id,"quantity":quantity,"captureCharges":captureCharges,
                "trialEnd":trialEnd,"sh_name":sh_name,"sh_address1":sh_address1,"sh_address2":sh_address2,
                "sh_zip":sh_zip,"sh_city":sh_city,"sh_state":sh_state,"sh_country":sh_country,"bil_name":bil_name,
                "bil_address1":bil_address1,"bil_address2":bil_address2,"bil_city":bil_city,
                "bil_state":bil_state,"bil_country":bil_country,"metadata":metadata}


            Insert_log = (
                "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
            cursor.execute(Insert_log, (str(log), float(created), "post", url, int(200), str(ipaddress), str(platform), str(request_body), str(result),"admin"))

            Insert_event = (
                "INSERT INTO event(event_id ,created ,objectType ,type ,data ,log ,com_id,customer_id,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
            cursor.execute(Insert_event, (id, created, "event", type_event, data, log,result["id"],result["customerId"],"admin"))

            Insert_data = (
                "INSERT INTO data(data_id ,created ,objectType,merchant_id ) VALUES (%s,%s,%s,%s)")
            cursor.execute(Insert_data, (
                data, created, "subscription_update","admin"))
            connection.commit()

            response = {"status": "success","code": 200,
                        "data": result,
                        "message": "subscription updated succesfully"}
            self.write(response)
        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "null",
                "message": "Bad Request",
            }
            raise tornado.web.Finish(response)

@jwtauth
class list_subscriptions(BaseHandler):
    def get(self):
        customerId = regex(remove_tag(self.get_argument('customerId')))
        created = remove_tag(self.get_argument('created', False))
        operation = remove_tag(self.get_argument('operation', False))
        deleted = remove_tag(self.get_argument('deleted', False))
        limit = remove_tag(self.get_argument('limit', False))
        startingAfterId = regex(remove_tag(self.get_argument('startingAfterId', False)))
        endingBeforeId = regex(remove_tag(self.get_argument('endingBeforeId', False)))

        connection, cursor = db_connect()

        if int(limit) == False:
            limit = 10
        elif int(limit)>100:
            limit=100

        if deleted == False or deleted == "0":
            if operation == "lt" or operation == "lte" or operation == "gt" or operation == "gte" and created:

                if operation == "lt":
                    sql_select_Query = ("SELECT * FROM subscription WHERE created < %s AND customer_id=cast(%s as char) ORDER BY created DESC LIMIT %s")
                elif operation == "lte":
                    sql_select_Query = ("SELECT * FROM subscription WHERE created <= %s AND customer_id=cast(%s as char)  ORDER BY created DESC LIMIT %s")
                elif operation == "gt":
                    sql_select_Query = ("SELECT * FROM subscription WHERE created > %s AND customer_id=cast(%s as char)  ORDER BY created DESC LIMIT %s")
                elif operation == "gte":
                    sql_select_Query = ("SELECT * FROM subscription WHERE created <= %s AND customer_id=cast(%s as char) ORDER BY created DESC LIMIT %s")

                cursor.execute(sql_select_Query, (float(created),customerId, int(limit)))
                records = cursor.fetchall()
                ##print(records)
                connection.commit()
                ##print(len(records),limit)
                len_records = len(records)
                limit = len(records)
                if len(records) == int(limit):
                    result = []
                    for i in range(len(records)):
                        #print(i)
                        if records[i] != ():
                            data = {
                                  "id":records[i][0],
                                  "created" :  str(records[i][1]),
                                  "objectType" : records[i][2],
                                  "planId" : records[i][3],
                                  "customerId" :records[i][4],
                                  "quantity" : records[i][5],
                                  "status" : records[i][8],
                                  "start" : records[i][14],
                                  "currentPeriodStart" : records[i][15],
                                  "currentPeriodEnd" : records[i][16],
                                  "cancelAtPeriodEnd" : records[i][20]
                                }
                            result.append(data)

                    response = {"status": "success","code": 200,
                                "data": result,
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

            if customerId and operation==False:
                try:

                    sql_select_Query = ("SELECT * FROM subscription WHERE customer_id = cast(%s as char) ORDER BY created DESC LIMIT %s ")
                    cursor.execute(sql_select_Query, (customerId, int(limit)))
                    records = cursor.fetchall()
                    #print(records)
                    result= []
                    for i in range(len(records)):
                        data = {
                                  "id" :records[i][0],
                                  "created" :  str(records[i][1]),
                                  "objectType" : records[i][2],
                                  "planId" : records[i][3],
                                  "customerId" :records[i][4],
                                  "quantity" : records[i][5],
                                  "status" : records[i][8],
                                  "start" : records[i][14],
                                  "currentPeriodStart" : records[i][15],
                                  "currentPeriodEnd" : records[i][16],
                                  "cancelAtPeriodEnd" : records[i][20]
                                }
                        result.append(data)

                    response = {"status": "success","code": 200,
                                "data": result,
                                "message": ""}
                    self.write(response)
                except:
                    response = {
                        "status": "error",
                        "code": 404,
                        "data": "null",
                        "message": "Customer not exist",
                    }
                    raise tornado.web.Finish(response)

            if startingAfterId:

                sql_select_Query = ("SELECT * FROM subscription WHERE created>= (SELECT created FROM subscription WHERE sub_id = cast(%s as char)) AND customer_id = cast(%s as char) ORDER BY created ASC LIMIT 10 ")
                cursor.execute(sql_select_Query, (startingAfterId,customerId))
                records = cursor.fetchall()
                #print(records)
                results = []
                for i in range(len(records)):
                    result = {
                                  "id" :records[i][0],
                                  "created": str(records[i][1]),
                                  "objectType" : records[i][2],
                                  "planId" : records[i][3],
                                  "customerId" :records[i][4],
                                  "quantity" : records[i][5],
                                  "status" : records[i][8],
                                  "start" : records[i][14],
                                  "currentPeriodStart" : records[i][15],
                                  "currentPeriodEnd" : records[i][16],
                                  "cancelAtPeriodEnd" : records[i][20]
                                }
                    results.append(result)

                response = {"status": "success","code": 200,
                            "data": results,
                            "message": ""}
                self.write(response)

            if endingBeforeId:

                sql_select_Query = (
                    "SELECT * FROM subscription WHERE created<= (SELECT created FROM subscription WHERE sub_id = cast(%s as char)) AND customer_id =cast(%s as char) ORDER BY created ASC LIMIT 10 ")
                cursor.execute(sql_select_Query, (endingBeforeId, customerId))
                records = cursor.fetchall()
                #print(records)
                results = []
                for i in range(len(records)):
                    result = {
                        "id": records[i][0],
                        "created": str(records[i][1]),
                        "objectType": records[i][2],
                        "planId": records[i][3],
                        "customerId": records[i][4],
                        "quantity": records[i][5],
                        "status": records[i][8],
                        "start": records[i][14],
                        "currentPeriodStart": records[i][15],
                        "currentPeriodEnd": records[i][16],
                        "cancelAtPeriodEnd": records[i][20]
                    }
                    results.append(result)

                response = {"status": "success","code": 200,
                            "data": results,
                            "message": ""}
                self.write(response)


        if deleted:
            if operation == "lt" or operation == "lte" or operation == "gt" or operation == "gte" and created:

                if operation == "lt":
                    sql_select_Query = (
                        "SELECT * FROM subscription WHERE created < %s AND customer_id=cast(%s as char) AND  status_active= %s ORDER BY created DESC LIMIT %s")
                elif operation == "lte":
                    sql_select_Query = (
                        "SELECT * FROM subscription WHERE created <= %s AND customer_id=cast(%s as char)  AND  status_active= %s ORDER BY created DESC LIMIT %s")
                elif operation == "gt":
                    sql_select_Query = (
                        "SELECT * FROM subscription WHERE created > %s AND customer_id=cast(%s as char) AND  status_active= %s ORDER BY created DESC LIMIT %s")
                elif operation == "gte":
                    sql_select_Query = (
                        "SELECT * FROM subscription WHERE created <= %s AND customer_id=cast(%s as char) AND  status_active= %s ORDER BY created DESC LIMIT %s")

                cursor.execute(sql_select_Query, (float(created), customerId,"canceled", int(limit)))
                records = cursor.fetchall()
                #print(records)
                connection.commit()
                #print(len(records), limit)
                if len(records) == int(limit):
                    result = []
                    for i in range(len(records)):
                        #print(i)
                        if records[i] != ():
                            data = {
                                "id": records[i][0],
                                "created":  str(records[i][1]),
                                "objectType": records[i][2],
                                "planId": records[i][3],
                                "customerId": records[i][4],
                                "quantity": records[i][5],
                                "status": records[i][8],
                                "start": records[i][14],
                                "currentPeriodStart": records[i][15],
                                "currentPeriodEnd": records[i][16],
                                "cancelAtPeriodEnd": records[i][20]
                            }
                            result.append(data)

                    response = {"status": "success","code": 200,
                                "data": result,
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

            if customerId and operation == False:
                try:

                    sql_select_Query = (
                        "SELECT * FROM subscription WHERE customer_id = cast(%s as char) AND  status_active= %s ORDER BY created DESC LIMIT %s ")
                    cursor.execute(sql_select_Query, (customerId, "canceled",int(limit)))
                    records = cursor.fetchall()
                    #print(records)
                    result = []
                    for i in range(len(records)):
                        data = {
                            "id": records[i][0],
                            "created": str(records[i][1]),
                            "objectType": records[i][2],
                            "planId": records[i][3],
                            "customerId": records[i][4],
                            "quantity": records[i][5],
                            "status": records[i][8],
                            "start": records[i][14],
                            "currentPeriodStart": records[i][15],
                            "currentPeriodEnd": records[i][16],
                            "cancelAtPeriodEnd": records[i][20]
                        }
                        result.append(data)

                    response = {"status": "success","code": 200,
                                "data": result,
                                "message": ""}
                    self.write(response)
                except:
                    response = {
                        "status": "error",
                        "code": 404,
                        "data": "null",
                        "message": "Customer not exist",
                    }
                    raise tornado.web.Finish(response)
            if startingAfterId:


                sql_select_Query = (
                    "SELECT * FROM subscription WHERE created> (SELECT created FROM subscription WHERE sub_id =cast(%s as char) AND  status_active= 'canceled') AND customer_id =cast(%s as char)  AND  status_active='canceled' ORDER BY created ASC LIMIT 10 ")
                cursor.execute(sql_select_Query, (startingAfterId, customerId))
                records = cursor.fetchall()
                #print(records)
                results = []
                for i in range(len(records)):
                    result = {
                        "id": records[i][0],
                        "created": str(records[i][1]),
                        "objectType": records[i][2],
                        "planId": records[i][3],
                        "customerId": records[i][4],
                        "quantity": records[i][5],
                        "status": records[i][8],
                        "start": records[i][14],
                        "currentPeriodStart": records[i][15],
                        "currentPeriodEnd": records[i][16],
                        "cancelAtPeriodEnd": records[i][20]
                    }
                    results.append(result)
                results = results[::-1]

                response = {"status": "success","code": 200,
                            "data": results,
                            "message": ""}
                self.write(response)

            if endingBeforeId:

                sql_select_Query = (
                    "SELECT * FROM subscription WHERE created< (SELECT created FROM subscription WHERE sub_id =cast(%s as char) AND  status_active= 'canceled') AND customer_id = cast(%s as char)  AND  status_active='canceled' ORDER BY created ASC LIMIT 10 ")
                cursor.execute(sql_select_Query, (startingAfterId, customerId))
                records = cursor.fetchall()
                #print(records)
                results = []
                for i in range(len(records)):
                    result = {
                        "id": records[i][0],
                        "created": str(records[i][1]),
                        "objectType": records[i][2],
                        "planId": records[i][3],
                        "customerId": records[i][4],
                        "quantity": records[i][5],
                        "status": records[i][8],
                        "start": records[i][14],
                        "currentPeriodStart": records[i][15],
                        "currentPeriodEnd": records[i][16],
                        "cancelAtPeriodEnd": records[i][20]
                    }
                    results.append(result)

                response = {"status": "success","code": 200,
                            "data": results,
                            "message": ""}
                self.write(response)
