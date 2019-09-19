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
import csv
import hashlib


@jwtauth
class customer(BaseHandler):

    def post(self):

        email = remove_tag(self.get_argument('email'))
        description=remove_tag(self.get_argument('description',False))
        card = regex(remove_tag(self.get_argument('card',False)))
        metadata = remove_tag(self.get_argument('metadata', False))





        if re.search(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)", email):
            if len(email)>=30:
                response = {
                            "status": "error",
                            "code": 404,
                            "data": "",
                            "message": "invalid email length",
                        }
                raise tornado.web.Finish(response)

            card_records=0
            token_records=0
            connection, cursor = db_connect()
            sql_select_Query = "SELECT email FROM customers WHERE email=cast(%s as char) "
            cursor.execute(sql_select_Query, (email,))
            email_check = cursor.fetchall()
            ##print(email_check)
            if email_check==():
                card_id = "card_" + str(uuid.uuid1())
                id = str(uuid.uuid1())
                if card:
                    if card[0:4]=="tok_":

                        sql_select_Query = "SELECT * FROM token WHERE id=cast(%s as char) "

                        cursor.execute(sql_select_Query, (card,))
                        token_records = cursor.fetchall()
                    elif card[0:5]=="card_":

                        sql_select_Query = "SELECT * FROM cards WHERE card_id=cast(%s as char) "

                        cursor.execute(sql_select_Query, (card,))
                        card_records = cursor.fetchall()

                    else :
                        response = {
                            "status": "error",
                            "code": 404,
                            "data": "",
                            "message": "invalid card details",
                        }
                        raise tornado.web.Finish(response)




                    if token_records:

                        result={
                            "id": id,
                            "created": time.time(),
                            "objectType": "customer",
                            "email": email,
                            "description":description,
                            "defaultCardId": card_id,
                            "cards": {
                                    "id": card_id,
                                    "created": time.time(),
                                    "objectType": "card",
                                    "first6" : token_records[0][3],
                                    "last4" : token_records[0][4],
                                    "fingerprint" : token_records[0][5],
                                    "expMonth" : token_records[0][6],
                                    "expYear" : token_records[0][7],
                                    "cardholderName" :token_records[0][10],
                                    "customerId" : id,
                                    "brand" : token_records[0][8],
                                    "type" :token_records[0][9],
                                    "country" : token_records[0][5],},
                            "metadata":metadata}

                    elif card_records:
                        result = {
                            "id": id,
                            "created": time.time(),
                            "objectType": "customer",
                            "email": email,
                            "description": description,
                            "defaultCardId": card_id,
                            "cards": {
                                "id": card_id,
                                "created": time.time(),
                                "objectType": "card",
                                "first6": card_records[0][3],
                                "last4": card_records[0][4],
                                "fingerprint": card_records[0][5],
                                "expMonth": card_records[0][6],
                                "expYear": card_records[0][7],
                                "cardholderName": card_records[0][10],
                                "customerId": id,
                                "brand": card_records[0][10],
                                "type": card_records[0][11],
                                "country": card_records[0][12], },
                            "metadata": metadata}

                else:
                    result = {
                        "id": id,
                        "created": time.time(),
                        "objectType": "customer",
                        "email": email,
                        "description": description,
                        "defaultCardId": card,
                        "metadata": metadata}


                try:


                    Insert_customer = ("INSERT INTO customers(id ,created ,objectType ,email,description ,defaultCardId,metadata,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)")

                    cursor.execute(Insert_customer, (str( result["id"]), str(result["created"]), str(result["objectType"]), str(result["email"]),str(result["description"]),
                    str(result["defaultCardId"]),str(result["metadata"]),"admin"))

                    connection.commit()


                    ##print("Done")

                except:
                    self.write("customer not done")


                if token_records:


                    Insert_card = ("INSERT INTO cards(card_id ,created ,objectType ,first6 ,last4 ,fingerprint ,expMonth ,expYear,cardholderName ,customerId ,brand ,type ,country,merchant_id ) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                    cursor.execute(Insert_card,(str(result["cards"]["id"]), str(result["cards"]["created"]), str(result["cards"]["objectType"])
                                    , str(result["cards"]["first6"]), str(result["cards"]["last4"]),
                                    str(result["cards"]["fingerprint"])
                                    , str(result["cards"]["expMonth"]), str(result["cards"]["expYear"]),
                                    str(result["cards"]["cardholderName"])
                                    , str(result["cards"]["customerId"])
                                    , str(result["cards"]["brand"]), str(result["cards"]["type"]),
                                    str(result["cards"]["country"]),"admin"))

                    connection.commit()


                type_event = "CUSTOMER_CREATED"
                id = "event_" + str(uuid.uuid1())
                data = "char_" + str(uuid.uuid1())
                log = "log_" + str(uuid.uuid1())
                created = time.time()

                url = "/api/v1/customer/create"
                platform = self.request.headers.get('platform')
                ipaddress = self.request.headers.get('ipaddress')
                request_body= {"email":email,"description":description,"card":card,"metadata":metadata}


                Insert_log = (
                    "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_log, (str(log), float(created), "post", url, int(200), str(ipaddress), str(platform), str(request_body), str(result),"admin"))

                Insert_event = (
                    "INSERT INTO event(event_id ,created ,objectType ,type ,data ,log,com_id, customer_id, merchant_id ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_event, (id, created, "event", type_event, data, log,result["id"],result["id"],"admin"))

                Insert_data = (
                    "INSERT INTO data(data_id ,created ,objectType  ,description ,card, merchant_id ) VALUES (%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_data, (
                    data, created, "Customer_Created", description, card,"admin"))
                connection.commit()

                response = {"status": "success","code": 200,
                            "data": result,
                            "message": "Customer added succesfully"}
                self.write(response)
            else:
                response = {
                    "status": "error",
                    "code": 400,
                    "data": "",
                    "message": "Email Address already exist",
                }

                raise tornado.web.Finish(response)
        else:

            response = {
                "status": "error",
                "code": 400,
                "data": "",
                "message": "Invalid Email Address",
            }

            raise tornado.web.Finish(response)








    def get(self):
        customer_id = regex(remove_tag(self.get_argument('customerId')))
        if customer_id:
            connection, cursor = db_connect()
            sql_select_Query = ("SELECT * FROM customers INNER JOIN cards ON customers.defaultCardId = cards.card_id WHERE id=cast(%s as char)")
            cursor.execute(sql_select_Query, (customer_id,))
            records = cursor.fetchall()

            if records:
                sql_select_Query = ("SELECT * FROM blacklist WHERE ruleType='email' and email=cast(%s as char)")
                cursor.execute(sql_select_Query, (records[0][3],))
                blk_record=cursor.fetchall()
                email_blocked=0
                if blk_record:
                    email_blocked=blk_record[0][0]
                sql_select_Query = ("SELECT * FROM blacklist WHERE ruleType='fingerprint' and fingerprint=cast(%s as char)")
                cursor.execute(sql_select_Query, (records[0][13],))
                blkfig_record=cursor.fetchall()
                fingerprint_blocked=0
                if blkfig_record:
                    fingerprint_blocked=blkfig_record[0][4]
                #print(records)
                result={"id" : records[0][0],
                        "created" : str(records[0][1]),
                        "objectType" : records[0][2],
                        "email" : records[0][3],
                        "email_blocked":email_blocked,
                        "description": records[0][4],
                        "defaultCardId" : records[0][5],
                        "fingerprint_blocked":fingerprint_blocked,
                        "cards" :{
                              "id" : records[0][9],
                              "created" : str(records[0][10]),
                              "objectType" : records[0][11],
                              "first6" : records[0][13],
                              "last4" : records[0][13],
                              "fingerprint" :records[0][14],
                              "expMonth" : records[0][15],
                              "expYear" : records[0][16],
                              "cardholderName" : records[0][17],
                              "customerId" : records[0][18],
                              "brand" : records[0][19],
                              "type" : records[0][20],
                              "country" : records[0][21]
                            }
                        }
                response = {"status": "success","code": 200,
                            "data": result,
                            "message": ""}
                self.write(response)
            elif records==():
                sql_select_Query = ("SELECT * FROM customers WHERE id=cast(%s as char)")

                cursor.execute(sql_select_Query, (customer_id,))
                records = cursor.fetchall()
                #print(records)
                if records:
                    sql_select_Query = ("SELECT * FROM blacklist WHERE ruleType='email' and email=cast(%s as char)")
                    cursor.execute(sql_select_Query, (records[0][3],))
                    blk_record=cursor.fetchall()
                    email_blocked=0
                    if blk_record:
                        email_blocked=blk_record[0][0]

                    #print(records)
                    result={"id" : records[0][0],
                            "created" : str(records[0][1]),
                            "objectType" : records[0][2],
                            "email" : records[0][3],
                            "email_blocked":email_blocked,
                            "description": records[0][4],
                            "defaultCardId" : records[0][5],
                            "cards" :records[0][6]
                            }
                    response = {"status": "success","code": 200,
                                "data": result,
                                "message": "successfull"}
                    self.write(response)
                else:
                    response = {
                        "status": "error",
                        "code": 400,
                        "data": "",
                        "message": "Bad Request",
                    }
                    raise tornado.web.Finish(response)
            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "",
                    "message": "customer id doesnt exist",
                }
                raise tornado.web.Finish(response)
        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "",
                "message": "Bad Request",
            }
            raise tornado.web.Finish(response)
@jwtauth
class delete_customers(BaseHandler):
    def post(self):
        customer_id = regex(remove_tag(self.get_argument('customerId')))
        if customer_id:

            connection, cursor = db_connect()

            sql_select_Query = ("SELECT * FROM customers WHERE id=cast(%s as char)")

            cursor.execute(sql_select_Query, (customer_id,))
            records = cursor.fetchall()
            #print(records)
            if records:
                sql_select_Query = ("SELECT * FROM customers WHERE id=cast(%s as char)")
                cursor.execute(sql_select_Query, (customer_id,))
                deleted_records=cursor.fetchall()
                Insert_customer = (
                    "INSERT INTO deleted_customers(id ,created ,objectType ,email,description ,defaultCardId,metadata,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)")

                cursor.execute(Insert_customer, (
                str(deleted_records[0][0]), float(deleted_records[0][1]), str(deleted_records[0][2]), str(deleted_records[0][3]),
                str(deleted_records[0][4]),
                str(deleted_records[0][5]), str(deleted_records[0][6]),"admin"))
                connection.commit()

                sql_delete_Query = ("DELETE FROM customers WHERE id=cast(%s as char)")
                #print(customer_id)
                cursor.execute(sql_delete_Query, (customer_id,))
                connection.commit()

                result={
                "id" :customer_id ,}

                response = {"status": "success","code": 200,
                            "data": result,
                            "message": "Customer deleted succesfully"}

                self.write(response)
                sql_select_Query = ("SELECT * FROM cards WHERE customerId=cast(%s as char)")
                cursor.execute(sql_select_Query, (customer_id,))
                records = cursor.fetchall()

                #print(records)
                for i in range(len(records)):


                    Insert_card = (
                        "INSERT INTO deleted_cards(card_id ,created,objectType ,first6,last4 ,fingerprint ,expMonth ,expYear,cardholderName ,customerId ,brand ,type ,country ,addressLine1  ,addressLine2 , addressCity, addressState ,addressZip, addressCountry ,ipAddress , email,userAgent ,acceptLanguage,merchant_id) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                    cursor.execute(Insert_card, (str(records[i][0]), float(records[i][1]), str(records[i][2])
                                                 , int(records[i][3]), int(records[i][4]),
                                                 str(records[i][5])
                                                 , int(records[i][6]), int(records[i][7]),
                                                 str(records[i][8])
                                                 , str(records[i][9])
                                                 , str(records[i][10]), str(records[i][11]), str(records[i][12]),
                                                 str(records[i][13]),
                                                 str(records[i][14]), str(records[i][15])
                                                 , str(records[i][16]), records[i][17], str(records[i][18])
                                                 , str(records[i][19]), str(records[i][20]), str(records[i][21]),
                                                 str(records[i][22]),"admin"))
                    connection.commit()

                sql_select_Query = ("DELETE FROM cards WHERE customerId=cast(%s as char)")
                cursor.execute(sql_select_Query, (customer_id))
                #print(customer_id)
                connection.commit()


                type_event = "CUSTOMER_DELETED"
                id = "event_" + str(uuid.uuid1())
                data = "char_" + str(uuid.uuid1())
                log = "log_" + str(uuid.uuid1())
                created = time.time()

                Insert_event = (
                    "INSERT INTO event(event_id ,created ,objectType ,type ,data ,log,com_id,customer_id,merchant_id ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_event, (id, created, "event", type_event, data, log,result["id"],result["id"],"admin"))
                card=""
                if len(records)!=0:
                    if (records[0][0])==() :
                        card=""                                     #card not exists
                    else:
                        card=records[0][0]
                Insert_data = (
                    "INSERT INTO data(data_id ,created ,objectType ,card,merchant_id) VALUES (%s,%s,%s,%s,%s)")
                cursor.execute(Insert_data, (data, created, "Customer_Deleted", card,"admin"))

                url = "/api/v1/customers/delete"
                platform = self.request.headers.get('platform')
                ipaddress = self.request.headers.get('ipaddress')
                request_body= {"customer_id":customer_id}

                Insert_log = (
                    "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_log, (str(log), float(created), "post", url, int(200), str(ipaddress), str(platform), str(request_body), str(result),"admin"))

                connection.commit()
            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "",
                    "message": "Customer Not Exists",
                }
                raise tornado.web.Finish(response)
        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "",
                "message": "Bad Request",
            }
            raise tornado.web.Finish(response)

@jwtauth
class customer_update(BaseHandler):
    def post(self):
        customer_id = regex(remove_tag(self.get_argument('customerId')))
        email = remove_tag(self.get_argument('email', False))
        description = remove_tag(self.get_argument('description', False))
        defaultCardId = regex(remove_tag(self.get_argument('defaultCardId', False)))
        metadata = remove_tag(self.get_argument('metadata', False))
        card = regex(remove_tag(self.get_argument('card', False)))


        if customer_id:

            connection, cursor = db_connect()


            if email:
                sql_update_Query = ("UPDATE customers SET email = %s WHERE  id =cast(%s as char)")
                cursor.execute(sql_update_Query, (email,customer_id,))
                connection.commit()

            if description:
                sql_update_Query = ("UPDATE customers SET description = %s WHERE  id = cast(%s as char)")
                cursor.execute(sql_update_Query, (description,customer_id,))
                connection.commit()

            if metadata:
                sql_update_Query = ("UPDATE customers SET metadata = %s WHERE  id = cast(%s as char)")
                cursor.execute(sql_update_Query, (metadata,customer_id,))
                connection.commit()

            if defaultCardId:
                try:
                    sql_select_Query = ("SELECT * FROM card WHERE card_id=cast(%s as char)")
                    cursor.execute(sql_select_Query, (defaultCardId,))
                    records = cursor.fetchall()

                    connection.commit()
                    if records:
                        sql_update_Query = ("UPDATE customers SET defaultCardId = %s WHERE  id = cast(%s as char)")
                        cursor.execute(sql_update_Query, (defaultCardId,customer_id,))

                        connection.commit()
                except:
                    response = {
                        "status": "error",
                        "code": 404,
                        "data": "",
                        "message": "defaultCardId, Doesn't exists",
                    }
                    raise tornado.web.Finish(response)
            if card:
                card_id = "card_" + str(uuid.uuid1())
                if card.startswith("tok_"):
                    sql_select_Query = ("SELECT * FROM token WHERE  id =cast(%s as char)")
                    cursor.execute(sql_select_Query, (card,))
                    record = cursor.fetchall()
                    connection.commit()

                    card = {
                        "id":  record[0][0],
                        "created": str(records[0][1]),
                        "objectType": record[0][2],
                        "first6":  record[0][3],
                        "last4":  record[0][4],
                        "fingerprint":  record[0][5],
                        "expMonth": record[0][6],
                        "expYear":  record[0][7],
                        "cardholderName":  record[0][10],
                        "brand": record[0][8],
                        "type":  record[0][9],
                       }
                elif card.startswith("card_"):
                    sql_select_Query = ("SELECT * FROM cards WHERE  id = cast(%s as char)")
                    cursor.execute(sql_select_Query, (card,))
                    record = cursor.fetchall()
                    connection.commit()

                    card = {
                        "id":  record[0][0],
                        "created": str(records[0][1]),
                        "objectType":  record[0][2],
                        "first6":  record[0][3],
                        "last4":  record[0][4],
                        "fingerprint":  record[0][5],
                        "expMonth": record[0][6],
                        "expYear":  record[0][7],
                        "cardholderName":  record[0][8],
                        "customerId":  record[0][9],
                        "brand":  record[0][10],
                        "type": record[0][11],
                        "country":  record[0][12]}
                else:
                    response = {
                        "status": "error",
                        "code": 404,
                        "data": "",
                        "message": "card not exist",
                    }
                    raise tornado.web.Finish(response)

                sql_update_Query = ("UPDATE customers SET defaultCardId = %s WHERE  id = cast(%s as char)")
                cursor.execute(sql_update_Query, (card["id"], customer_id,))

                connection.commit()
                Insert_card = (
                    "INSERT INTO card(card_id ,created ,objectType ,first6 ,last4 ,fingerprint ,expMonth ,expYear,cardholderName ,customerId ,brand ,type ,country,merchant_id ) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_card,
                               (str(card["id"]), str(card["created"]), str(card["objectType"])
                                , str(card["first6"]), str(card["last4"]),
                                str(card["fingerprint"])
                                , str(card["expMonth"]), str(card["expYear"]),
                                str(card["cardholderName"])
                                , str(card["customerId"])
                                , str(card["brand"]), str(card["type"]),
                                str(card["country"]),"admin"))
                connection.commit()

            sql_select_Query = ("SELECT * FROM customers INNER JOIN cards ON customers.id = cards.customerId WHERE id=cast(%s as char)")

            cursor.execute(sql_select_Query, (customer_id,))
            records = cursor.fetchall()
            if records == ():
                sql_select_Query = ("SELECT * FROM customers WHERE id=cast(%s as char)")

                cursor.execute(sql_select_Query, (customer_id,))
                records = cursor.fetchall()
            #print(records)
            if records[0][5] != False and records[0][5] != "0" and records[0][5] != 0 and records[0][5] != "" and len(records[0])==6:
                result = {"id": records[0][0],
                          "created": str(records[0][1]),
                          "objectType": records[0][2],
                          "email": records[0][3],
                          "description": records[0][4],
                          "defaultCardId": records[0][5],
                          "cards": {
                              "id": records[0][8],
                              "created": str(records[0][9]),
                              "objectType": records[0][10],
                              "first6": records[0][11],
                              "last4": records[0][12],
                              "fingerprint": records[0][13],
                              "expMonth": records[0][14],
                              "expYear": records[0][15],
                              "cardholderName": records[0][16],
                              "customerId": records[0][17],
                              "brand": records[0][18],
                              "type": records[0][19],
                              "country": records[0][20],
                          }
                          }
                response = {"status": "success","code": 200,
                            "data": result,
                            "message": "Customer updated succesfully"}
                self.write(response)
            else:
                result = {"id": records[0][0],
                          "created": str(records[0][1]),
                          "objectType": records[0][2],
                          "email": records[0][3],
                          "description": records[0][4],
                          "defaultCardId": records[0][5],
                          }
                response = {"status": "success","code": 200,
                            "data": result,
                            "message": "Customer updated succesfully"}
                self.write(response)


            type_event = "CUSTOMER_UPDATED"
            id = "event_" + str(uuid.uuid1())
            data = "char_" + str(uuid.uuid1())
            log = "log_" + str(uuid.uuid1())
            created = time.time()

            url = "/api/v1/customer/update"
            platform = self.request.headers.get('platform')
            ipaddress = self.request.headers.get('ipaddress')
            request_body= {"customer_id":customer_id,"email":email,"description":description,"defaultCardId":defaultCardId,"metadata":metadata,"card":card}

            Insert_log = (
                "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
            cursor.execute(Insert_log, (str(log), float(created), "post", url, int(200), str(ipaddress), str(platform), str(request_body), str(result),"admin"))


            Insert_event = (
                "INSERT INTO event(event_id ,created ,objectType ,type ,data ,log,com_id,customer_id,merchant_id ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
            cursor.execute(Insert_event, (id, created, "event", type_event, data, log,result["id"],result["id"],"admin"))

            Insert_data = (
                "INSERT INTO data(data_id ,created ,objectType,card ,merchant_id ) VALUES (%s,%s,%s,%s,%s)")
            cursor.execute(Insert_data, (data, created, "Customer_Updated", records[0][5],"admin"))
            connection.commit()
        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "",
                "message": "Bad Request",
            }
            raise tornado.web.Finish(response)



@jwtauth
class list_customer(BaseHandler):
    def get(self):
        created = remove_tag(self.get_argument('created', False))
        operation = remove_tag(self.get_argument('operation', False))
        deleted = remove_tag(self.get_argument('deleted', False))
        email = remove_tag(self.get_argument('email', False))
        limit = remove_tag(self.get_argument('limit', False))
        startingAfterId =regex(remove_tag( self.get_argument('startingAfterId', False)))
        endingBeforeId = regex(remove_tag(self.get_argument('endingBeforeId', False)))
        export = self.get_argument('export', False)
        connection, cursor = db_connect()

        sql_length_query = ("SELECT COUNT(*) FROM customers")
        cursor.execute(sql_length_query)
        length = cursor.fetchall()
        len_records = length[0][0]
        #print("length", len_records)


        if export =='1' or export ==1:
            connection, cursor = db_connect()
            sql = "SELECT * FROM customers"
            cursor.execute(sql)
            data= cursor.fetchall()

            title = [i[0]for i in cursor.description]
            csv_file = f"{email}.csv"
            with open(csv_file,'w') as file:
                writer = csv.writer(file)
                writer.writerow(title)
                writer.writerows(data)

            file.close()
        if limit ==False:
            limit=10

        if deleted==False or deleted=="0":
            if operation=="lt" or operation=="lte" or operation=="gt" or operation=="gte" and created:

                if operation == "lt":
                    sql_select_Query = ("SELECT * FROM customers WHERE created < %s ORDER BY created DESC LIMIT %s")
                elif operation == "lte":
                    sql_select_Query = ("SELECT * FROM customers WHERE created <= %s ORDER BY created DESC LIMIT %s")
                elif operation == "gt":
                    sql_select_Query = ("SELECT * FROM customers WHERE created > %s ORDER BY created DESC LIMIT %s")
                elif operation == "gte":
                    sql_select_Query = ("SELECT * FROM customers WHERE created <= %s ORDER BY created DESC LIMIT %s")

                cursor.execute(sql_select_Query, (float(created),int(limit)))
                records = cursor.fetchall()
                #print("------------",records,len(records))
                connection.commit()
                # len_records=len(records)
                limit =len(records)
                if len(records)==int(limit) and len(records)>0 :
                    CARD_DATA=[]
                    for i in range(int(limit)):
                        sql_select_Query = ("SELECT * FROM cards WHERE card_id= cast(%s as char) ")
                        cursor.execute(sql_select_Query, (records[i][5],))
                        data = cursor.fetchall()
                        CARD_DATA.append(data)
                    result=[]
                    #print("CARD_DATA",CARD_DATA,len(CARD_DATA))
                    for i in range(int(limit)):
                        if CARD_DATA[i] != ():
                            data={
                                  "id" : records[i][0],
                                  "created" : str(records[i][1]),
                                  "objectType" : records[i][2],
                                  "email" : records[i][3],
                                  "defaultCardId" :records[i][5],
                                  "card" : {
                                    "id" : CARD_DATA[i][0][0],
                                    "created" :  str(CARD_DATA[i][0][1]),
                                    "objectType" :  CARD_DATA[i][0][2],
                                    "first6" :  CARD_DATA[i][0][3],
                                    "last4" :  CARD_DATA[i][0][4],
                                    "fingerprint" :  CARD_DATA[i][0][5],
                                    "expMonth" : CARD_DATA[i][0][6],
                                    "expYear" : CARD_DATA[i][0][7],
                                    "cardholderName" :  CARD_DATA[i][0][8],
                                    "customerId" :  CARD_DATA[i][0][9],
                                    "brand" :  CARD_DATA[i][0][10],
                                    "type" :  CARD_DATA[i][0][11],
                                    "country" : CARD_DATA[i][0][12]
                                  },
                                }
                            result.append(data)
                        else:
                            data = {
                                "id": records[i][0],
                                "created": str(records[i][1]),
                                "objectType": records[i][2],
                                "email": records[i][3],
                                "defaultCardId": records[i][5],
                                "card": "",
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



            if email:
                try:
                    sql_select_Query = ("SELECT * FROM customers WHERE email = cast(%s as char) ORDER BY created DESC LIMIT %s ")
                    cursor.execute(sql_select_Query, (email,int(limit)))
                    records = cursor.fetchall()
                    #print(records)
                    results=[]

                    for i in range(len(records)):

                        result = {
                            "id": records[i][0],
                            "created": str(records[i][1]),
                            "objectType": records[i][2],
                            "email": records[i][3],
                            "defaultCardId": records[i][5],
                        }
                        results.append(result)

                    response = {"status": "success","code": 200,
                                "data": results,
                                "data_length": len_records,
                                "message": ""}
                    self.write(response)
                except:
                    response = {
                        "status": "error",
                        "code": 404,
                        "data": "",
                        "message": "Customer not exist",
                    }
                    raise tornado.web.Finish(response)

            if startingAfterId:
                sql_select_Query = ("SELECT created FROM customers WHERE id =cast(%s as char)")
                cursor.execute(sql_select_Query, (startingAfterId))
                record = cursor.fetchall()
                sql_select_Query = ("SELECT * FROM customers WHERE created>= %s ORDER BY created ASC LIMIT 10 ")
                cursor.execute(sql_select_Query, (record))
                records = cursor.fetchall()
                #print(records)
                results = []
                for i in range(len(records)):
                    result = {
                                  "id" : records[i][0],
                                  "created" : str(records[i][1]),
                                  "objectType" : records[i][2],
                                  "email" : records[i][3],
                                  "defaultCardId" :records[i][5],

                    }
                    results.append(result)
                results = results[::-1]
                #print("/////////////",results[::-1])
                response = {"status": "success","code": 200,
                            "data": results,
                            "data_length": len_records,
                            "message": ""}
                self.write(response)


            if endingBeforeId:
                sql_select_Query = ("SELECT created FROM customers WHERE id =cast(%s as char)")
                cursor.execute(sql_select_Query, (endingBeforeId))
                record = cursor.fetchall()
                sql_select_Query = ("SELECT * FROM customers WHERE created<= %s ORDER BY created DESC LIMIT 10 ")
                cursor.execute(sql_select_Query, (record))
                records = cursor.fetchall()
                #print(records)
                results = []
                for i in range(len(records)):
                    result = {
                          "id" : records[i][0],
                                  "created" : str(records[i][1]),
                                  "objectType" : records[i][2],
                                  "email" : records[i][3],
                                  "defaultCardId" :records[i][5],

                    }
                    results.append(result)

                response = {"status": "success","code": 200,
                            "data": results,
                            "data_length": len_records,
                            "message": ""}
                self.write(response)


        if int(deleted):
            if operation == "lt" or operation == "lte" or operation == "gt" or operation == "gte" and created:
                if operation == "lt":
                    sql_select_Query = ("SELECT * FROM deleted_customers WHERE created < %s ORDER BY created DESC LIMIT %s")
                elif operation == "lte":
                    sql_select_Query = ("SELECT * FROM deleted_customers WHERE created <= %s ORDER BY created DESC LIMIT %s")
                elif operation == "gt":
                    sql_select_Query = ("SELECT * FROM deleted_customers WHERE created > %s ORDER BY created DESC LIMIT %s")
                elif operation == "gte":
                    sql_select_Query = ("SELECT * FROM deleted_customers WHERE created <= %s ORDER BY created DESC LIMIT %s")

                cursor.execute(sql_select_Query, (float(created), int(limit)))
                records = cursor.fetchall()
                #print("------------", records, len(records))
                connection.commit()
                if len(records) == int(limit):
                    CARD_DATA = []
                    for i in range(int(limit)):
                        sql_select_Query = ("SELECT * FROM cards WHERE card_id=cast(%s as char)")

                        cursor.execute(sql_select_Query, (records[i][5]))
                        data = cursor.fetchall()
                        CARD_DATA.append(data)
                    result = []
                    #print("CARD_DATA", CARD_DATA, len(CARD_DATA))
                    for i in range(int(limit)):
                        if CARD_DATA[i] != ():
                            data = {
                                "id": records[i][0],
                                "created": str(records[i][1]),
                                "objectType": records[i][2],
                                "email": records[i][3],
                                "defaultCardId": records[i][5],
                                "card": {
                                    "id": CARD_DATA[i][0][0],
                                    "created": str(CARD_DATA[i][0][1]),
                                    "objectType": CARD_DATA[i][0][2],
                                    "first6": CARD_DATA[i][0][3],
                                    "last4": CARD_DATA[i][0][4],
                                    "fingerprint": CARD_DATA[i][0][5],
                                    "expMonth": CARD_DATA[i][0][6],
                                    "expYear": CARD_DATA[i][0][7],
                                    "cardholderName": CARD_DATA[i][0][8],
                                    "customerId": CARD_DATA[i][0][9],
                                    "brand": CARD_DATA[i][0][10],
                                    "type": CARD_DATA[i][0][11],
                                    "country": CARD_DATA[i][0][12]
                                },
                            }
                            result.append(data)
                        else:
                            data = {
                                "id": records[i][0],
                                "created": str(records[i][1]),
                                "objectType": records[i][2],
                                "email": records[i][3],
                                "defaultCardId": records[i][5],
                                "card": "",
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
                    raise tornado.web.Finish(response)

            if email:
                try:
                    sql_select_Query = ("SELECT * FROM deleted_customers WHERE email = cast(%s as char) ORDER BY created DESC LIMIT %s ")
                    cursor.execute(sql_select_Query, (email, int(limit)))
                    records = cursor.fetchall()
                    #print(records)
                    results = []

                    for i in range(len(records)):
                        result = {
                            "id": records[i][0],
                            "created": str(records[i][1]),
                            "objectType": records[i][2],
                            "email": records[i][3],
                            "defaultCardId": records[i][5],
                        }
                        results.append(result)

                    response = {"status": "success","code": 200,
                                "data": results,
                                "data_length": len_records,
                                "message": ""}
                    self.write(response)
                except:
                    response = {
                        "status": "error",
                        "code": 404,
                        "data": "",
                        "message": "Customer not exist",
                    }
                    raise tornado.web.Finish(response)

            if startingAfterId:
                sql_select_Query = ("SELECT created FROM deleted_customers WHERE id = cast(%s as char)")
                cursor.execute(sql_select_Query, (startingAfterId))
                record = cursor.fetchall()
                sql_select_Query = ("SELECT * FROM deleted_customers WHERE created>= %s ORDER BY created ASC LIMIT 10 ")
                cursor.execute(sql_select_Query, (record))
                records = cursor.fetchall()
                #print(records)
                results = []
                for i in range(len(records)):
                    result = {
                        "id": records[i][0],
                        "created": str(records[i][1]),
                        "objectType": records[i][2],
                        "email": records[i][3],
                        "defaultCardId": records[i][5],

                    }
                    results.append(result)
                results = results[::-1]

                response = {"status": "success","code": 200,
                            "data": results,
                            "data_length": len_records,
                            "message": ""}
                self.write(response)

            if endingBeforeId:
                sql_select_Query = ("SELECT created FROM deleted_customers WHERE id = cast(%s as char)")
                cursor.execute(sql_select_Query, (endingBeforeId))
                record = cursor.fetchall()
                sql_select_Query = ("SELECT * FROM deleted_customers WHERE created<= %s ORDER BY created DESC LIMIT 10 ")
                cursor.execute(sql_select_Query, (record))
                records = cursor.fetchall()
                #print(records)
                results = []
                for i in range(len(records)):
                    result = {
                        "id": records[i][0],
                        "created": str(records[i][1]),
                        "objectType": records[i][2],
                        "email": records[i][3],
                        "defaultCardId": records[i][5],

                    }
                    results.append(result)
                    results = results[::-1]

                response = {"status": "success", "code": 200,
                            "data": results,
                            "data_length": len_records,
                            "message": ""}
                self.write(response)

# @jwtauth
# class customer_filter(BaseHandler):

#     def post(self):
#         email = remove_tag(self.get_argument('email',False))
#         description=remove_tag(self.get_argument('description',False))
#         card = remove_tag(self.get_argument('card',False))
#         subscription = remove_tag(self.get_argument('subscription', False))
#         planid = remove_tag(self.get_argument('planid', False))
#         customer_id=remove_tag(self.get_argument('customer_id',False))
#         last_date = (self.get_argument('last_date',False))
#         start_date = remove_tag(self.get_argument('start_date', False))

#         connection, cursor = db_connect()
#         #print(last_date , start_date)
#         if card and not (subscription or planid):
#             q="SELECT * FROM customers JOIN cards ON customers.id = cards.customerId "
#         if card =='0':
#             q="SELECT  * FROM    customers WHERE   customers.id  NOT IN (SELECT cards.customerId FROM cards)"
#         if (subscription or planid) and not card:
#             q="SELECT * FROM customers JOIN subscription ON customers.id = subscription.customer_id "
#         if card and (subscription or planid):
#             q="SELECT * FROM customers JOIN cards ON customers.id = cards.customerId JOIN subscription ON customers.id = subscription.customer_id"
#         if not (card!=0 or card) and not subscription and not planid:
#             q="SELECT * FROM customers"
#         if email or description or customer_id:
#             q += " WHERE customers.id IS NOT NULL "
#         if email:
#             q += " AND customers.email='{}'".format(email)
#         if description:
#             q += " AND customers.description='{}'".format(description)
#         if planid:
#             q += " AND subscription.planId='{}'".format(planid)
#         if last_date and start_date:
#             q += " AND customers.created BETWEEN '{}' AND '{}'".format(float(start_date), float(last_date))
#         #print(q,"==============================")
#         try:
#             cursor.execute(q)
#             records = cursor.fetchall()
#             #print(records)
#         except:
#             response = {
#                 "status": "error",
#                 "code": 404,
#                 "data": "",
#                 "message": "Bad Request",
#             }
#             raise tornado.web.Finish(response)


#         if records:
#             results=[]
#             for i in range(len(records)):
#                 result={"id" : records[i][0],
#                         "created" : str(records[i][1]),
#                         "objectType" : records[i][2],
#                         "email" : records[i][3],
#                         "defaultCardId" : records[i][5],
#                         }
#                 results.append(result)
#             response = {"status": "success","code": 200,"query":q,
#                         "data": results,
#                         "message": ""}
#             self.write(response)
#         elif records==():

#                 response = {
#                     "status": "success",
#                     "code": 200,
#                     "data": "",
#                     "message": "No data available",
#                 }
#                 raise tornado.web.Finish(response)
#         else:
#             response = {
#                 "status": "error",
#                 "code": 404,
#                 "data": "",
#                 "message": "Bad Request",
#             }
#             raise tornado.web.Finish(response)


@jwtauth
class customer_filter(BaseHandler):

    def post(self):
        email = remove_tag(self.get_argument('email',False))
        description=remove_tag(self.get_argument('description',False))
        card = remove_tag(self.get_argument('card',False))
        subscription = remove_tag(self.get_argument('subscription', False))
        planid = remove_tag(self.get_argument('planId', False))
        customer_id=remove_tag(self.get_argument('customerId',False))
        last_date = (self.get_argument('last_date',False))
        start_date = remove_tag(self.get_argument('start_date', False))

        token = self.request.headers.get('Authorization')
        limit=self.get_argument('limit', False)
        # m_id = remove_tag(self.get_argument('m_id'))
        time=self.get_argument('time', False)
        pre_time=self.get_argument('pre_time', False)


        # if export =='1' and export == 1:
        #     connection, cursor = db_connect()
        #     sql = "SELECT * FROM customers"
        #     cursor.execute(sql)
        #     data= cursor.fetchall()

        #     title = [i[0]for i in cursor.description]

        #     # plan = "lg_hp"
        #     csv_file = f"{email}.csv"
        #     with open(csv_file,'w') as file:
        #         writer = csv.writer(file)
        #         writer.writerow(title)
        #         writer.writerows(data)

        #     file.close()

        if limit ==False:
            limit=10
        else:
            limit=int(limit)
        
        if limit>100:
            limit=100

        if subscription or planid:
            # #print(merchant_id,'merchant_id')
            connection, cursor = db_connect()

            query = f"SELECT * FROM customers INNER JOIN subscription ON customers.id = subscription.customer_id WHERE customers.created<{time}"
            count_query = f"SELECT COUNT(*) FROM customers INNER JOIN subscription ON customers.id = subscription.customer_id WHERE customers.created<{time}"
            if pre_time:
                query =f"SELECT * FROM customers INNER JOIN subscription ON customers.id = subscription.customer_id WHERE customers.created>{pre_time}"

            if start_date and last_date:
                if query[-5:] == "WHERE":
                    add = f" customers.created BETWEEN {start_date} AND {last_date}"
                else:
                    add = f" AND customers.created BETWEEN {start_date} AND {last_date}"

                query = query + add
                count_query=count_query+add
            
            if email:
                if query[-5:] == "WHERE":
                    add = f" customers.email = '{email}'"
                else:
                    add = f" AND customers.email = '{email}'"

                query = query + add
                count_query=count_query+add

            if description:
                if query[-5:] == "WHERE":
                    add = f" customers.description = '{description}'"
                else:
                    add = f" AND customers.description = '{description}'"
            
                query = query + add
                count_query=count_query+add

            # if partner=="Show my offers":
            #     if query[-5:] == "WHERE":
            #         add = f" merchant_id = '{merchant_id}'"
            #     else:
            #         add = f" AND merchant_id = '{merchant_id}'"
            
            #     query = query + add
            if subscription:
                if query[-5:] == "WHERE":
                    add = f" subscription.status_active = '{subscription}'"
                else:
                    add = f" AND subscription.status_active = '{subscription}'"
            
                query = query + add
                count_query=count_query+add

            if planid:
                if query[-5:] == "WHERE":
                    add = f" subscription.planid = '{planid}'"
                else:
                    add = f" AND subscription.planid = '{planid}'"
                query = query + add
                count_query=count_query+add

            if customer_id:
                if query[-5:] == "WHERE":
                    add = f" customers.id = '{customer_id}'"
                else:
                    add = f" AND customers.id = '{customer_id}'"
                query = query + add
                count_query=count_query+add
            if time:
                if query[-5:] == "WHERE" :
                    add = f" ORDER BY customers.created DESC LIMIT {limit}"

                else:
                    add = f" ORDER BY customers.created DESC LIMIT {limit}"
            if pre_time:
                if query[-5:] == "WHERE" and pre_time:
                    add = f"  ORDER BY customers.created ASC LIMIT {limit}"

                else:
                    add = f" ORDER BY customers.created ASC LIMIT {limit}"
            
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
                            "email": records[i][3],
                            "defaultCardId": records[i][5],

                        }
                    results.append(result)
                if pre_time:
                    results=results[::-1]
                response ={
                    "status": "success",
                    "code": 200,
                    "data":results,
                    "data_length":count[0][0],
                    "message": "",}
                self.write(response)
            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "",
                    "message": "data not available",
                }
                raise tornado.web.Finish(response)
        else:
            
            connection, cursor = db_connect()

            query = f"SELECT * FROM customers WHERE created<{time}"
            count_query = f"SELECT COUNT(*) FROM customers WHERE created<{time}"
            if pre_time:
                query =f"SELECT * FROM customers WHERE created>{pre_time}"


            if start_date and last_date:
                if query[-5:] == "WHERE":
                    add = f" created BETWEEN {start_date} AND {last_date}"
                else:
                    add = f" AND created BETWEEN {start_date} AND {last_date}"

                query = query + add
                count_query=count_query+add
            
            if email:
                if query[-5:] == "WHERE":
                    add = f" email = '{email}'"
                else:
                    add = f" AND email = '{email}'"

                query = query + add
                count_query=count_query+add

            if description:
                if query[-5:] == "WHERE":
                    add = f" description = '{description}'"
                else:
                    add = f" AND description = '{description}'"
            
                query = query + add
                count_query=count_query+add

            # if partner=="Show my offers":
            #     if query[-5:] == "WHERE":
            #         add = f" merchant_id = '{merchant_id}'"
            #     else:
            #         add = f" AND merchant_id = '{merchant_id}'"
            
            #     query = query + add
            

            if customer_id:
                if query[-5:] == "WHERE":
                    add = f" id = '{customer_id}'"
                else:
                    add = f" AND id = '{customer_id}'"
                query = query + add
                count_query=count_query+add
            if time:
                if query[-5:] == "WHERE" and time:
                    add = f" ORDER BY created DESC LIMIT {limit}"

                else:
                    add = f" ORDER BY created DESC LIMIT {limit}"
            if pre_time:
                if query[-5:] == "WHERE" :
                    add = f" ORDER BY created ASC LIMIT {limit}"

                else:
                    add = f" ORDER BY created ASC LIMIT {limit}"
            
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
                            "email": records[i][3],
                            "defaultCardId": records[i][5],

                        }
                    results.append(result)
                if pre_time:
                    results=results[::-1]
                response ={
                    "status": "success",
                    "code": 200,
                    "data":results,
                    "data_length":count[0][0],
                    "message": "",}
                self.write(response)
            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "",
                    "message": "data not available",
                }
                raise tornado.web.Finish(response)
        





        # if card:
        #     card_query="INNER JOIN cards ON customers.id = cards.customerId"
        #
        # query = "SELECT * FROM `customers` AS c WHERE c.`categoryID`={}".format(category_id)
        # if email:
        #     query += " AND c.`email`={}".format(email)
        # if description:
        #     query += " AND c.`description`={}".format(description)
        # if subscription:
        #     query += " AND c.`subscription`={}".format(email)
        # if email:
        #     query += " AND c.`email`={}".format(email)
        # if email:
        #     query += " AND c.`email`={}".format(email)
