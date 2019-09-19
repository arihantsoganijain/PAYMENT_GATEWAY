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
class charge(BaseHandler):
    def post(self):

        amount = remove_tag(self.get_argument('amount'))
        currency = remove_tag(self.get_argument('currency'))
        description = remove_tag(self.get_argument('description',False))
        customerId =remove_tag(self.get_argument('customerId', False))
        card = remove_tag(self.get_argument('cardId', False))
        number = remove_tag(self.get_argument('number', False))
        exp_month = remove_tag(self.get_argument('expMonth', False))
        exp_year = remove_tag(self.get_argument('expYear', False))
        cvc = remove_tag(self.get_argument('cvc', False))
        cardholdername = remove_tag(self.get_argument('cardholderName', False))
        captured = remove_tag(self.get_argument('captured',False))
        refunded = remove_tag(self.get_argument('refunded',False))
        disputed = regex(remove_tag(self.get_argument('disputed',False)))
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
        vat = remove_tag(self.get_argument('vat', False))
        metadata = remove_tag(self.get_argument('metadata', False))

        try:
            amount = float(amount)
        except:
            response = {
                "status": "error",
                "code": 404,
                "data": "null",
                "message": "please enter a valid amount",
            }
            raise tornado.web.Finish(response)

        customer_check = customerId
        customerId = regex(customerId)
        card_check = card
        card = regex(card)
        if customer_check == customerId and card_check == card:
            if amount and currency :

                connection, cursor = db_connect()

                if card:
                    token_record = 0
                    records = 0

                    sql_select_Query = "SELECT * FROM cards WHERE  card_id=cast(%s as char)"

                    cursor.execute(sql_select_Query, (card,))
                    records = cursor.fetchall()
                    if records:
                        card_id = records[0][0]
                    elif card:

                        sql_select_Query = ("SELECT * FROM token WHERE  id = cast(%s as char)")
                        cursor.execute(sql_select_Query, (card,))
                        token_record = cursor.fetchall()
                        connection.commit()

                        if token_record:
                            card_id = token_record[0][18]


                            sql_select_Query = "SELECT * FROM cards WHERE  card_id=cast(%s as char)"

                            cursor.execute(sql_select_Query, (card_id,))
                            records = cursor.fetchall()
                    else:
                        response = {
                            "status": "error",
                            "code": 404,
                            "data": "null",
                            "message": "card not exist",
                        }
                        raise tornado.web.Finish(response)


                charge_id = str(uuid.uuid1())


                if customerId:

                    sql_select_Query = ("SELECT * FROM customers WHERE  id = cast(%s as char)")
                    cursor.execute(sql_select_Query, (customerId,))
                    check = cursor.fetchall()
                    #print("check", check)

                if customerId==False:
                    check=0
                if captured==False or captured == "false":
                    captured=0
                elif captured=="False":
                    captured=0
                elif captured == True or captured == "true" :
                    captured = 1
                elif captured=="True":
                    captured=1
                    type_event = "CHARGE_CAPTURED"
                    id = "event_" + str(uuid.uuid1())
                    data = "char_" + str(uuid.uuid1())
                    log = "log_" + str(uuid.uuid1())
                    created =time.time()

                    url = "/api/v1/charge/create"
                    platform = self.request.headers.get('platform')
                    ipaddress = self.request.headers.get('ipaddress')

                    request_body= {"amount":amount,"currency":currency,"description":description,"customerId":customerId,"card":card,
                    "number":number,"exp_month":exp_month,"exp_year":exp_year,"cvc":cvc,"cardholdername":cardholdername,"captured":captured,"refunded":refunded,"disputed":disputed,"sh_name":sh_name,
                    "sh_address1":sh_address1,"sh_address2":sh_address2,"sh_zip":sh_zip,"sh_city":sh_city,
                    "sh_state":sh_state,"sh_country":sh_country,"bil_name":bil_name,"bil_address1":bil_address1,
                    "bil_address2":bil_address2,"bil_city":bil_city,
                    "bil_state":bil_state,"bil_country":bil_country,"vat":vat,"metadata":metadata}

                    Insert_log = (
                        "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                    cursor.execute(Insert_log, (str(log), float(created), "post", url, int(200), str(ipaddress), str(platform), str(request_body),"","admin"))


                    Insert_event = ( "INSERT INTO event(event_id ,created ,objectType ,type ,data ,log,com_id,customer_id,merchant_id ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                    cursor.execute(Insert_event, (id, created, "event", type_event, data, log,charge_id,customerId,"admin"))


                    Insert_data = ("INSERT INTO data(data_id ,created ,objectType ,amount ,currency ,description ,card ,captured ,refunded ,desputed,merchant_id ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                    cursor.execute(Insert_data, (data, created, "charge create", float(amount),currency,description, card_id,int(captured),int(refunded), int(disputed),"admin"))
                    connection.commit()


                if refunded==False:
                    refunded=0
                elif refunded == "False":
                    refunded = 0
                elif refunded=="True":
                    refunded=1
                elif refunded == True:
                    refunded = 1
                    type_event = "CHARGE_REFUNDED"
                    id = "event_" + str(uuid.uuid1())
                    data = "char_" + str(uuid.uuid1())
                    log = "log_" + str(uuid.uuid1())
                    created = time.time()

                    url = "/api/v1/charge/create"
                    platform = self.request.headers.get('platform')
                    ipaddress = self.request.headers.get('ipaddress')

                    request_body= {"amount":amount,"currency":currency,"description":description,"customerId":customerId,
                    "card":card,"number":number,"exp_month":exp_month,"exp_year":exp_year,"cvc":cvc,
                    "cardholdername":cardholdername,"captured":captured,"refunded":refunded,"disputed":disputed,
                    "sh_name":sh_name,"sh_address1":sh_address1,"sh_address2":sh_address2,"sh_zip":sh_zip,
                    "sh_city":sh_city,"sh_state":sh_state,"sh_country":sh_country,"bil_name":bil_name,
                    "bil_address1":bil_address1,"bil_address2":bil_address2,"bil_city":bil_city,"bil_state":bil_state,
                    "bil_country":bil_country,"vat":vat,"metadata":metadata}

                    Insert_log = (
                        "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                    cursor.execute(Insert_log, (str(log), float(created), "post ", url, int(200), str(ipaddress), str(platform), str(request_body), "","admin"))




                    Insert_event = (
                        "INSERT INTO event(event_id ,created ,objectType ,type ,data ,log ,com_id,customer_id, merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                    cursor.execute(Insert_event, (id, float(created), "event", type_event, data, log,charge_id,customerId,"admin"))

                    Insert_data = (
                        "INSERT INTO data(data_id ,created ,objectType ,amount ,currency ,description ,card ,captured ,refunded ,desputed,merchant_id ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                    cursor.execute(Insert_data, (data, float(created), "charge create", float(amount), currency, description,card_id, int(captured), int(refunded), int(disputed),"admin"))
                    connection.commit()



                # if disputed==False:
                #     disputed=0
                # elif disputed=="False":
                #     disputed=0
                # elif disputed=="True":
                #     disputed=1
                # elif disputed == True:
                #     disputed = 1
                #     type_event = "CHARGE_DISPUTE_CREATED"
                #     id = "event_" + str(uuid.uuid1())
                #     data = "char_" + str(uuid.uuid1())
                #     log = "log_" + str(uuid.uuid1())
                #     created = time.time()
                #     dispute_id="disp_" + str(uuid.uuid1())
                #
                #
                #     Insert_event = (
                #         "INSERT INTO event(event_id ,created ,objectType ,type ,data ,log ) VALUES (%s,%s,%s,%s,%s,%s)")
                #     cursor.execute(Insert_event, (id, created, "event", type_event, data, log))
                #
                #     Insert_data = (
                #         "INSERT INTO data(data_id ,created ,objectType ,amount ,currency ,description ,card ,captured ,refunded ,desputed ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                #     cursor.execute(Insert_data, (
                #     data, created, "charge", float(amount), currency, description, card_id, captured, refunded, disputed))
                #     connection.commit()
                #
                #
                #
                #     sql_disputes = "INSERT INTO disputes(id ,created ,objectType ,updated ,amount ,currency ,status ,reason ,acceptedAsLost  ,charge ,evidence ,hasEvidence  ,submissionCount ) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                #     cursor.execute(sql_disputes,(dispute_id,created, "dispute",created, float(amount), currency,"RETRIEVAL_REQUEST_NEW","UNRECOGNIZED",int(0),charge_id,))
                if card:
                    if records:
                        result = {
                            "id": charge_id,
                            "created": time.time(),
                            "objectType": "charge",
                            "amount": amount,
                            "currency": currency,
                            "description": description,
                            "card": {
                                "id":card_id,
                                "created": time.time(),
                                "objectType": "card",
                                "first6": records[0][3],
                                "last4": records[0][4],
                                "fingerprint": records[0][5],
                                "expMonth": records[0][6],
                                "expYear": records[0][7],
                                "cardholderName": records[0][8],
                                "customerId": customerId,
                                "brand": records[0][10],
                                "type": records[0][11],
                                "country": records[0][12],
                            },
                            "captured": captured,
                            "refunded": refunded,
                            "refunded_amt": records[0][18],
                            "disputed": disputed,
                        }
                elif number and exp_month and exp_year and cvc:
                    #print("kuch")
                    brand = cc_brand(number)
                    fingereprint = hashlib.sha224(number.encode()).hexdigest()
                    result = {
                            "id": charge_id,
                            "created": time.time(),
                            "objectType": "charge",
                            "amount": amount,
                            "currency": currency,
                            "description": description,
                            "card":{
                                "id": "card_" + str(uuid.uuid1()),
                                "created": time.time(),
                                "objectType": "card",
                                "first6": number[:6],
                                "last4": number[-4:],
                                "fingerprint": fingereprint,
                                "expMonth": exp_month,
                                "expYear": exp_year,
                                "cardholderName": cardholdername,
                                "customerId": customerId,
                                "brand": brand,
                                "type": "type",
                                "country": "country"},
                            "captured": captured,
                            "refunded": refunded,
                            "disputed": disputed,
                        }
                    #print(result)

                    Insert_card = ("INSERT INTO cards(card_id ,created,objectType ,first6,last4 ,fingerprint ,expMonth ,expYear,cardholderName ,customerId ,brand ,type ,country ,merchant_id) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")

                    cursor.execute(Insert_card, (str(result["card"]["id"]), float(result["card"]["created"]), str(result["card"]["objectType"])
                                                 , int(result["card"]["first6"]), int(result["card"]["last4"]),
                                                 str(result["card"]["fingerprint"])
                                                 , int(result["card"]["expMonth"]), int(result["card"]["expYear"]),
                                                 str(result["card"]["cardholderName"])
                                                 , str(result["card"]["customerId"])
                                                 , str(result["card"]["brand"]), str(result["card"]["type"]), str(result["card"]["country"]),"admin"))
                    connection.commit()
                else:
                    result = {
                        "id": charge_id,
                        "created": time.time(),
                        "objectType": "charge",
                        "amount": amount,
                        "currency": currency,
                        "description": description,
                        "card": {
                            "id": "null",
                            "created": "0",
                            "objectType": "null",
                            "first6": "0",
                            "last4": "0",
                            "fingerprint": "null",
                            "expMonth": "0",
                            "expYear": "0",
                            "cardholderName": "null",
                            "customerId": customerId,
                            "brand": "null",
                            "type": "null",
                            "country": "null",
                        },
                        "captured": captured,
                        "refunded": refunded,

                        "disputed": disputed,
                    }

                response = {"status": "success","code": 200,
                            "data": result,
                            "message": "create charge successfully"}
                self.write(response)

                try:



                    # #print(result["id"], result["created"], result["objectType"], result["amount"], result["currency"],
                    #       result["description"], result["card"]["id"], result["captured"], result["refunded"],
                    #       result["disputed"])

                    Insert_charge = ("INSERT INTO charge(id ,created ,objectType ,amount ,currency ,description ,card_id ,captured ,refunded ,disputed,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")


                    cursor.execute(Insert_charge,(str(result["id"]),float(result["created"]), str(result["objectType"]), float(result["amount"]),str(result["currency"]),str( result["description"]),str(result["card"]["id"]),result["captured"], result["refunded"], int(result["disputed"]),"admin"))
                    connection.commit()
                    if sh_name and sh_address1 and sh_address2 and sh_zip and sh_city and sh_state and sh_country:
                        sql_update_Query = ("INSERT INTO shipping (charge_id, sh_name, sh_address1,sh_address2, sh_zip, sh_city, sh_state,sh_country ,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                        cursor.execute(sql_update_Query, (charge_id, sh_name, sh_address1, sh_address2, sh_zip, sh_city, sh_state, sh_country,"admin"))

                    if bil_name and bil_address1 and bil_address2 and bil_zip and bil_city and bil_state and bil_country and vat:
                        sql_Query = ("INSERT INTO shipping ( bil_name , bil_address1,bil_address2 , bil_zip, bil_city , bil_state,bil_country ,vat,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s) ")

                        cursor.execute(sql_Query, (bil_name, bil_address1, bil_address2, bil_zip, bil_city, bil_state, bil_country,vat,"admin"))
                    if metadata:
                        sql_update_Query = ("UPDATE INTO SET charge  metadata = %s WHERE  id = cast(%s as char)")

                        cursor.execute(sql_update_Query, (metadata, str(result["id"]),))

                    if check:
                        Insert_charge = ("UPDATE charge set customerId=%s WHERE id=cast(%s as char)")
                        cursor.execute(Insert_charge, (customerId,str(result["id"],)))
                        connection.commit()


                    # connection = pymysql.connect(host='localhost', user='root', password='', db='card')
                    # cursor = connection.cursor()
                    #
                    # Insert_card = (
                    #     "INSERT INTO cards(card_id ,created,objectType ,first6,last4 ,fingerprint ,expMonth ,expYear,cardholderName ,customerId ,brand ,type ,country ) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                    # cursor.execute(Insert_card, (str(result["card"]["id"]), str(result["card"]["created"]), str(result["card"]["objectType"])
                    #                              ,int(result["card"]["first6"]), int(result["card"]["last4"]),
                    #                              str(result["card"]["fingerprint"])
                    #                              , int(result["card"]["expMonth"]), int(result["card"]["expYear"]),
                    #                              str(result["card"]["cardholderName"])
                    #                              , str(result["card"]["customerId"])
                    #                              , str(result["card"]["brand"]),str(result["card"]["type"]), str(result["card"]["country"])))
                    # connection.commit()
                    #
                    #
                    # Insert_card = ("INSERT INTO card(card_id ,created ,objectType ,first6 ,last4 ,fingerprint ,expMonth ,expYear,cardholderName ,customerId ,brand ,type ,country ) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                    # cursor.execute(Insert_card,(str(result["card"]["id"]), str(result["card"]["created"]),str(result["card"]["objectType"])
                    #                    ,str(result["card"]["first6"]),str( result["card"]["last4"]), str(result["card"]["fingerprint"])
                    #                    ,str(result["card"]["expMonth"]),str(result["card"]["expYear"]),str(result["card"]["cardholderName"])
                    #                    , str(result["card"]["customerId"])
                    #                    ,str(result["card"]["brand"]),str(result["card"]["type"]) ,str(result["card"]["country"])))
                    # connection.commit()
                    #
                    #
                    #print("Done")
                    type_event="CHARGE_SUCCEEDED"
                    id = "event_" + str(uuid.uuid1())
                    data = "char_" + str(uuid.uuid1())
                    log = "log_" + str(uuid.uuid1())
                    created = time.time()

                    url = "/api/v1/charge/create"
                    platform = self.request.headers.get('platform')
                    ipaddress = self.request.headers.get('ipaddress')

                    request_body= {"amount":amount,"currency":currency,"description":description,"customerId":customerId,
                    "card":card,"number":number,"exp_month":exp_month,"exp_year":exp_year,"cvc":cvc,
                    "cardholdername":cardholdername,"captured":captured,"refunded":refunded,"disputed":disputed,
                    "sh_name":sh_name,"sh_address1":sh_address1,"sh_address2":sh_address2,"sh_zip":sh_zip,
                    "sh_city":sh_city,"sh_state":sh_state,"sh_country":sh_country,"bil_name":bil_name,
                    "bil_address1":bil_address1,"bil_address2":bil_address2,"bil_city":bil_city,"bil_state":bil_state,
                    "bil_country":bil_country,"vat":vat,"metadata":metadata}

                    Insert_log = (
                        "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                    cursor.execute(Insert_log, (str(log), float(created), "post ", url, int(200), str(ipaddress), str(platform), str(request_body), str(response["data"]),"admin"))



                    Insert_event = (
                        "INSERT INTO event(event_id ,created ,objectType ,type ,data ,log,com_id,customer_id,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                    cursor.execute(Insert_event, (id, created, "event", type_event, data, log,result["id"],customerId,"admin"))

                    Insert_data = (
                        "INSERT INTO data(data_id ,created ,objectType ,amount ,currency ,description ,card ,captured ,refunded ,desputed ,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                    cursor.execute(Insert_data, (
                    data, created, "charge create", float(amount), currency, description, str(result["card"]["id"]), captured, refunded, disputed,"admin"))
                    connection.commit()



                except :
                    #print("charge failed")
                    type_event = "CHARGE_FAILED"
                    id = "event_" + str(uuid.uuid1())
                    data = "char_" + str(uuid.uuid1())
                    log = "log_" + str(uuid.uuid1())
                    created = time.time()

                    url = "/api/v1/charge/create"
                    platform = self.request.headers.get('platform')
                    ipaddress = self.request.headers.get('ipaddress')

                    request_body= {"amount":amount,"currency":currency,"description":description,"customerId":customerId,
                    "card":card,"number":number,"exp_month":exp_month,"exp_year":exp_year,"cvc":cvc,
                    "cardholdername":cardholdername,"captured":captured,"refunded":refunded,"disputed":disputed,
                    "sh_name":sh_name,"sh_address1":sh_address1,"sh_address2":sh_address2,"sh_zip":sh_zip,
                    "sh_city":sh_city,"sh_state":sh_state,"sh_country":sh_country,"bil_name":bil_name,
                    "bil_address1":bil_address1,"bil_address2":bil_address2,"bil_city":bil_city,"bil_state":bil_state,
                    "bil_country":bil_country,"vat":vat,"metadata":metadata}

                    Insert_log = (
                        "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                    cursor.execute(Insert_log, (str(log), float(created), "post ", url, int(200), str(ipaddress), str(platform), str(request_body), str(response["data"]),"admin"))



                    Insert_event = (
                        "INSERT INTO event(event_id ,created ,objectType ,type ,data ,log,com_id,customer_id,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                    cursor.execute(Insert_event, (id, created, "event", type_event, data, log,result["id"],customerId,"admin"))

                    Insert_data = (

                        "INSERT INTO data(data_id ,created ,objectType ,amount ,currency ,description , captured ,refunded ,desputed,merchant_id ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                    cursor.execute(Insert_data, (
                    data, created, "charge create", float(amount), currency, description, captured, refunded, disputed,"admin"))
                    connection.commit()
            else:
                response = {
                    "status": "error",
                    "code": 400,
                    "data": "null",
                    "message": "Bad Request",
                }
                raise tornado.web.Finish(response)
        else:
            response = {
                "status": "error",
                "code": 404,
                "data": "null",
                "message": "Wrong Values Given",
            }
            raise tornado.web.Finish(response)





    def get(self):
        id = regex(remove_tag(self.get_argument('chargeId')))
        #print(id)
        if id:
            connection, cursor = db_connect()
            # sql_select_Query = ("SELECT * FROM charge WHERE id=%s")
            sql_select_Query=("SELECT * FROM charge INNER JOIN cards ON charge.card_id = cards.card_id WHERE charge.id =cast(%s as char)")
            cursor.execute(sql_select_Query,(id))
            records = cursor.fetchall()
            #print("----....",records)



            if records:

                sql_select_Query = ("SELECT * FROM blacklist WHERE ruleType='fingerprint' and fingerprint=cast(%s as char)")
                cursor.execute(sql_select_Query, (records[0][25],))
                blkfig_record=cursor.fetchall()
                #print(blkfig_record,records[0][25],"========================")
                fingerprint_blocked=0
                if blkfig_record:
                    fingerprint_blocked=blkfig_record[0][0]
                    

                result={
                      "id" : records[0][0],
                      "created" : str(records[0][1]),
                      "objectType" : "charge",
                      "amount" : records[0][3],
                      "currency" : records[0][4],
                      "description" : str(records[0][5]),
                      "card" : {
                        "id" : records[0][20],
                        "created" : str(records[0][21]),
                        "objectType" : records[0][22],
                        "first6" : records[0][23],
                        "last4" : records[0][24],
                        "fingerprint" : records[0][25],
                        "fingerprint_blocked":fingerprint_blocked,
                        "expMonth" : records[0][26],
                        "expYear" : records[0][27],
                        "cardholderName" :records[0][28],
                        "customerId" : records[0][29],
                        "brand" : records[0][30],
                        "type" : records[0][31],
                        "country" : records[0][32]
                      },
                      "captured" : records[0][8],
                      "refunded" : records[0][9],
                      "refunded_amt": records[0][18],
                      "disputed" : records[0][10]
                    }

                # #print(result)
                response = {"status": "success","code": 200,
                            "data": result,
                            "message": ""}


                self.write(response)
            elif records == ():
                sql_select_Query = (
                    "SELECT * FROM charge WHERE id =cast(%s as char)")
                cursor.execute(sql_select_Query, (id))
                records = cursor.fetchall()


                #print("----....", records)

                if records:
                    sql_select_Query = ("SELECT * FROM cards WHERE card_id =cast(%s as char)")
                    cursor.execute(sql_select_Query, (records[0][7]))
                    record_card = cursor.fetchall()
                    if record_card:
                        sql_select_Query = ("SELECT * FROM blacklist WHERE ruleType='fingerprint' and fingerprint=cast(%s as char)")
                        cursor.execute(sql_select_Query, (records[0][5],))
                        blkfig_record=cursor.fetchall()
                        #print(blkfig_record,"========================")
                        fingerprint_blocked=0
                        if blkfig_record:
                            fingerprint_blocked=blkfig_record[0][0]
                        result = {
                            "id": records[0][0],
                            "created": str(records[0][1]),
                            "objectType": "charge",
                            "amount": records[0][3],
                            "currency": records[0][4],
                            "description": str(records[0][5]),
                            "card" : {
                            "id" : records[0][7],
                            "created" : str(record_card[0][1]),
                            "objectType" : record_card[0][2],
                            "first6" : record_card[0][3],
                            "last4" : record_card[0][4],
                            "fingerprint" : record_card[0][5],
                            "fingerprint_blocked":fingerprint_blocked,
                            "expMonth" : record_card[0][6],
                            "expYear" : record_card[0][7],
                            "cardholderName" :record_card[0][8],
                            "customerId" : record_card[0][9],
                            "brand" : record_card[0][10],
                            "type" : record_card[0][11],
                            "country" : record_card[0][12]
                        },
                            "captured": records[0][8],
                            "refunded": records[0][9],
                            "refunded_amt": records[0][18],
                            "disputed": records[0][10]
                        }

                        # #print(result)
                        response = {"status": "success","code": 200,
                                    "data": result,
                                    "message": ""}
                        self.write(response)
                    else:
                        result = {
                            "id": records[0][0],
                            "created": str(records[0][1]),
                            "objectType": "charge",
                            "amount": records[0][3],
                            "currency": records[0][4],
                            "description": str(records[0][5]),
                            "card" : records[0][7],
                            "captured": records[0][8],
                            "refunded": records[0][9],
                            "refunded_amt": records[0][18],
                            "disputed": records[0][10]
                        }

                        # #print(result)
                        response = {"status": "success","code": 200,
                                    "data": result,
                                    "message": ""}
                        self.write(response)
                else:
                    response = {
                        "status": "error",
                        "code": 404,
                        "data": "null",
                        "message": "id doesn't exists",
                    }
                    raise tornado.web.Finish(response)

            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "null",
                    "message": "id doesn't exists",
                }
                raise tornado.web.Finish(response)
        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "null",
                "message": "Bad REquest",
            }
            raise tornado.web.Finish(response)


@jwtauth
class charge_update(BaseHandler):
    def post(self):
        chargeId = regex(remove_tag(self.get_argument('chargeId')))
        customerId = regex(remove_tag(self.get_argument('customerId', False)))
        description = remove_tag(self.get_argument('description', False))
        dispute = regex(remove_tag(self.get_argument('dispute', False)))
        fraud_status = remove_tag(self.get_argument('fraud_status', False))
        fraud_score = remove_tag(self.get_argument('fraud_score', False))
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
        vat=  remove_tag(self.get_argument('vat', False))
        metadata = remove_tag(self.get_argument('metadata', False))

        if chargeId:
            connection, cursor = db_connect()

            if fraud_status in ['safe','suspicious','fraudent']:
                if fraud_status=='safe':
                    fraud_score='0%'
                elif fraud_status=='suspicious':
                    fraud_score='50%'
                elif fraud_status=='fraudent':
                    fraud_score='100%'

                sql_update_Query = ("UPDATE charge SET fraud_status = cast(%s as char), fraud_score = cast(%s as char) WHERE  id = cast(%s as char)")
                cursor.execute(sql_update_Query, (fraud_status,fraud_score, chargeId,))
                connection.commit()

            if customerId:

                sql_update_Query = ("SELECT * FROM customers WHERE  id = cast(%s as char)")
                cursor.execute(sql_update_Query, (customerId,))
                check = cursor.fetchall()
                connection.commit()


                if check:
                    sql_update_Query = ("UPDATE charge SET customerId = cast(%s as char) WHERE  id = cast(%s as char)")
                    cursor.execute(sql_update_Query, (customerId, chargeId,))
                    connection.commit()

                else:
                    response = {
                                "status": "error",
                                "code": 404,
                                "data": "null",
                                "message": "Customer not exists",
                                }
                    raise tornado.web.Finish(response)


            if description:
                sql_update_Query = ("UPDATE charge SET description = %s WHERE  id = cast(%s as char)")
                cursor.execute(sql_update_Query, (description,chargeId,))
            if dispute:
                sql_select_Query = ("SELECT * FROM charge WHERE id=cast(%s as char)")

                cursor.execute(sql_select_Query, (chargeId,))
                charge_data = cursor.fetchall()

                sql_update_Query = ("UPDATE charge SET disputed = %s WHERE  id = cast(%s as char)")
                cursor.execute(sql_update_Query, (int(dispute),str(chargeId),))
                connection.commit()

                type_event = "CHARGE_DESPUTE_UPDATED"
                id = "event_" + str(uuid.uuid1())
                data = "char_" + str(uuid.uuid1())
                log = "log_" + str(uuid.uuid1())
                created = time.time()

                url = "/api/v1/charge/update"
                platform = self.request.headers.get('platform')
                ipaddress = self.request.headers.get('ipaddress')

                request_body= {"chargeId":chargeId,"customerId":customerId,"description":description,"dispute":dispute,
                "fraud_status":fraud_status,"fraud_score":fraud_score,
                "sh_name":sh_name,"sh_address1":sh_address1,"sh_address2":sh_address2,"sh_zip":sh_zip,
                "sh_city":sh_city,"sh_state":sh_state,"sh_country":sh_country,"bil_name":bil_name,
                "bil_address1":bil_address1,"bil_address2":bil_address2,"bil_city":bil_city,"bil_state":bil_state,
                "bil_country":bil_country,"vat":vat,"metadata":metadata}

                Insert_log = (
                    "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_log, (str(log), float(created), "post", url, int(200), str(ipaddress), str(platform), str(request_body), "","admin"))


                Insert_event = ("INSERT INTO event(event_id ,created ,objectType ,type ,data ,log,com_id,customer_id,merchant_id ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                #print("desputr error")
                cursor.execute(Insert_event, (str(id), float(created), "event", str(type_event), str(data), str(log),chargeId,customerId,"admin"))
                #print("desputr error")
                connection.commit()
                Insert_data = (
                    "INSERT INTO data(data_id ,created ,objectType ,amount ,currency ,description ,card ,captured ,refunded ,desputed,merchant_id ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_data, (data, created, "charge_update",charge_data[0][3],charge_data[0][4],charge_data[0][5],charge_data[0][7],charge_data[0][8],charge_data[0][9],charge_data[0][10],"admin"))
                connection.commit()



            if sh_name and sh_address1 and sh_address2 and sh_zip and sh_city and sh_state and sh_country:
                sql_update_Query = ("UPDATE shipping SET sh_name = %s, sh_address1=%s,sh_address2 = %s, sh_zip=%s, sh_city = %s, sh_state=%s,sh_country = %s  WHERE  charge_id = cast(%s as char)")
                cursor.execute(sql_update_Query, (sh_name, sh_address1, sh_address2, sh_zip, sh_city, sh_state, sh_country, chargeId,))
                connection.commit()
            if bil_name and bil_address1 and bil_address2 and bil_zip and bil_city and bil_state and bil_country and vat:
                sql_update_Query = ("UPDATE shipping SET bil_name = %s, bil_address1=%s,bil_address2 = %s, bil_zip=%s, bil_city = %s, bil_state=%s,bil_country = %s  WHERE  charge_id =cast(%s as char)")
                #print(sql_update_Query)
                cursor.execute(sql_update_Query, (bil_name, bil_address1, bil_address2, bil_zip, bil_city,bil_state,bil_country,  chargeId,))
                connection.commit()
            if metadata:
                sql_update_Query = ("UPDATE charge SET metadata = %s WHERE  id = cast(%s as char)")
                #print(sql_update_Query)
                cursor.execute(sql_update_Query, (metadata,chargeId,))
                connection.commit()

            connection.commit()




            sql_select_Query = ("SELECT * FROM charge WHERE id=cast(%s as char)")

            cursor.execute(sql_select_Query, (chargeId,))
            records = cursor.fetchall()
            sql_select_Query = ("SELECT * FROM cards WHERE card_id=cast(%s as char)")

            cursor.execute(sql_select_Query, (records[0][7],))
            card_records = cursor.fetchall()
            #print(card_records)

            #print(records)
            if records and card_records:
                result = {
                    "id": records[0][0],
                    "created":  str(records[0][1]),
                    "objectType": records[0][2],
                    "amount": str(records[0][3]),
                    "currency": records[0][4],
                    "description": records[0][5],
                    "card": {
                        "id": card_records[0][0],
                        "created": str(card_records[0][1]),
                        "objectType": card_records[0][2],
                        "first6": card_records[0][3],
                        "last4": card_records[0][4],
                        "fingerprint": card_records[0][5],
                        "expMonth": card_records[0][6],
                        "expYear": card_records[0][7],
                        "cardholderName": card_records[0][8],
                        "customerId": card_records[0][9],
                        "brand": card_records[0][10],
                        "type": card_records[0][11],
                        "country": card_records[0][12]
                    },
                    "captured": records[0][8],
                    "refunded": records[0][9],
                    "disputed": records[0][10],
                    "refunded_amt": records[0][18],
                    "fraud_status": records[0][12],
                    "fraud_score": records[0][13]
                }

                #print(result)
                response = {"status": "success","code": 200,
                            "data": result,
                            "message": "charge update successfully"}
                self.write(response)
            elif records :
                result = {
                    "id": records[0][0],
                    "created":  str(records[0][1]),
                    "objectType": records[0][2],
                    "amount": str(records[0][3]),
                    "currency": records[0][4],
                    "description": records[0][5],
                    "card": records[0][7],
                    "captured": records[0][8],
                    "refunded": records[0][9],
                    "disputed": records[0][10],
                    "refunded_amt": records[0][18],
                    "fraud_status": records[0][12],
                    "fraud_score": records[0][13]
                }

                #print(result)
                response = {"status": "success","code": 200,
                            "data": result,
                            "message": ""}
                self.write(response)
            else:
                response = {
                    "status": "error",
                    "code": 400,
                    "data": "null",
                    "message": "Bad request",
                }
                raise tornado.web.Finish(response)

            type_event = "CHARGE_UPDATED"
            id = "event_" + str(uuid.uuid1())
            data = "char_" + str(uuid.uuid1())
            log = "log_" + str(uuid.uuid1())
            created = time.time()
            url = "/api/v1/charge/update"
            platform = self.request.headers.get('platform')
            ipaddress = self.request.headers.get('ipaddress')

            request_body= {"chargeId":chargeId,"customerId":customerId,"description":description,"dispute":dispute,
            "fraud_status":fraud_status,"fraud_score":fraud_score,
            "sh_name":sh_name,"sh_address1":sh_address1,"sh_address2":sh_address2,"sh_zip":sh_zip,
            "sh_city":sh_city,"sh_state":sh_state,"sh_country":sh_country,"bil_name":bil_name,
            "bil_address1":bil_address1,"bil_address2":bil_address2,"bil_city":bil_city,"bil_state":bil_state,
            "bil_country":bil_country,"vat":vat,"metadata":metadata}

            Insert_log = (
                "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
            cursor.execute(Insert_log, (str(log), float(created), "post", url, int(200), str(ipaddress), str(platform), str(request_body), str(response["data"]),"admin"))

            if card_records:
                Insert_event = ("INSERT INTO event(event_id ,created ,objectType ,type ,data ,log,com_id,customer_id,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_event, (id, created, "event", type_event, data, log ,result["id"],customerId,"admin"))

                Insert_data = (
                    "INSERT INTO data(data_id ,created ,objectType ,amount ,currency ,description ,card ,captured ,refunded ,desputed ,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_data, (data, created, "Charge_Updated", float(records[0][3]), records[0][4], description, card_records[0][0], records[0][8], records[0][9], records[0][10],"admin"))
                connection.commit()
            else:
                Insert_event = ("INSERT INTO event(event_id ,created ,objectType ,type ,data ,log,com_id,customer_id,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_event, (id, created, "event", type_event, data, log,result["id"],customerId,"admin"))

                Insert_data = (
                    "INSERT INTO data(data_id ,created ,objectType ,amount ,currency ,description ,card ,captured ,refunded ,desputed ,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_data, (data, created, "Charge_Updated", float(records[0][3]), records[0][4], description, "",records[0][7], records[0][8], records[0][9],"admin"))
                connection.commit()
        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "null",
                "message": "Bad request",
            }
            raise tornado.web.Finish(response)


@jwtauth
class charge_refund(BaseHandler):
    def post(self):
        chargeId = regex(remove_tag(self.get_argument('chargeId', True)))
        amount = remove_tag(self.get_argument('amount', False))
        if chargeId:
            connection, cursor = db_connect()
            sql_select_Query = ("SELECT * FROM charge WHERE id=cast(%s as char)")

            cursor.execute(sql_select_Query, (chargeId,))
            records = cursor.fetchall()

            if records:
                if records[0][18]=="NULL" or records[0][18]==None:
                    refunded_amt=0
                else:
                    refunded_amt=float(records[0][18])
                if float(records[0][3])>=(float(amount)+float(refunded_amt)):

                    sql_update_Query = ("UPDATE charge SET refunded = %s , refunded_amt=%s WHERE  id = cast(%s as char)")
                    cursor.execute(sql_update_Query, (bool(1),float(float(amount)+float(refunded_amt)), str(chargeId),))
                    connection.commit()

                    sql_select_Query = ("SELECT * FROM charge WHERE id=cast(%s as char)")

                    cursor.execute(sql_select_Query, (chargeId,))
                    records = cursor.fetchall()

                    sql_select_Query = ("SELECT * FROM cards WHERE card_id=cast(%s as char)")

                    cursor.execute(sql_select_Query, (records[0][7],))
                    card_records = cursor.fetchall()
                    #print(card_records)
                    if card_records:
                        result = {
                            "id": records[0][0],
                            "created":  str(records[0][1]),
                            "objectType": records[0][2],
                            "amount": records[0][3],
                            "currency": records[0][4],
                            "description": records[0][5],
                            "card": {
                                "id": card_records[0][0],
                                "created": str(card_records[0][1]),
                                "objectType": card_records[0][2],
                                "first6": card_records[0][3],
                                "last4": card_records[0][4],
                                "fingerprint": card_records[0][5],
                                "expMonth": card_records[0][6],
                                "expYear": card_records[0][7],
                                "cardholderName": card_records[0][8],
                                "customerId": card_records[0][9],
                                "brand": card_records[0][10],
                                "type": card_records[0][11],
                                "country": card_records[0][12]
                            },
                            "captured": records[0][8],
                            "refunded": records[0][9],
                            "refunded_amt": records[0][18],
                            "disputed": records[0][10]
                        }
                        response = {"status": "success", "code": 200,
                                    "data": result,
                                    "message": "charge refund successfully"}
                        self.write(response)

                        type_event = "CHARGE_REFUNDED"
                        id = "event_" + str(uuid.uuid1())
                        data = "char_" + str(uuid.uuid1())
                        log = "log_" + str(uuid.uuid1())
                        created = time.time()

                        url = "/api/v1/charge/refund"
                        platform = self.request.headers.get('platform')
                        ipaddress = self.request.headers.get('ipaddress')

                        request_body = {"chargeId": chargeId, "amount": amount}

                        Insert_log = (
                            "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                        cursor.execute(Insert_log, (
                        str(log), float(created), "post", url, int(200), str(ipaddress), str(platform),
                        str(request_body), str(response["data"]), "admin"))

                        Insert_event = (
                            "INSERT INTO event(event_id ,created ,objectType ,type ,data ,log,com_id,customer_id,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                        cursor.execute(Insert_event, (
                        id, created, "event", type_event, data, log, result["id"], result["card"]["customerId"], "admin"))

                        Insert_data = (
                            "INSERT INTO data(data_id ,created ,objectType ,amount ,currency ,description ,card ,captured ,refunded ,desputed ,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                        cursor.execute(Insert_data, (
                        data, created, "Charge_Refund", float(records[0][18]), records[0][4], records[0][5],
                        card_records[0][0], records[0][8], records[0][9], records[0][10], "admin"))
                        connection.commit()


                    else:
                        response = {"status": "error","code": 400,
                                    "data": "",
                                    "message": "card not found"}
                        self.write(response)


                else:
                    response = {
                        "status": "error",
                        "code": 400,
                        "data": "null",
                        "message": "Refund amount is greater then Charge amount",
                    }
                    raise tornado.web.Finish(response)

            else:
                self.write("charge_id doesnt exist")
        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "null",
                "message": "Bad request",
            }
            raise tornado.web.Finish(response)

@jwtauth
class charge_capture(BaseHandler):
    def post(self):
        chargeId = regex(remove_tag(self.get_argument('chargeId', True)))

        if chargeId:

            connection, cursor = db_connect()
            sql_select_Query = ("SELECT * FROM charge WHERE id=cast(%s as char)")

            cursor.execute(sql_select_Query, (chargeId,))
            records = cursor.fetchall()

            if records:
                if records[0][7]=='null' or records[0][7]=='0':
                    response = {
                        "status": "error",
                        "code": 400,
                        "data": "null",
                        "message": "card not exist",
                    }
                    raise tornado.web.Finish(response)

                sql_update_Query = ("UPDATE charge SET captured = %s WHERE  id = cast(%s as char)")
                cursor.execute(sql_update_Query, (int(1), str(chargeId),))
                connection.commit()
                sql_select_Query = ("SELECT * FROM charge WHERE id=cast(%s as char)")

                cursor.execute(sql_select_Query, (chargeId,))
                records = cursor.fetchall()


                sql_select_Query = ("SELECT * FROM cards WHERE card_id=cast(%s as char)")

                cursor.execute(sql_select_Query, (records[0][7],))
                card_records = cursor.fetchall()
                #print(card_records)
                if card_records:
                    result = {
                        "id": records[0][0],
                        "created":  str(records[0][1]),
                        "objectType": records[0][2],
                        "amount": records[0][3],
                        "currency": records[0][4],
                        "description": records[0][5],
                        "card": {
                            "id": card_records[0][0],
                            "created": str(card_records[0][1]),
                            "objectType": card_records[0][2],
                            "first6": card_records[0][3],
                            "last4": card_records[0][4],
                            "fingerprint": card_records[0][5],
                            "expMonth": card_records[0][6],
                            "expYear": card_records[0][7],
                            "cardholderName": card_records[0][8],
                            "customerId": card_records[0][9],
                            "brand": card_records[0][10],
                            "type": card_records[0][11],
                            "country": card_records[0][12]
                        },
                        "captured": records[0][8],
                        "refunded": records[0][9],
                        "disputed": records[0][10]
                    }
                else:
                    response = {
                        "status": "error",
                        "code": 400,
                        "data": "null",
                        "message": "card not exist",
                    }
                    raise tornado.web.Finish(response)

                response = {"status": "success","code": 200,
                            "data": result,
                            "message": "charge capture successfully"}
                self.write(response)
                type_event = "CHARGE_CAPTURED"
                id = "event_" + str(uuid.uuid1())
                data = "char_" + str(uuid.uuid1())
                log = "log_" + str(uuid.uuid1())
                created = time.time()

                url = "/api/v1/charge/capture"
                platform = self.request.headers.get('platform')
                ipaddress = self.request.headers.get('ipaddress')

                request_body= {"chargeId":chargeId}

                Insert_log = (
                    "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_log, (str(log), float(created), "post", url, int(200), str(ipaddress), str(platform), str(request_body), str(response["data"]),"admin"))




                Insert_event = ("INSERT INTO event(event_id ,created ,objectType ,type ,data ,log, com_id, customer_id, merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_event, (id, created, "event", type_event, data, log,result["id"], result["card"]["customerId"], "admin"))

                Insert_data = (
                    "INSERT INTO data(data_id ,created ,objectType ,amount ,currency ,description ,card ,captured ,refunded ,desputed ,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_data, (
                data, created, "Charge_Captured", float(records[0][3]), records[0][4], records[0][5], card_records[0][0], records[0][8], records[0][9], records[0][10],"admin"))
                connection.commit()


            else:
                response = {
                    "status": "error",
                    "code": 400,
                    "data": "null",
                    "message": "charge_id doesnt exist",
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
class list_charge(BaseHandler):
    def get(self):
        created = remove_tag(self.get_argument('created', False))
        opration = remove_tag(self.get_argument('operation', False))
        customerId =regex(remove_tag( self.get_argument('customerId', False)))
        limit = remove_tag(self.get_argument('limit', False))
        startingAfterId = regex(remove_tag(self.get_argument('startingAfterId', False)))
        endingBeforeId = regex(remove_tag(self.get_argument('endingBeforeId', False)))

        connection, cursor = db_connect()

        sql_length_query = ("SELECT COUNT(*) FROM charge")
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
                    sql_select_Query = ("SELECT * FROM charge WHERE created < %s ORDER BY created DESC LIMIT %s")
                elif opration == "lte":
                    sql_select_Query = ("SELECT * FROM charge WHERE created <= %s ORDER BY created DESC LIMIT %s")
                elif opration == "gt":
                    sql_select_Query = ("SELECT * FROM charge WHERE created > %s ORDER BY created DESC LIMIT %s")
                elif opration == "gte":
                    sql_select_Query = ("SELECT * FROM charge WHERE created <= %s ORDER BY created DESC LIMIT %s")

                cursor.execute(sql_select_Query, (float(created),int(limit)))
                records = cursor.fetchall()
                #print(records)

                connection.commit()
                # len_records = len(records)
                limit = len(records)

                if len(records)==limit and len(records)>0:
                    card_ID=[]
                    for i in range(limit):
                        var=records[i][7]
                        #print(var)
                        if var.startswith("tok_"):

                            sql_select_Query = ("SELECT card_id FROM token WHERE id=cast(%s as char)")

                            cursor.execute(sql_select_Query,records[i][7])
                            card_records = cursor.fetchall()
                            card_ID.append(card_records)
                        elif var.startswith("card_"):
                            card_ID.append(records[i][7])
                        else:
                            card_ID.append("null")

                    #print("cardid",card_ID)
                    card_data=[]
                    for i in range(len(card_ID)):

                        sql_select_Query = ("SELECT * FROM cards WHERE card_id= cast(%s as char) ")

                        cursor.execute(sql_select_Query, (card_ID[i]))
                        data = cursor.fetchall()
                        card_data.append(data)
                    #print("card_data", card_data)
                    result=[]
                    for i in range(limit):
                        if card_data[i] != ():
                            data={
                                  "id" : records[i][0],
                                  "created" :  str(records[i][1]),
                                  "objectType" : records[i][2],
                                  "amount" : str(records[i][3]),
                                  "currency" :records[i][4],
                                  "description" : records[i][5],
                                  "card" : {
                                    "id" : card_data[i][0][0],
                                    "created" :  str(card_data[i][0][1]),
                                    "objectType" :  card_data[i][0][2],
                                    "first6" :  card_data[i][0][3],
                                    "last4" :  card_data[i][0][4],
                                    "fingerprint" :  card_data[i][0][5],
                                    "expMonth" : card_data[i][0][6],
                                    "expYear" : card_data[i][0][7],
                                    "cardholderName" :  card_data[i][0][8],
                                    "customerId" :  card_data[i][0][9],
                                    "brand" :  card_data[i][0][10],
                                    "type" :  card_data[i][0][11],
                                    "country" : card_data[i][0][12]
                                  },
                                  "captured" :  records[i][8],
                                  "refunded" :  records[i][9],
                                  "disputed" :  records[i][10]
                                }
                            result.append(data)
                        else:
                            data = {
                                "id": records[i][0],
                                "created":  str(records[i][1]),
                                "objectType": records[i][2],
                                "amount": str(records[i][3]),
                                "currency": records[i][4],
                                "description": records[i][5],
                                "card": "",
                                "captured": records[i][8],
                                "refunded": records[i][9],
                                "disputed": records[i][10]
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
                        "message": "No previous data available",
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

        if customerId:
            try:

                sql_select_Query = ("SELECT * FROM charge WHERE customerId = cast(%s as char) ORDER BY created DESC LIMIT %s ")
                cursor.execute(sql_select_Query, (customerId,int(limit)))
                records = cursor.fetchall()
                #print(records)
                results=[]
                if records:
                    for i in range(len(records)):
                        result = {
                            "id": records[i][0],
                            "created": str(records[i][1]),
                            "objectType": records[i][2],
                            "amount": records[i][3],
                            "currency": records[i][4],
                            "description": records[i][5],
                            "card": records[i][7],
                            "captured": records[i][8],
                            "refunded": records[i][9],
                            "disputed": records[i][10]
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
            except:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "null",
                    "message": "Customer not exist",
                }
                raise tornado.web.Finish(response)

        if startingAfterId:

            sql_select_Query = ("SELECT created FROM charge WHERE id =cast(%s as char)")
            cursor.execute(sql_select_Query, (startingAfterId))
            record = cursor.fetchall()
            sql_select_Query = ("SELECT * FROM charge WHERE created> %s ORDER BY created ASC LIMIT 10 ")
            cursor.execute(sql_select_Query, (record))
            records = cursor.fetchall()
            #print(records)
            results = []
            if records:
                for i in range(len(records)):
                    result = {
                        "id": records[i][0],
                        "created": str(records[i][1]),
                        "objectType": records[i][2],
                        "amount": records[i][3],
                        "currency": records[i][4],
                        "description": records[i][5],
                        "card": records[i][7],
                        "captured": records[i][8],
                        "refunded": records[i][9],
                        "disputed": records[i][10]
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

            sql_select_Query = ("SELECT created FROM charge WHERE id = cast(%s as char)")
            cursor.execute(sql_select_Query, (endingBeforeId))
            record = cursor.fetchall()
            sql_select_Query = ("SELECT * FROM charge WHERE created<%s ORDER BY created DESC LIMIT 10 ")
            cursor.execute(sql_select_Query, (record))
            records = cursor.fetchall()
            #print(records)
            results = []
            if records:
                for i in range(len(records)):
                    result = {
                        "id": records[i][0],
                        "created":  str(records[i][1]),
                        "objectType": records[i][2],
                        "amount": records[i][3],
                        "currency": records[i][4],
                        "description": records[i][5],
                        "card": records[i][7],
                        "captured": records[i][8],
                        "refunded": records[i][9],
                        "disputed": records[i][10]
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



@jwtauth
class filter_charges(BaseHandler):
    def post(self):

        start_date = remove_tag(self.get_argument('start_date', False))
        last_date = remove_tag(self.get_argument('last_date', False))
        currency = remove_tag( self.get_argument('currency', False))
        last4digits = remove_tag(self.get_argument('last4', False))
        fingerprint = remove_tag(self.get_argument('fingerprint', False))
        description = remove_tag(self.get_argument('description', False))

        captured = remove_tag(self.get_argument('captured', False))
        refunded = remove_tag(self.get_argument('refunded', False))
        disputed =remove_tag( self.get_argument('disputed', False))
        fraud_check = remove_tag(self.get_argument('fraud', False))
        dispute_status = remove_tag(self.get_argument('dispute_status', False))
        acceptedAsLost = remove_tag(self.get_argument('accepted_as_lost', False))

        declined = remove_tag(self.get_argument('declined', False))
        decline_reason = remove_tag(self.get_argument('decline_reason', False))
        chargeId =regex(remove_tag( self.get_argument('chargeId', False)))
        customerId = remove_tag(self.get_argument('customerId', False))
        token = self.request.headers.get('Authorization')
        limit=self.get_argument('limit', False)
        time=self.get_argument('time', False)
        pre_time=self.get_argument('pre_time', False)
        # m_id = remove_tag(self.get_argument('m_id'))


        if limit ==False:
            limit=10
        else:
            limit=int(limit)
        
        if limit>100:
            limit=100
        
        if not last4digits or not fingerprint or not dispute_status or not acceptedAsLost:
            connection, cursor = db_connect()

            query = f"SELECT * FROM charge WHERE created<{time}"
            count_query = f"SELECT count(*) FROM charge WHERE created<{time}"
            if pre_time:
                query = f"SELECT * FROM charge WHERE created>{pre_time}"
            if start_date and last_date:
                if query[-5:] == "WHERE":
                    add = f" created BETWEEN {start_date} AND {last_date}"
                else:
                    add = f" AND created BETWEEN {start_date} AND {last_date}"

                query = query + add
                count_query=count_query+add
            
            if currency:
                if query[-5:] == "WHERE":
                    add = f" currency = '{currency}'"
                else:
                    add = f" AND currency = '{currency}'"

                query = query + add
                count_query=count_query+add
            
            

            if description:
                if query[-5:] == "WHERE":
                    add = f" description = '{description}'"
                else:
                    add = f" AND description = '{description}'"
            
                query = query + add
                count_query=count_query+add
            
            

            
            if captured == 'is captured' :
                if query[-5:] == "WHERE":
                    add = f" captured = 1"
                else:
                    add = f" AND captured = 1"
            
                query = query + add
                count_query=count_query+add
            
            if captured == 'is not captured' :
                if query[-5:] == "WHERE":
                    add = f" captured = 0"
                else:
                    add = f" AND captured = 0 "
            
                query = query + add
                count_query=count_query+add

            if refunded == 'is refunded' :
                if query[-5:] == "WHERE":
                    add = f" refunded = 1"
                else:
                    add = f" AND refunded = 1"
            
                query = query + add
                count_query=count_query+add
            
            if refunded == 'is not refunded' :
                if query[-5:] == "WHERE":
                    add = f" refunded = 0"
                else:
                    add = f" AND refunded = 0 "
            
                query = query + add
                count_query=count_query+add

            
            if disputed == 'is disputed' :
                if query[-5:] == "WHERE":
                    add = f" disputed = 1"
                else:
                    add = f" AND disputed = 1"
            
                query = query + add
                count_query=count_query+add
            
            if disputed == 'is not disputed' :
                if query[-5:] == "WHERE":
                    add = f" disputed = 0"
                else:
                    add = f" AND disputed = 0 "
            
                query = query + add
                count_query=count_query+add

            if fraud_check=='In progress':
                if query[-5:] == "WHERE":
                    add = f" fraud_status = 'In progress''{fraud_check}'"
                else:
                    add = f" AND fraud_status = 'In progress' '{fraud_check}'"
                query = query + add
                count_query=count_query+add

            if fraud_check=='Safe':
                if query[-5:] == "WHERE":
                    add = f" fraud_status = 'Safe''{fraud_check}'"
                else:
                    add = f" AND fraud_status = 'Safe' '{fraud_check}'"
                query = query + add
                count_query=count_query+add

            
            if fraud_check=='Suspicious':
                if query[-5:] == "WHERE":
                    add = f" fraud_status = 'Suspicious''{fraud_check}'"
                else:
                    add = f" AND fraud_status = 'Suspicious' '{fraud_check}'"
                query = query + add
                count_query=count_query+add

            
            if fraud_check=='Fraudulent':
                if query[-5:] == "WHERE":
                    add = f" fraud_status = 'Fraudulent''{fraud_check}'"
                else:
                    add = f" AND fraud_status = 'Fraudulent' '{fraud_check}'"
                query = query + add
                count_query=count_query+add

            
            if fraud_check=='Unknown':
                if query[-5:] == "WHERE":
                    add = f" fraud_status = 'Unknown''{fraud_check}'"
                else:
                    add = f" AND fraud_status = 'Unknown' '{fraud_check}'"
                query = query + add
                count_query=count_query+add


            if chargeId:
                if query[-5:] == "WHERE":
                    add = f" id = '{chargeId}'"
                else:
                    add = f" AND id = '{chargeId}'"
                query = query + add
                count_query=count_query+add

            if customerId:
                if query[-5:] == "WHERE":
                    add = f" customerId = '{customerId}'"
                else:
                    add = f" AND customerId = '{customerId}'"
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
                            

                        }
                    results.append(result)
                if pre_time:
                    results=results[::-1]
                response ={
                    "status": "success",
                    "code": 200,
                    "data_length":count[0][0],
                    "data":results,
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
        elif last4digits or  fingerprint or not dispute_status or not acceptedAsLost:
            connection, cursor = db_connect()

            query = f"SELECT * FROM charge INNER JOIN cards ON charge.card_id= cards.card_id WHERE charge.created<{time}"
            count_query = f"SELECT COUNT(*) FROM charge INNER JOIN cards ON charge.card_id= cards.card_id WHERE charge.created<{time}"
            if pre_time:
                query = f"SELECT * FROM charge INNER JOIN cards ON charge.card_id= cards.card_id WHERE charge.created>{pre_time}"
            if start_date and last_date:
                if query[-5:] == "WHERE":
                    add = f" charge.created BETWEEN {start_date} AND {last_date}"
                else:
                    add = f" AND charge.created BETWEEN {start_date} AND {last_date}"

                query = query + add
                count_query=count_query+add
            
            if currency:
                if query[-5:] == "WHERE":
                    add = f" charge.currency = '{currency}'"
                else:
                    add = f" AND charge.currency = '{currency}'"

                query = query + add
                count_query=count_query+add
            
            if last4digits:
                if query[-5:] == "WHERE":
                    add = f" cards.last4 = '{last4digits}'"
                else:
                    add = f" AND cards.last4 = '{last4digits}'"
            
                query = query + add
                count_query=count_query+add

            if description:
                if query[-5:] == "WHERE":
                    add = f" charge.description = '{description}'"
                else:
                    add = f" AND charge.description = '{description}'"
            
                query = query + add
                count_query=count_query+add
            
            if fingerprint:
                if query[-5:] == "WHERE":
                    add = f" cards.fingerprint = '{fingerprint}'"
                else:
                    add = f" AND cards.fingerprint = '{fingerprint}'"
            
                query = query + add
                count_query=count_query+add

            # if partner=="Show my offers":
            #     if query[-5:] == "WHERE":
            #         add = f" merchant_id = '{merchant_id}'"
            #     else:
            #         add = f" AND merchant_id = '{merchant_id}'"
            
            #     query = query + add
            if captured == 'is captured' :
                if query[-5:] == "WHERE":
                    add = f" charge.captured = 1"
                else:
                    add = f" AND charge.captured = 1"
            
                query = query + add
                count_query=count_query+add
            
            if captured == 'is not captured' :
                if query[-5:] == "WHERE":
                    add = f" charge.captured = 0"
                else:
                    add = f" AND charge.captured = 0 "
            
                query = query + add
                count_query=count_query+add

            if refunded == 'is refunded' :
                if query[-5:] == "WHERE":
                    add = f" charge.refunded = 1"
                else:
                    add = f" AND charge.refunded = 1"
            
                query = query + add
                count_query=count_query+add
            
            if refunded == 'is not refunded' :
                if query[-5:] == "WHERE":
                    add = f" charge.refunded = 0"
                else:
                    add = f" AND charge.refunded = 0 "
            
                query = query + add
                count_query=count_query+add

            
            if disputed == 'is disputed' :
                if query[-5:] == "WHERE":
                    add = f" charge.disputed = 1"
                else:
                    add = f" AND charge.disputed = 1"
            
                query = query + add
                count_query=count_query+add
            
            if disputed == 'is not disputed' :
                if query[-5:] == "WHERE":
                    add = f" charge.disputed = 0"
                else:
                    add = f" AND charge.disputed = 0 "
            
                query = query + add
                count_query=count_query+add

            if fraud_check=='In progress':
                if query[-5:] == "WHERE":
                    add = f" charge.fraud_status = 'In progress''{fraud_check}'"
                else:
                    add = f" AND charge.fraud_status = 'In progress' '{fraud_check}'"
                query = query + add
                count_query=count_query+add

            if fraud_check=='Safe':
                if query[-5:] == "WHERE":
                    add = f" charge.fraud_status = 'Safe''{fraud_check}'"
                else:
                    add = f" AND charge.fraud_status = 'Safe' '{fraud_check}'"
                query = query + add
                count_query=count_query+add

            
            if fraud_check=='Suspicious':
                if query[-5:] == "WHERE":
                    add = f" charge.fraud_status = 'Suspicious''{fraud_check}'"
                else:
                    add = f" AND charge.fraud_status = 'Suspicious' '{fraud_check}'"
                query = query + add
                count_query=count_query+add

            
            if fraud_check=='Fraudulent':
                if query[-5:] == "WHERE":
                    add = f" charge.fraud_status = 'Fraudulent''{fraud_check}'"
                else:
                    add = f" AND charge.fraud_status = 'Fraudulent' '{fraud_check}'"
                query = query + add
                count_query=count_query+add

            
            if fraud_check=='Unknown':
                if query[-5:] == "WHERE":
                    add = f" charge.fraud_status = 'Unknown''{fraud_check}'"
                else:
                    add = f" AND charge.fraud_status = 'Unknown' '{fraud_check}'"
                query = query + add
                count_query=count_query+add

            if chargeId:
                if query[-5:] == "WHERE":
                    add = f" charge.id = '{chargeId}'"
                else:
                    add = f" AND charge.id = '{chargeId}'"
                query = query + add
                count_query=count_query+add

            if customerId:
                if query[-5:] == "WHERE":
                    add = f" charge.customerId = '{customerId}'"
                else:
                    add = f" AND charge.customerId = '{customerId}'"
                query = query + add
                count_query=count_query+add
            if time:
                if query[-5:] == "WHERE":
                    add = f" ORDER BY charge.created DESC LIMIT {limit}"

                else:
                    add = f" ORDER BY charge.created DESC LIMIT {limit}"
            if pre_time:
                if query[-5:] == "WHERE":
                    add = f" ORDER BY charge.created ASC LIMIT {limit}"

                else:
                    add = f" ORDER BY charge.created ASC LIMIT {limit}"
            
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
        

        elif  not last4digits or not fingerprint or dispute_status or acceptedAsLost:
            connection, cursor = db_connect()

            query = f"SELECT * FROM charge INNER JOIN disputes ON charge.id=disputes.chargeID WHERE charge.created<{time}"
            count_query = f"SELECT * FROM charge INNER JOIN disputes ON charge.id=disputes.chargeID WHERE charge.created<{time}"
            if pre_time:
                query = f"SELECT * FROM charge INNER JOIN disputes ON charge.id=disputes.chargeID WHERE charge.created>{time}"
            if start_date and last_date:
                if query[-5:] == "WHERE":
                    add = f" charge.created BETWEEN {start_date} AND {last_date}"
                else:
                    add = f" AND charge.created BETWEEN {start_date} AND {last_date}"

                query = query + add
                count_query=count_query+add
            
            if currency:
                if query[-5:] == "WHERE":
                    add = f" charge.currency = '{currency}'"
                else:
                    add = f" AND charge.currency = '{currency}'"

                query = query + add
                count_query=count_query+add
            
            

            if description:
                if query[-5:] == "WHERE":
                    add = f" charge.description = '{description}'"
                else:
                    add = f" AND charge.description = '{description}'"
            
                query = query + add
                count_query=count_query+add
            
        
            if captured == 'is captured' :
                if query[-5:] == "WHERE":
                    add = f" charge.captured = 1"
                else:
                    add = f" AND charge.captured = 1"
            
                query = query + add
                count_query=count_query+add
            
            if captured == 'is not captured' :
                if query[-5:] == "WHERE":
                    add = f" charge.captured = 0"
                else:
                    add = f" AND charge.captured = 0 "
            
                query = query + add
                count_query=count_query+add

            if refunded == 'is refunded' :
                if query[-5:] == "WHERE":
                    add = f" charge.refunded = 1"
                else:
                    add = f" AND charge.refunded = 1"
            
                query = query + add
                count_query=count_query+add
            
            if refunded == 'is not refunded' :
                if query[-5:] == "WHERE":
                    add = f" charge.refunded = 0"
                else:
                    add = f" AND charge.refunded = 0 "
            
                query = query + add
                count_query=count_query+add

            
            if disputed == 'is disputed' :
                if query[-5:] == "WHERE":
                    add = f" charge.disputed = 1"
                else:
                    add = f" AND charge.disputed = 1"
            
                query = query + add
                count_query=count_query+add
            
            if disputed == 'is not disputed' :
                if query[-5:] == "WHERE":
                    add = f" charge.disputed = 0"
                else:
                    add = f" AND charge.disputed = 0 "
            
                query = query + add
                count_query=count_query+add

            if fraud_check=='In progress':
                if query[-5:] == "WHERE":
                    add = f" charge.fraud_status = 'In progress''{fraud_check}'"
                else:
                    add = f" AND charge.fraud_status = 'In progress' '{fraud_check}'"
                query = query + add
                count_query=count_query+add

            if fraud_check=='Safe':
                if query[-5:] == "WHERE":
                    add = f" charge.fraud_status = 'Safe''{fraud_check}'"
                else:
                    add = f" AND charge.fraud_status = 'Safe' '{fraud_check}'"
                query = query + add
                count_query=count_query+add

            
            if fraud_check=='Suspicious':
                if query[-5:] == "WHERE":
                    add = f" charge.fraud_status = 'Suspicious''{fraud_check}'"
                else:
                    add = f" AND charge.fraud_status = 'Suspicious' '{fraud_check}'"
                query = query + add
                count_query=count_query+add

            
            if fraud_check=='Fraudulent':
                if query[-5:] == "WHERE":
                    add = f" charge.fraud_status = 'Fraudulent''{fraud_check}'"
                else:
                    add = f" AND charge.fraud_status = 'Fraudulent' '{fraud_check}'"
                query = query + add
                count_query=count_query+add

            
            if fraud_check=='Unknown':
                if query[-5:] == "WHERE":
                    add = f" charge.fraud_status = 'Unknown''{fraud_check}'"
                else:
                    add = f" AND charge.fraud_status = 'Unknown' '{fraud_check}'"
                query = query + add
                count_query=count_query+add

            

            if dispute_status =='Retrieval request - response needed':
                if query[-5:] == "WHERE":
                    add = f" disputes.status = '{dispute_status}'"
                else:
                    add = f" AND disputes.status = '{dispute_status}'"
                query = query + add
                count_query=count_query+add
            
            if dispute_status =='Retrieval request - response under review':
                if query[-5:] == "WHERE":
                    add = f" disputes.status = '{dispute_status}'"
                else:
                    add = f" AND disputes.status = '{dispute_status}'"
                query = query + add
                count_query=count_query+add

            if dispute_status =='Retrieval request - successfully represented':
                if query[-5:] == "WHERE":
                    add = f" disputes.status = '{dispute_status}'"
                else:
                    add = f" AND disputes.status = '{dispute_status}'"
                query = query + add
                count_query=count_query+add

            if dispute_status =='Chargeback - response needed':
                if query[-5:] == "WHERE":
                    add = f" disputes.status = '{dispute_status}'"
                else:
                    add = f" AND disputes.status = '{dispute_status}'"
                query = query + add
                count_query=count_query+add

            if dispute_status =='Chargeback - response under review':
                if query[-5:] == "WHERE":
                    add = f" disputes.status = '{dispute_status}'"
                else:
                    add = f" AND disputes.status = '{dispute_status}'"
                query = query + add
                count_query=count_query+add

            if dispute_status =='Chargeback - dispute won':
                if query[-5:] == "WHERE":
                    add = f" disputes.status = '{dispute_status}'"
                else:
                    add = f" AND disputes.status = '{dispute_status}'"
                query = query + add
                count_query=count_query+add
            
            if dispute_status =='Chargeback - dispute lost':
                if query[-5:] == "WHERE":
                    add = f" disputes.status = '{dispute_status}'"
                else:
                    add = f" AND disputes.status = '{dispute_status}'"
                query = query + add
                count_query=count_query+add

            if acceptedAsLost =='is accepted as lost':
                if query[-5:] == "WHERE":
                    add = f" disputes.status = 1"
                else:
                    add = f" AND disputes.status = 1"
                query = query + add
                count_query=count_query+add
            
            if acceptedAsLost =='is not accepted as lost':
                if query[-5:] == "WHERE":
                    add = f" disputes.status = 0"
                else:
                    add = f" AND disputes.status = 0"
                query = query + add
                count_query=count_query+add

            if chargeId:
                if query[-5:] == "WHERE":
                    add = f" charge.id = '{chargeId}'"
                else:
                    add = f" AND charge.id = '{chargeId}'"
                query = query + add
                count_query=count_query+add

            if customerId:
                if query[-5:] == "WHERE":
                    add = f" charge.customerId = '{customerId}'"
                else:
                    add = f" AND charge.customerId = '{customerId}'"
                query = query + add
                count_query=count_query+add
            if time:
                if query[-5:] == "WHERE":
                    add = f" ORDER BY charge.created DESC LIMIT {limit}"

                else:
                    add = f" ORDER BY charge.created DESC LIMIT {limit}"
            if pre_time:
                if query[-5:] == "WHERE":
                    add = f" ORDER BY charge.created ASC LIMIT {limit}"

                else:
                    add = f" ORDER BY charge.created ASC LIMIT {limit}"
            
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



        elif  (not last4digits or not fingerprint) and (dispute_status or acceptedAsLost):
            connection, cursor = db_connect()

            query = f"SELECT * FROM charge INNER JOIN cards ON charge.card_id= cards.card_id INNER JOIN disputes ON charge.id=disputes.chargeID WHERE charge.created<{time}"
            count_query = f"SELECT * FROM charge INNER JOIN cards ON charge.card_id= cards.card_id INNER JOIN disputes ON charge.id=disputes.chargeID WHERE charge.created<{time}"
            if pre_time:
                query = f"SELECT * FROM charge INNER JOIN cards ON charge.card_id= cards.card_id INNER JOIN disputes ON charge.id=disputes.chargeID WHERE charge.created>{pre_time}"
            if start_date and last_date:
                if query[-5:] == "WHERE":
                    add = f" charge.created BETWEEN {start_date} AND {last_date}"
                else:
                    add = f" AND charge.created BETWEEN {start_date} AND {last_date}"

                query = query + add
                count_query=count_query+add
            
            if currency:
                if query[-5:] == "WHERE":
                    add = f" charge.currency = '{currency}'"
                else:
                    add = f" AND charge.currency = '{currency}'"

                query = query + add
                count_query=count_query+add
            
            if last4digits:
                if query[-5:] == "WHERE":
                    add = f" cards.last4 = '{last4digits}'"
                else:
                    add = f" AND cards.last4 = '{last4digits}'"
            
                query = query + add
                count_query=count_query+add

            if description:
                if query[-5:] == "WHERE":
                    add = f" charge.description = '{description}'"
                else:
                    add = f" AND charge.description = '{description}'"
            
                query = query + add
                count_query=count_query+add
            
            if fingerprint:
                if query[-5:] == "WHERE":
                    add = f" cards.fingerprint = '{fingerprint}'"
                else:
                    add = f" AND cards.fingerprint = '{fingerprint}'"
            
                query = query + add
                count_query=count_query+add

            # if partner=="Show my offers":
            #     if query[-5:] == "WHERE":
            #         add = f" merchant_id = '{merchant_id}'"
            #     else:
            #         add = f" AND merchant_id = '{merchant_id}'"
            
            #     query = query + add
            if captured == 'is captured' :
                if query[-5:] == "WHERE":
                    add = f" charge.captured = 1"
                else:
                    add = f" AND charge.captured = 1"
            
                query = query + add
                count_query=count_query+add
            
            if captured == 'is not captured' :
                if query[-5:] == "WHERE":
                    add = f" charge.captured = 0"
                else:
                    add = f" AND charge.captured = 0 "
            
                query = query + add
                count_query=count_query+add

            if refunded == 'is refunded' :
                if query[-5:] == "WHERE":
                    add = f" charge.refunded = 1"
                else:
                    add = f" AND charge.refunded = 1"
            
                query = query + add
                count_query=count_query+add
            
            if refunded == 'is not refunded' :
                if query[-5:] == "WHERE":
                    add = f" charge.refunded = 0"
                else:
                    add = f" AND charge.refunded = 0 "
            
                query = query + add
                count_query=count_query+add

            
            if disputed == 'is disputed' :
                if query[-5:] == "WHERE":
                    add = f" charge.disputed = 1"
                else:
                    add = f" AND charge.disputed = 1"
            
                query = query + add
                count_query=count_query+add
            
            if disputed == 'is not disputed' :
                if query[-5:] == "WHERE":
                    add = f" charge.disputed = 0"
                else:
                    add = f" AND charge.disputed = 0 "
            
                query = query + add
                count_query=count_query+add

            if fraud_check=='In progress':
                if query[-5:] == "WHERE":
                    add = f" charge.fraud_status = 'In progress''{fraud_check}'"
                else:
                    add = f" AND charge.fraud_status = 'In progress' '{fraud_check}'"
                query = query + add
                count_query=count_query+add

            if fraud_check=='Safe':
                if query[-5:] == "WHERE":
                    add = f" charge.fraud_status = 'Safe''{fraud_check}'"
                else:
                    add = f" AND charge.fraud_status = 'Safe' '{fraud_check}'"
                query = query + add
                count_query=count_query+add

            
            if fraud_check=='Suspicious':
                if query[-5:] == "WHERE":
                    add = f" charge.fraud_status = 'Suspicious''{fraud_check}'"
                else:
                    add = f" AND charge.fraud_status = 'Suspicious' '{fraud_check}'"
                query = query + add
                count_query=count_query+add

            
            if fraud_check=='Fraudulent':
                if query[-5:] == "WHERE":
                    add = f" charge.fraud_status = 'Fraudulent''{fraud_check}'"
                else:
                    add = f" AND charge.fraud_status = 'Fraudulent' '{fraud_check}'"
                query = query + add
                count_query=count_query+add

            
            if fraud_check=='Unknown':
                if query[-5:] == "WHERE":
                    add = f" charge.fraud_status = 'Unknown''{fraud_check}'"
                else:
                    add = f" AND charge.fraud_status = 'Unknown' '{fraud_check}'"
                query = query + add
                count_query=count_query+add

            

            if dispute_status =='Retrieval request - response needed':
                if query[-5:] == "WHERE":
                    add = f" disputes.status = '{dispute_status}'"
                else:
                    add = f" AND disputes.status = '{dispute_status}'"
                query = query + add
                count_query=count_query+add
            
            if dispute_status =='Retrieval request - response under review':
                if query[-5:] == "WHERE":
                    add = f" disputes.status = '{dispute_status}'"
                else:
                    add = f" AND disputes.status = '{dispute_status}'"
                query = query + add
                count_query=count_query+add

            if dispute_status =='Retrieval request - successfully represented':
                if query[-5:] == "WHERE":
                    add = f" disputes.status = '{dispute_status}'"
                else:
                    add = f" AND disputes.status = '{dispute_status}'"
                query = query + add
                count_query=count_query+add

            if dispute_status =='Chargeback - response needed':
                if query[-5:] == "WHERE":
                    add = f" disputes.status = '{dispute_status}'"
                else:
                    add = f" AND disputes.status = '{dispute_status}'"
                query = query + add
                count_query=count_query+add

            if dispute_status =='Chargeback - response under review':
                if query[-5:] == "WHERE":
                    add = f" disputes.status = '{dispute_status}'"
                else:
                    add = f" AND disputes.status = '{dispute_status}'"
                query = query + add
                count_query=count_query+add

            if dispute_status =='Chargeback - dispute won':
                if query[-5:] == "WHERE":
                    add = f" disputes.status = '{dispute_status}'"
                else:
                    add = f" AND disputes.status = '{dispute_status}'"
                query = query + add
                count_query=count_query+add
            
            if dispute_status =='Chargeback - dispute lost':
                if query[-5:] == "WHERE":
                    add = f" disputes.status = '{dispute_status}'"
                else:
                    add = f" AND disputes.status = '{dispute_status}'"
                query = query + add
                count_query=count_query+add

            if acceptedAsLost =='is accepted as lost':
                if query[-5:] == "WHERE":
                    add = f" disputes.status = 1"
                else:
                    add = f" AND disputes.status = 1"
                query = query + add
                count_query=count_query+add
            
            if acceptedAsLost =='is not accepted as lost':
                if query[-5:] == "WHERE":
                    add = f" disputes.status = 0"
                else:
                    add = f" AND disputes.status = 0"
                query = query + add
                count_query=count_query+add

            if chargeId:
                if query[-5:] == "WHERE":
                    add = f" charge.id = '{chargeId}'"
                else:
                    add = f" AND charge.id = '{chargeId}'"
                query = query + add
                count_query=count_query+add

            if customerId:
                if query[-5:] == "WHERE":
                    add = f" charge.customerId = '{customerId}'"
                else:
                    add = f" AND charge.customerId = '{customerId}'"
                query = query + add
                count_query=count_query+add
            if time:
                if query[-5:] == "WHERE":
                    add = f" ORDER BY charge.created DESC LIMIT {limit}"

                else:
                    add = f" ORDER BY charge.created DESC LIMIT {limit}"
            if pre_time:
                if query[-5:] == "WHERE":
                    add = f" ORDER BY charge.created ASC LIMIT {limit}"

                else:
                    add = f" ORDER BY charge.created ASC LIMIT {limit}"
            
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
                           

                        }
                    results.append(result)
                if pre_time:
                    results=results[::-1]
                response ={
                    "status": "success",
                    "code": 200,
                    "data_length":count[0][0],
                    "data":results,
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