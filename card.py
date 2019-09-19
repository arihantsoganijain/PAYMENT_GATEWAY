import tornado.web
import tornado.ioloop
import hashlib
import time
import uuid
import pymysql
import cc_brand
import json
from remove_tags import *
from auth import *
from cross_origin import *
from db import *




@jwtauth
class card(BaseHandler):
    def post(self):
        customerId = regex(remove_tag(self.get_argument('customerId')))
        card = regex(remove_tag(self.get_argument('token',False)))
        number = remove_tag(self.get_argument('number',False))
        exp_month = remove_tag(self.get_argument('expMonth',False))
        exp_year = remove_tag(self.get_argument('expYear',False))
        cvc = remove_tag(self.get_argument('cvc',False))
        cardholdername = remove_tag(self.get_argument('cardholderName',False))
        addressLine1 = remove_tag(self.get_argument('addressLine1',False))
        addressLine2 = remove_tag(self.get_argument('addressLine2',False))
        addressCity = remove_tag(self.get_argument('addressCity',False))
        addressState = remove_tag(self.get_argument('addressState',False))
        addressZip = remove_tag(self.get_argument('addressZip',False))
        addressCountry = remove_tag(self.get_argument('addressCountry',False))
        ipAddress = remove_tag(self.get_argument('ipAddress',False))
        email = remove_tag(self.get_argument('email',False))
        userAgent = remove_tag(self.get_argument('userAgent',False))
        acceptLanguage = remove_tag(self.get_argument('acceptLanguage',False))

        #print(customerId,card,number,exp_month,exp_year,cvc)
        if customerId:

            connection, cursor = db_connect()

            if card:
                if card.startswith("tok_"):
                    sql_select_Query = ("SELECT * FROM token WHERE  id = cast(%s as char)")
                    cursor.execute(sql_select_Query, (card,))
                    token_record = cursor.fetchall()
                    connection.commit()



                    if token_record:
                        card = {
                            "id": "card_" + str(uuid.uuid1()),
                            "created": time.time(),
                            "objectType": "card",
                            "first6": token_record[0][3],
                            "last4": token_record[0][4],
                            "fingerprint": token_record[0][5],
                            "expMonth": token_record[0][6],
                            "expYear": token_record[0][7],
                            "cardholderName":token_record[0][10],
                            "customerId": customerId,
                            "brand": token_record[0][8],
                            "type": token_record[0][9],
                            "country": "country",
                            "addressLine1": addressLine1,
                            "addressLine2": addressLine2,
                            "addressCity": addressCity,
                            "addressState": addressState,
                            "addressZip": addressZip,
                            "addressCountry": addressCountry,
                            "ipAddress": ipAddress,
                            "email": email ,
                            "userAgent": userAgent,
                            "acceptLanguage": acceptLanguage
                        }
                    else:
                        response = {
                            "status": "error",
                            "code": 404,
                            "data": "null",
                            "message": "The Token given is not exist",
                        }
                        raise tornado.web.Finish(response)
            elif number and exp_month and exp_year and cvc:
                brand = cc_brand.cc_brand(number)
                fingereprint = hashlib.sha224(number.encode()).hexdigest()
                card = {
                    "id": "card_" + str(uuid.uuid1()),
                    "created": time.time(),
                    "objectType": "card",
                    "first6": number[:6],
                    "last4": number[-4:],
                    "fingerprint":fingereprint,
                    "expMonth": exp_month,
                    "expYear":  exp_year ,
                    "cardholderName": cardholdername,
                    "customerId": customerId,
                    "brand": brand,
                    "type": "type",
                    "country": "country",
                    "addressLine1": addressLine1,
                    "addressLine2": addressLine2,
                    "addressCity": addressCity,
                    "addressState": addressState,
                    "addressZip": addressZip,
                    "addressCountry": addressCountry,
                    "ipAddress": ipAddress,
                    "email": email,
                    "userAgent": userAgent,
                    "acceptLanguage": acceptLanguage

                }
            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "null",
                    "message": "please provide card detail",
                }
                raise tornado.web.Finish(response)

            # if card.startswith("char_"):
            #     sql_select_Query = ("SELECT card_id AND customerId FROM charge_database WHERE  id = %s")
            #     cursor.execute(sql_select_Query, (card,))
            #     record = cursor.fetchall()
            #     connection.commit()
            #     if record[0][0].startswith("card_") and record[0][0]=="":

            # if number and exp_month and exp_year and cardholdername:
            #     brand = cc_brand.cc_brand(number)
            #
            #
            #     if token_record:
            #         card = {
            #             "id": "card_" + str(uuid.uuid1()),
            #             "created": time.time(),
            #             "objectType": "card",
            #             "first6": token_record[0][3],
            #             "last4": token_record[0][4],
            #             "fingerprint": token_record[0][5],
            #             "expMonth": token_record[0][6],
            #             "expYear": token_record[0][7],
            #             "cardholderName": token_record[0][10],
            #             "customerId": card,
            #             "brand": token_record[0][8],
            #             "type": token_record[0][9],
            #             "country": token_record[0][5],
            #             "addressLine1": addressLine1,
            #             "addressLine2": addressLine2,
            #             "addressCity": addressCity,
            #             "addressState": addressState,
            #             "addressZip": addressZip,
            #             "addressCountry": addressCountry,
            #             "ipAddress": ipAddress,
            #             "email": email,
            #             "userAgent": userAgent,
            #             "acceptLanguage": acceptLanguage
            #         }
            if card :
                #print((card["id"]), (card["created"]), (card["objectType"])
                #       , (card["first6"]), (card["last4"]),
                #       (card["fingerprint"])
                #       , (card["expMonth"]), (card["expYear"]),
                #       (card["cardholderName"])
                #       , (card["customerId"])
                #       , (card["brand"]), (card["type"]), (card["country"]), (card["addressLine1"]),
                #       (card["addressLine2"]),
                #       (card["addressCity"])
                #       , (card["addressState"]), (card["addressZip"]), (card["addressCountry"])
                #       , (card["ipAddress"]), (card["email"]), (card["userAgent"]), str(card["acceptLanguage"]))
                # #print(str(card["id"]), float(card["created"]), str(card["objectType"])
                #                 , int(card["first6"]), int(card["last4"]),
                #                 str(card["fingerprint"])
                #                 , int(card["expMonth"]), int(card["expYear"]),
                #                 str(card["cardholderName"])
                #                 , str(card["customerId"])
                #                 , str(card["brand"]), str(card["type"]), str(card["country"]), str(card["addressLine1"]), str(card["addressLine2"]),
                #                 str(card["addressCity"])
                #                 , str(card["addressState"]), int(card["addressZip"]),str(card["addressCountry"])
                #                 , str(card["ipAddress"]), str(card["email"]), str(card["userAgent"]), str(card["acceptLanguage"]))



                Insert_card = ("INSERT INTO cards(card_id ,created,objectType ,first6,last4 ,fingerprint ,expMonth ,expYear,cardholderName ,customerId ,brand ,type ,country ,addressLine1  ,addressLine2 , addressCity, addressState ,addressZip, addressCountry ,ipAddress , email,userAgent ,acceptLanguage,merchant_id) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_card,(str(card["id"]), float(card["created"]), str(card["objectType"])
                                , int(card["first6"]), int(card["last4"]),
                                str(card["fingerprint"])
                                , int(card["expMonth"]), int(card["expYear"]),
                                str(card["cardholderName"])
                                , str(card["customerId"])
                                , str(card["brand"]), str(card["type"]), str(card["country"]), addressLine1,addressLine2,addressCity
                                , addressState, addressZip,addressCountry
                                , ipAddress, email, userAgent, acceptLanguage,"admin"))
                connection.commit()


                result={
                      "id" : card["id"],
                      "created" : str(card["created"]),
                      "objectType" : card["objectType"],
                      "first6" : card["first6"],
                      "last4" : card["last4"],
                      "fingerprint" : card["fingerprint"],
                      "expMonth" : card["expMonth"],
                      "expYear" : card["expYear"],
                      "cardholderName" : card["cardholderName"],
                      "customerId" : card["customerId"],
                      "brand" : card["brand"],
                      "type" : card["type"],
                      "country" : card["country"]
                    }
                type_event = "CUSTOMER_CARD_CREATED"
                id = "event_" + str(uuid.uuid1())
                data = "char_" + str(uuid.uuid1())
                log = "log_" + str(uuid.uuid1())
                created = time.time()

                url = "/api/v1/card/create"
                platform = self.request.headers.get('platform')
                ipaddress = self.request.headers.get('ipaddress')

                request_body= {"customerId":customerId,"card":card,"number":number,"exp_month":exp_month,"exp_year":exp_year,
                "cvc":cvc,"cardholdername":cardholdername,"addressLine1":addressLine1,"addressLine2":addressLine2,
                "addressCity":addressCity,"addressState":addressState,"addressZip":addressZip,"addressCountry":addressCountry,
                "ipAddress":ipAddress,"email":email,
                "userAgent":userAgent,"acceptLanguage":acceptLanguage,}

                Insert_log = (
                    "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_log, (str(log), float(created), "post", url, int(200), str(ipaddress), str(platform), str(request_body), str(result),"admin"))

                

                Insert_event = (
                    "INSERT INTO event(event_id ,created ,objectType ,type ,data ,log,com_id,customer_id,merchant_id ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_event, (id, created, "event", type_event, data, log,card["id"],customerId,"admin"))

                Insert_data = (
                    "INSERT INTO data(data_id ,created ,objectType ,card,merchant_id) VALUES (%s,%s,%s,%s,%s)")
                cursor.execute(Insert_data, (data, created, "Card_Created", card["id"],"admin"))
                connection.commit()
                #print(result)
                response={"status": "success","code": 200,
                "data": result,
                "message": "card created successfully"}
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
        customer_id = regex(remove_tag(self.get_argument('customerId')))
        card_id = regex(remove_tag(self.get_argument('card_id',False)))
        if customer_id and card_id:
            connection, cursor = db_connect()

            sql_select_Query = "SELECT * FROM cards WHERE customerId=cast(%s as char) AND card_id=cast(%s as char)"

            cursor.execute(sql_select_Query, (customer_id,card_id,))
            records = cursor.fetchall()

            sql_select_Query = ("SELECT * FROM blacklist WHERE ruleType='fingerprint' and fingerprint=cast(%s as char)")
            cursor.execute(sql_select_Query, (records[0][5],))
            blkfig_record=cursor.fetchall()
            fingerprint_blocked=0
            if blkfig_record:
                fingerprint_blocked=blkfig_record[0][4]

            #print(records)
            result={"id" : records[0][0],
                  "created" :  str(records[0][1]),
                  "objectType" : records[0][2],
                  "first6" : records[0][3],
                  "last4" : records[0][4],
                  "fingerprint" : records[0][5],
                  "fingerprint_blocked":fingerprint_blocked,
                  "expMonth" : records[0][6],
                  "expYear" : records[0][7],
                  "cardholderName" : records[0][8],
                  "customerId" : records[0][9],
                  "brand" : records[0][10],
                  "type" : records[0][11],
                  "country" :records[0][12]
                }
            response={"status": "success","code": 200,
            "data": result,
            "message": ""}
            self.write(response)

        elif customer_id :
            connection, cursor = db_connect()

            sql_select_Query = "SELECT * FROM cards WHERE customerId=cast(%s as char) "

            cursor.execute(sql_select_Query, (customer_id))
            records = cursor.fetchall()

            sql_select_Query = ("SELECT * FROM blacklist WHERE ruleType='fingerprint' and fingerprint=cast(%s as char)")
            cursor.execute(sql_select_Query, (records[0][5],))
            blkfig_record=cursor.fetchall()
            fingerprint_blocked=0
            if blkfig_record:
                fingerprint_blocked=blkfig_record[0][4]

            #print(records)
            results=[]
            for i in range(len(records)):
                result={"id" : records[i][0],
                      "created" :  str(records[i][1]),
                      "objectType" : records[i][2],
                      "first6" : records[i][3],
                      "last4" : records[i][4],
                      "fingerprint" : records[i][5],
                      "fingerprint_blocked":fingerprint_blocked,
                      "expMonth" : records[i][6],
                      "expYear" : records[i][7],
                      "cardholderName" : records[i][8],
                      "customerId" : records[i][9],
                      "brand" : records[i][10],
                      "type" : records[i][11],
                      "country" :records[i][12]
                    }
                results.append(result)
            response={"status": "success","code": 200,
            "data": results,
            "message": ""}
            self.write(response)
        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "null",
                "message": "Bad Request (Missing argument) ",
            }
            raise tornado.web.Finish(response)
@jwtauth
class delete_card(BaseHandler):

    def post(self):
        customer_id = regex(remove_tag(self.get_argument('customerId')))
        card_id = regex(remove_tag(self.get_argument('card_id')))
        if customer_id and card_id:
            connection, cursor = db_connect()

            sql_select_Query = "SELECT * FROM cards WHERE customerId=cast(%s as char) AND card_id=cast(%s as char)"
            cursor.execute(sql_select_Query, (customer_id, card_id,))
            records = cursor.fetchall()

            if records:
                Insert_card = (
                    "INSERT INTO deleted_cards(card_id ,created,objectType ,first6,last4 ,fingerprint ,expMonth ,expYear,cardholderName ,customerId ,brand ,type ,country ,addressLine1  ,addressLine2 , addressCity, addressState ,addressZip, addressCountry ,ipAddress , email,userAgent ,acceptLanguage,merchant_id) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_card, (str(records[0][0]), float(records[0][1]), str(records[0][2])
                                            , int(records[0][3]), int(records[0][4]),
                                            str(records[0][5])
                                            , int(records[0][6]), int(records[0][7]),
                                            str(records[0][8])
                                            , str(records[0][9])
                                            , str(records[0][10]), str(records[0][11]), str(records[0][12]), str(records[0][13]),
                                            str(records[0][14]), str(records[0][15])
                                            , str(records[0][16]), int(records[0][17]), str(records[0][18])
                                            , str(records[0][19]), str(records[0][20]), str(records[0][21]), str(records[0][22]),"admin"))
                connection.commit()
            else:
                response = {
                "status": "error",
                "code": 400,
                "data": "null",
                "message": "data not exist",}

                raise tornado.web.Finish(response)
        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "null",
                "message": "Bad Request (Missing argument) ",
            }
            raise tornado.web.Finish(response)


        if records:

            sql_select_Query = "DELETE FROM cards WHERE customerId=cast(%s as char) AND card_id=cast(%s as char)"

            cursor.execute(sql_select_Query, (customer_id, card_id,))

            connection.commit()

            type_event = "CUSTOMER_CARD_DELETED"
            id = "event_" + str(uuid.uuid1())
            data = "char_" + str(uuid.uuid1())
            log = "log_" + str(uuid.uuid1())
            created = time.time()
            
            result={"card_id":card_id}
            response = {"status": "success","code": 200,
                        "data": result,
                        "message": "card deleted successfully"}
            self.write(response)

            url = "/api/v1/card/delete"
            platform = self.request.headers.get('platform')
            ipaddress = self.request.headers.get('ipaddress')

            request_body= {"customer_id":customer_id,"card_id":card_id}

            Insert_log = (
                "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
            cursor.execute(Insert_log, (str(log), float(created), "post", url, int(200), str(ipaddress), str(platform), str(request_body), str(response["data"]),"admin"))



            Insert_event = (
                "INSERT INTO event(event_id ,created ,objectType ,type ,data ,log,com_id,customer_id,merchant_id ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
            cursor.execute(Insert_event, (id, created, "event", type_event, data, log,card_id,customer_id,"admin"))

            Insert_data = (
                "INSERT INTO data(data_id ,created ,objectType ,card,merchant_id  ) VALUES (%s,%s,%s,%s,%s)")
            cursor.execute(Insert_data, (
                data, created, "Card_Deleted", card_id,"admin"))
            connection.commit()
            
            
        else:
            response = {
                "status": "error",
                "code": 404,
                "data": "null",
                "message": "Something went wrong ",
            }
            raise tornado.web.Finish(response)


@jwtauth
class card_update(BaseHandler):
    def post(self):
        customer_id = regex(remove_tag(self.get_argument('customerId')))
        card_id = regex(remove_tag(self.get_argument('cardId')))
        expMonth = remove_tag(self.get_argument('expMonth', False))
        expYear = remove_tag(self.get_argument('expYear', False))
        cardholderName = remove_tag(self.get_argument('cardholderName', False))
        addressCountry =remove_tag (self.get_argument('addressCountry', False))
        addressCity = remove_tag(self.get_argument('addressCity', False))
        addressState = remove_tag(self.get_argument('addressState', False))
        addressZip = remove_tag(self.get_argument('addressZip', False))
        addressLine1 = remove_tag(self.get_argument('addressLine1', False))
        addressLine2 = remove_tag(self.get_argument('addressLine2', False))


        if customer_id and card_id:

            #print(customer_id,card_id)

            connection, cursor = db_connect()

            sql_select_Query = "SELECT * FROM cards WHERE customerId=cast(%s as char) AND card_id=cast(%s as char)"

            cursor.execute(sql_select_Query, (customer_id, card_id,))
            records = cursor.fetchall()

            if records:
                if expMonth:
                    sql_update_Query = ("UPDATE cards SET expMonth = %s WHERE  customerId=cast(%s as char) AND card_id=cast(%s as char)")
                    cursor.execute(sql_update_Query, (expMonth,customer_id, card_id,))

                    connection.commit()

                if expYear:
                    sql_update_Query = ("UPDATE cards SET expYear = %s WHERE  customerId=cast(%s as char) AND card_id=cast(%s as char)")
                    cursor.execute(sql_update_Query, (expYear, customer_id, card_id,))

                    connection.commit()

                if cardholderName:
                    sql_update_Query = ("UPDATE cards SET cardholderName = %s WHERE  customerId=cast(%s as char) AND card_id=cast(%s as char)")
                    cursor.execute(sql_update_Query, (cardholderName, customer_id, card_id,))

                    connection.commit()

                if addressCountry:
                    sql_update_Query = ("UPDATE cards SET addressCountry = %s WHERE  customerId=cast(%s as char) AND card_id=cast(%s as char)")
                    cursor.execute(sql_update_Query, (addressCountry, customer_id, card_id,))

                    connection.commit()

                if addressCity:
                    sql_update_Query = ("UPDATE cards SET addressCity = %s WHERE  customerId=cast(%s as char) AND card_id=cast(%s as char)")
                    cursor.execute(sql_update_Query, (addressCity, customer_id, card_id,))

                    connection.commit()

                if addressState:
                    sql_update_Query = ("UPDATE cards SET addressState = %s WHERE  customerId=cast(%s as char) AND card_id=cast(%s as char)")
                    cursor.execute(sql_update_Query, (addressState, customer_id, card_id,))

                    connection.commit()

                if addressZip:
                    sql_update_Query = ("UPDATE cards SET addressZip = %s WHERE  customerId=cast(%s as char) AND card_id=cast(%s as char)")
                    cursor.execute(sql_update_Query, (int(addressZip), customer_id, card_id,))

                    connection.commit()

                if addressLine1:
                    sql_update_Query = ("UPDATE cards SET addressLine1 = %s WHERE  customerId=cast(%s as char) AND card_id=cast(%s as char)")
                    cursor.execute(sql_update_Query, (expMonth, customer_id, card_id,))

                    connection.commit()

                if addressLine2:
                    sql_update_Query = ("UPDATE cards SET addressLine2 = %s WHERE  customerId=cast(%s as char) AND card_id=cast(%s as char)")
                    cursor.execute(sql_update_Query, (addressLine2, customer_id, card_id,))


                    connection.commit()
            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "null",
                    "message": "Something went wrong ",
                }
                raise tornado.web.Finish(response)


            sql_select_Query = "SELECT * FROM cards WHERE customerId=cast(%s as char) AND card_id=cast(%s as char)"

            cursor.execute(sql_select_Query, (customer_id, card_id,))
            records = cursor.fetchall()

            result = {"id": records[0][0],
                      "created":  str(records[0][1]),
                      "objectType": records[0][2],
                      "first6": records[0][3],
                      "last4": records[0][4],
                      "fingerprint": records[0][5],
                      "expMonth": records[0][6],
                      "expYear": records[0][7],
                      "cardholderName": records[0][8],
                      "customerId": records[0][9],
                      "brand": records[0][10],
                      "type": records[0][11],
                      "country": records[0][12]
                      }
            type_event = "CUSTOMER_CARD_UPDATE"
            id = "event_" + str(uuid.uuid1())
            data = "char_" + str(uuid.uuid1())
            log = "log_" + str(uuid.uuid1())
            created = time.time()


            Insert_event = (
                "INSERT INTO event(event_id ,created ,objectType ,type ,data ,log,com_id,customer_id,merchant_id ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
            cursor.execute(Insert_event, (id, created, "event", type_event, data, log,card_id,customer_id,"admin"))

            Insert_data = (
                "INSERT INTO data(data_id ,created ,objectType ,card,merchant_id  ) VALUES (%s,%s,%s,%s,%s)")
            cursor.execute(Insert_data, (
                data, created, "Card_update", records[0][0],"admin"))
            
            response={"status": "success","code": 200,
                    "data": result,
                    "message": "card update successfully"}
            self.write(response)

            url = "/api/v1/card/update"
            platform = self.request.headers.get('platform')
            ipaddress = self.request.headers.get('ipaddress')

            request_body= {"customer_id":customer_id,"card_id":card_id,"expMonth":expMonth,"expYear":expYear,
                "addressCountry":addressCountry,"addressCity":addressCity,"addressLine1":addressLine1,"addressLine2":addressLine2,"addressZip":addressZip}
      
            Insert_log = (
                "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
            cursor.execute(Insert_log, (str(log), float(created), "post", url, int(200), str(ipaddress), str(platform), str(request_body), str(response["data"]),"admin"))
            connection.commit()


        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "null",
                "message": "Bad Request ",
            }
            raise tornado.web.Finish(response)




@jwtauth
class list_card(BaseHandler):
    def get(self):
        customerId = regex(remove_tag(self.get_argument('customerId')))
        created = remove_tag(self.get_argument('created', False))
        operation = remove_tag(self.get_argument('operation', False))
        deleted = remove_tag(self.get_argument('deleted', False))
        limit = remove_tag(self.get_argument('limit', False))
        startingAfterId = regex(remove_tag(self.get_argument('startingAfterId', False)))
        endingBeforeId = regex(remove_tag(self.get_argument('endingBeforeId', False)))

        connection, cursor = db_connect()
        if limit == False:
            limit = 10
        elif int(limit)>100:
            limit=100

        if deleted == False or deleted == "0":
            #print(float(created),customerId, int(limit))
            if operation == "lt" or operation == "lte" or operation == "gt" or operation == "gte" and created:

                if operation == "lt":
                    sql_select_Query = ("SELECT * FROM cards WHERE created < %s AND customerId=cast(%s as char) ORDER BY created DESC LIMIT %s")
                elif operation == "lte":
                    sql_select_Query = ("SELECT * FROM cards WHERE created <= %s AND customerId=cast(%s as char)  ORDER BY created DESC LIMIT %s")
                elif operation == "gt":
                    sql_select_Query = ("SELECT * FROM cards WHERE created > %s AND customerId=cast(%s as char)  ORDER BY created DESC LIMIT %s")
                elif operation == "gte":
                    sql_select_Query = ("SELECT * FROM cards WHERE created <= %s AND customerId=cast(%s as char) ORDER BY created DESC LIMIT %s")

                cursor.execute(sql_select_Query, (float(created),customerId, int(limit)))
                records = cursor.fetchall()
                #print(records)

                len_records = len(records)
                limit = len(records)

                if len(records) == int(limit):

                    result = []
                    for i in range(int(limit)):
                        if records[i] != ():
                            data = {"id" : records[i][0],
                                  "created" :  str(records[i][1]),
                                  "objectType" : records[i][2],
                                  "first6" : records[i][3],
                                  "last4" : records[i][4],
                                  "fingerprint" : records[i][5],
                                  "expMonth" : records[i][6],
                                  "expYear" : records[i][7],
                                  "cardholderName" : records[i][8],
                                  "customerId" : records[i][9],
                                  "brand" : records[i][10],
                                  "type" : records[i][11],
                                  "country" :records[i][12]
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
                        "message": "data not available ",
                    }
                    raise tornado.web.Finish(response)

            if customerId and operation==False and deleted==0:
                try:
                    sql_select_Query = ("SELECT * FROM cards WHERE customerId = cast(%s as char) ORDER BY created DESC LIMIT %s ")
                    cursor.execute(sql_select_Query, (customerId, int(limit)))
                    records = cursor.fetchall()
                    #print(records)
                    result= []
                    for i in range(len(records)):
                        data = {"id" : records[i][0],
                                  "created" :  str(records[i][1]),
                                  "objectType" : records[i][2],
                                  "first6" : records[i][3],
                                  "last4" : records[i][4],
                                  "fingerprint" : records[i][5],
                                  "expMonth" : records[i][6],
                                  "expYear" : records[i][7],
                                  "cardholderName" : records[i][8],
                                  "customerId" : records[i][9],
                                  "brand" : records[i][10],
                                  "type" : records[i][11],
                                  "country" :records[i][12]
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
                sql_select_Query = ("SELECT * FROM cards WHERE created>= (SELECT created FROM cards WHERE card_id = cast(%s as char)) AND customerId = cast(%s as char) ORDER BY created ASC LIMIT 10 ")
                cursor.execute(sql_select_Query, (startingAfterId, customerId))
                records = cursor.fetchall()

                #print(records)
                results = []
                for i in range(len(records)):
                    result = {"id" : records[i][0],
                                  "created" :  str(records[i][1]),
                                  "objectType" : records[i][2],
                                  "first6" : records[i][3],
                                  "last4" : records[i][4],
                                  "fingerprint" : records[i][5],
                                  "expMonth" : records[i][6],
                                  "expYear" : records[i][7],
                                  "cardholderName" : records[i][8],
                                  "customerId" : records[i][9],
                                  "brand" : records[i][10],
                                  "type" : records[i][11],
                                  "country" :records[i][12]
                                }
                    results.append(result)
                results = results[::-1]

                response = {"status": "success","code": 200,
                            "data": results,
                            "message": ""}
                self.write(response)

            if endingBeforeId:
                sql_select_Query = (
                    "SELECT * FROM cards WHERE created<= (SELECT created FROM cards WHERE card_id =cast(%s as char)) AND customerId = cast(%s as char) ORDER BY created ASC LIMIT 10 ")
                cursor.execute(sql_select_Query, (startingAfterId, customerId))
                records = cursor.fetchall()

                #print(records)
                results = []
                for i in range(len(records)):
                    result = {"id": records[i][0],
                              "created":  str(records[i][1]),
                              "objectType": records[i][2],
                              "first6": records[i][3],
                              "last4": records[i][4],
                              "fingerprint": records[i][5],
                              "expMonth": records[i][6],
                              "expYear": records[i][7],
                              "cardholderName": records[i][8],
                              "customerId": records[i][9],
                              "brand": records[i][10],
                              "type": records[i][11],
                              "country": records[i][12]
                              }
                    results.append(result)

                response = {"status": "success","code": 200,
                            "data": results,
                            "message": ""}
                self.write(response)


        if deleted:
            #print(float(created), customerId, int(limit))
            if operation == "lt" or operation == "lte" or operation == "gt" or operation == "gte" and created:
                #print("records")

                #print("records")
                if operation == "lt":
                    sql_select_Query = (
                        "SELECT * FROM deleted_cards WHERE created < %s AND customerId=cast(%s as char) ORDER BY created DESC LIMIT %s")
                elif operation == "lte":
                    sql_select_Query = (
                        "SELECT * FROM deleted_cards WHERE created <= %s AND customerId=cast(%s as char)  ORDER BY created DESC LIMIT %s")
                elif operation == "gt":
                    sql_select_Query = (
                        "SELECT * FROM deleted_cards WHERE created > %s AND customerId=cast(%s as char)  ORDER BY created DESC LIMIT %s")
                elif operation == "gte":
                    sql_select_Query = (
                        "SELECT * FROM deleted_cards WHERE created <= %s AND customerId=cast(%s as char) ORDER BY created DESC LIMIT %s")

                cursor.execute(sql_select_Query, (float(created), customerId, int(limit)))
                records = cursor.fetchall()
                #print(records)

                if len(records) == int(limit):

                    result = []
                    for i in range(int(limit)):
                        if records[i] != ():
                            data = {"id": records[i][0],
                                    "created":  str(records[i][1]),
                                    "objectType": records[i][3],
                                    "first6": records[i][4],
                                    "last4": records[i][5],
                                    "fingerprint": records[i][6],
                                    "expMonth": records[i][7],
                                    "expYear": records[i][8],
                                    "cardholderName": records[i][9],
                                    "customerId": records[i][10],
                                    "brand": records[i][11],
                                    "type": records[i][12],
                                    "country": records[i][13]
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

            if customerId and operation == False and deleted == 0:
                try:
                    sql_select_Query = ("SELECT * FROM deleted_cards WHERE customerId = cast(%s as char) ORDER BY created DESC LIMIT %s ")
                    cursor.execute(sql_select_Query, (customerId, int(limit)))
                    records = cursor.fetchall()
                    #print(records)
                    result = []
                    for i in range(len(records)):
                        data = {"id": records[i][0],
                                "created":  str(records[i][1]),
                                "objectType": records[i][3],
                                "first6": records[i][4],
                                "last4": records[i][5],
                                "fingerprint": records[i][6],
                                "expMonth": records[i][7],
                                "expYear": records[i][8],
                                "cardholderName": records[i][9],
                                "customerId": records[i][10],
                                "brand": records[i][11],
                                "type": records[i][12],
                                "country": records[i][13]
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
                sql_select_Query = ("SELECT created FROM deleted_cards WHERE card_id = cast(%s as char)")
                cursor.execute(sql_select_Query, (startingAfterId))
                record = cursor.fetchall()
                sql_select_Query = (
                    "SELECT * FROM deleted_cards WHERE created>= %s AND card_id =cast(%s as char) ORDER BY created ASC LIMIT 10 ")
                cursor.execute(sql_select_Query, (record, startingAfterId))
                records = cursor.fetchall()
                #print(records)
                results = []
                for i in range(len(records)):
                    result = {"id": records[i][0],
                              "created":  str(records[i][1]),
                              "objectType": records[i][3],
                              "first6": records[i][4],
                              "last4": records[i][5],
                              "fingerprint": records[i][6],
                              "expMonth": records[i][7],
                              "expYear": records[i][8],
                              "cardholderName": records[i][9],
                              "customerId": records[i][10],
                              "brand": records[i][11],
                              "type": records[i][12],
                              "country": records[i][13]
                              }
                    results.append(result)

                response = {"status": "success","code": 200,
                            "data": results,
                            "message": ""}
                self.write(response)

            if endingBeforeId:

                sql_select_Query = ("SELECT created FROM deleted_cards WHERE card_id = cast(%s as char)")
                cursor.execute(sql_select_Query, (endingBeforeId))
                record = cursor.fetchall()
                sql_select_Query = (
                    "SELECT * FROM deleted_cards WHERE created<= %s AND card_id = cast(%s as char) ORDER BY created ASC LIMIT 10 ")
                cursor.execute(sql_select_Query, (record, endingBeforeId))
                records = cursor.fetchall()
                #print(records)
                results = []
                for i in range(len(records)):
                    result = {"id": records[i][0],
                              "created":  str(records[i][1]),
                              "objectType": records[i][3],
                              "first6": records[i][4],
                              "last4": records[i][5],
                              "fingerprint": records[i][6],
                              "expMonth": records[i][7],
                              "expYear": records[i][8],
                              "cardholderName": records[i][9],
                              "customerId": records[i][10],
                              "brand": records[i][11],
                              "type": records[i][12],
                              "country": records[i][13]
                              }
                    results.append(result)

                response = {"status": "success","code": 200,
                            "data": results,
                            "message": ""}
                self.write(response)
