import tornado.web
import tornado
import tornado.ioloop
import pyaes
import time
import uuid
import pymysql
import json
from remove_tags import *
import hashlib
from auth import *
from cross_origin import *
from db import *


@jwtauth
class blacklist(BaseHandler):
    def post(self):
        ruleType = remove_tag(self.get_argument('ruleType'))
        fingerprint = remove_tag(self.get_argument('fingerprint',False))
        cardNumber = remove_tag(self.get_argument('cardNumber',False))
        ipAddress = remove_tag(self.get_argument('ipAddress',False))
        ipCountry = remove_tag(self.get_argument('ipCountry',False))
        metadataKey = remove_tag(self.get_argument('metadataKey',False))
        metadataValue = remove_tag(self.get_argument('metadataValue',False))
        email = remove_tag(self.get_argument('email',False))
        userAgent = remove_tag(self.get_argument('userAgent',False))
        acceptLanguage = remove_tag(self.get_argument('acceptLanguage',False))

        if ruleType:

            #print(ruleType,fingerprint)

            black_id="blr_"+str(uuid.uuid1())
            created=time.time()
            connection, cursor = db_connect()
            #print("database connected")

            fingerprint_record = "0"
            cardNumber_record = "0"
            ipAddress_record = "0"
            ipCountry_record = "0"
            metadataKey_record = "0"
            email_record = "0"
            userAgent_record = "0"
            acceptLanguage_record = "0"
            sql_credit = "INSERT INTO blacklist(black_id , created , objectType ,ruleType , fingerprint ,ipAddress , ipCountry , metadataKey , metadataValue , email , userAgent , acceptLanguage,merchant_id ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"

            if ruleType == 'fingerprint':
                sql_blacklist = "SELECT fingerprint FROM blacklist WHERE fingerprint=cast(%s as char)"
                cursor.execute(sql_blacklist,(fingerprint))
                fingerprint_blacklist=cursor.fetchall()
                #print("_____________________------------",fingerprint_blacklist)
                if fingerprint_blacklist==():
                    sql_card = "SELECT fingerprint FROM cards WHERE fingerprint=cast(%s as char)"
                    cursor.execute(sql_card,(fingerprint))
                    fingerprint_record=cursor.fetchall()
                    connection.commit()
                    if fingerprint_record:
                        cursor.execute(sql_credit, (str(black_id), float(created), "blacklistRule", str(ruleType), str(fingerprint_record[0][0]),
                        str(ipAddress_record), str(ipCountry_record), str(metadataKey_record),str(metadataKey_record),(email_record), str(userAgent_record), str(acceptLanguage_record),"admin"))
                        connection.commit()
                    else:
                        response={
                                    "status": "error",
                                    "code": 404,
                                    "data": "null",
                                    "message": "fingerprint not found"
                                }
                        raise tornado.web.Finish(response)
                else:
                    response = {
                        "status": "error",
                        "code": 404,
                        "data": "null",
                        "message": "fingerprint already blacklisted",
                    }
                    raise tornado.web.Finish(response)
                    

            if ruleType == 'cardNumber':
                fingerprint = hashlib.sha224(cardNumber.encode()).hexdigest()
                sql_blacklist = "SELECT fingerprint FROM blacklist WHERE fingerprint=cast(%s as char)"
                cursor.execute(sql_blacklist,(cardNumber))
                fingerprint_blacklist=cursor.fetchall()
                #print("_____________________------------",fingerprint_blacklist)
                if fingerprint_blacklist==():
                    sql_card = "SELECT fingerprint FROM cards WHERE fingerprint=cast(%s as char)"
                    cursor.execute(sql_card, (fingerprint))
                    cardNumber_record = cursor.fetchall()

                    connection.commit()
                    if cardNumber_record:
                        cursor.execute(sql_credit, (
                        str(black_id), float(created), "blacklistRule", str(ruleType), str(fingerprint),
                        str(ipAddress_record), str(ipCountry_record), str(metadataKey_record), str(metadataKey_record),
                        (email_record), str(userAgent_record), str(acceptLanguage_record),"admin"))
                        connection.commit()
                    else:
                        response = {
                            "status": "error",
                            "code": 404,
                            "data": "null",
                            "message": "cardNumber not found",
                        }
                        raise tornado.web.Finish(response)
                else:
                    response = {
                        "status": "error",
                        "code": 404,
                        "data": "null",
                        "message": "cardnumber already blacklisted",
                    }
                    raise tornado.web.Finish(response)
                    



            if ruleType == 'ipAddress':
                sql_blacklist = "SELECT ipAddress FROM blacklist WHERE ipAddress=cast(%s as char)"
                cursor.execute(sql_blacklist,(ipAddress))
                fingerprint_blacklist=cursor.fetchall()
                #print("_____________________------------",fingerprint_blacklist)
                if fingerprint_blacklist==():
                    sql_card = "SELECT ipAddress FROM cards WHERE ipAddress=%s "
                    cursor.execute(sql_card,(ipAddress))
                    ipAddress_record=cursor.fetchall()
                    connection.commit()
                    #print("carddddd")
                    if ipAddress_record:
                        cursor.execute(sql_credit, (
                        str(black_id), float(created), "blacklistRule", str(ruleType), str(fingerprint_record),
                        str(ipAddress_record[0][0]), str(ipCountry_record), str(metadataKey_record), str(metadataKey_record),
                        (email_record), str(userAgent_record), str(acceptLanguage_record),"admin"))
                        connection.commit()
                    else:
                        response = {
                            "status": "error",
                            "code": 404,
                            "data": "null",
                            "message": "ipAddress not found",
                        }
                        raise tornado.web.Finish(response)

                else:
                    response = {
                        "status": "error",
                        "code": 404,
                        "data": "null",
                        "message": "ipAddress already blacklisted",
                    }
                    raise tornado.web.Finish(response)


                    




            if ruleType == 'ipCountry':
                ipCountry_record=ipCountry
                sql_blacklist = "SELECT ipCountry FROM blacklist WHERE ipCountry=cast(%s as char)"
                cursor.execute(sql_blacklist,(ipCountry))
                fingerprint_blacklist=cursor.fetchall()
                #print("_____________________------------",fingerprint_blacklist)
                if fingerprint_blacklist==():
                    if ipCountry_record:

                        cursor.execute(sql_credit, (
                        str(black_id), float(created), "blacklistRule", str(ruleType), str(fingerprint_record),
                        str(ipAddress_record), str(ipCountry_record), str(metadataKey_record), str(metadataKey_record),
                        (email_record), str(userAgent_record), str(acceptLanguage_record),"admin"))
                        connection.commit()
                    else:
                        response = {
                            "status": "error",
                            "code": 404,
                            "data": "null",
                            "message": "ipCountry not found",
                        }
                        raise tornado.web.Finish(response)
                else:
                    response = {
                        "status": "error",
                        "code": 404,
                        "data": "null",
                        "message": "ipCountry already blacklisted",
                    }
                    raise tornado.web.Finish(response)

                    



            if ruleType == 'metadataKey':
                metadataKey_record = metadataKey
               
                sql_blacklist = "SELECT metadataKey FROM blacklist WHERE metadataKey=cast(%s as char)"
                cursor.execute(sql_blacklist,(metadataKey))
                fingerprint_blacklist=cursor.fetchall()
                #print("_____________________------------",fingerprint_blacklist)
                if fingerprint_blacklist==():
                    if metadataKey_record:
                        cursor.execute(sql_credit, (
                        str(black_id), float(created), "blacklistRule", str(ruleType), str(fingerprint_record),
                        str(ipAddress_record), str(ipCountry_record), str(metadataKey_record), str(metadataKey_record),
                        (email_record), str(userAgent_record), str(acceptLanguage_record),"admin"))
                        connection.commit()
                    else:
                        response = {
                            "status": "error",
                            "code": 404,
                            "data": "null",
                            "message": "metadataKey not found",
                        }
                        raise tornado.web.Finish(response)
                else:
                    response = {
                        "status": "error",
                        "code": 404,
                        "data": "null",
                        "message": "metadataKey already blacklisted",
                    }
                    raise tornado.web.Finish(response)

            if ruleType == 'metadataValue':
                metadataKey_record = metadataValue
                sql_blacklist = "SELECT metadataValue FROM blacklist WHERE metadataValue=cast(%s as char)"
                cursor.execute(sql_blacklist,(metadataValue))
                fingerprint_blacklist=cursor.fetchall()
                #print("_____________________------------",fingerprint_blacklist)

                if fingerprint_blacklist==():
                    if metadataKey_record:
                        cursor.execute(sql_credit, (
                        str(black_id), float(created), "blacklistRule", str(ruleType), str(fingerprint_record),
                        str(ipAddress_record), str(ipCountry_record), str(metadataKey_record), str(metadataKey_record),
                        (email_record), str(userAgent_record), str(acceptLanguage_record),"admin"))
                        connection.commit()
                    else:
                        response = {
                            "status": "error",
                            "code": 404,
                            "data": "null",
                            "message": "metadataValue not found",
                        }
                        raise tornado.web.Finish(response)
                else:
                    response = {
                        "status": "error",
                        "code": 404,
                        "data": "null",
                        "message": "metadataValue already blacklisted",
                    }
                    raise tornado.web.Finish(response)
                

            if ruleType == 'email':
                sql_blacklist = "SELECT email FROM blacklist WHERE email=cast(%s as char)"
                cursor.execute(sql_blacklist,(email))
                fingerprint_blacklist=cursor.fetchall()
                #print("_____________________------------",fingerprint_blacklist)

                if fingerprint_blacklist==():
                    sql_card = "SELECT email FROM cards WHERE email=cast(%s as char) "
                    cursor.execute(sql_card, (email))
                    email_record = cursor.fetchall()
                    connection.commit()
                    if email_record:
                        cursor.execute(sql_credit, (
                        str(black_id), float(created), "blacklistRule", str(ruleType), str(fingerprint_record),
                        str(ipAddress_record), str(ipCountry_record), str(metadataKey_record), str(metadataKey_record),
                        (email_record[0][0]), str(userAgent_record), str(acceptLanguage_record),"admin"))
                        connection.commit()
                    elif email_record==():
                        sql_card = "SELECT email FROM customers WHERE email=cast(%s as char) "
                        cursor.execute(sql_card, (email))
                        email_record = cursor.fetchall()
                        if email_record:
                            cursor.execute(sql_credit, (
                            str(black_id), float(created), "blacklistRule", str(ruleType), str(fingerprint_record),
                            str(ipAddress_record), str(ipCountry_record), str(metadataKey_record), str(metadataKey_record),
                            (email_record[0][0]), str(userAgent_record), str(acceptLanguage_record),"admin"))
                            connection.commit()

                        else:
                            response = {
                                "status": "error",
                                "code": 404,
                                "data": "null",
                                "message": "email not found",
                            }
                            raise tornado.web.Finish(response)
                else:
                    response = {
                        "status": "error",
                        "code": 404,
                        "data": "null",
                        "message": "email already blacklisted",
                    }
                    raise tornado.web.Finish(response)
                
            if ruleType == 'userAgent':
                sql_blacklist = "SELECT userAgent FROM blacklist WHERE userAgent=cast(%s as char)"
                cursor.execute(sql_blacklist,(userAgent))
                fingerprint_blacklist=cursor.fetchall()
                #print("_____________________------------",fingerprint_blacklist)
                if fingerprint_blacklist==():
                    sql_card = "SELECT userAgent FROM cards WHERE userAgent=cast(%s as char) "
                    cursor.execute(sql_card, (userAgent))
                    userAgent_record = cursor.fetchall()
                    if userAgent_record:
                        cursor.execute(sql_credit, (
                        str(black_id), float(created), "blacklistRule", str(ruleType), str(fingerprint_record),
                        str(ipAddress_record), str(ipCountry_record), str(metadataKey_record), str(metadataKey_record),
                        (email_record), str(userAgent_record[0][0]), str(acceptLanguage_record),"admin"))
                        connection.commit()

                    else:
                        response = {
                            "status": "error",
                            "code": 404,
                            "data": "null",
                            "message": "userAgent not found",
                        }
                        raise tornado.web.Finish(response)
                    
                else:
                    response = {
                        "status": "error",
                        "code": 404,
                        "data": "null",
                        "message": "userAgent already blacklisted",
                    }
                    raise tornado.web.Finish(response)


                    


            if ruleType == 'acceptLanguage':
                sql_blacklist = "SELECT acceptLanguage FROM blacklist WHERE acceptLanguage=cast(%s as char)"
                cursor.execute(sql_blacklist,(acceptLanguage))
                fingerprint_blacklist=cursor.fetchall()
                #print("_____________________------------",fingerprint_blacklist)
                if fingerprint_blacklist==():
                    sql_card = "SELECT acceptLanguage FROM cards WHERE acceptLanguage=cast(%s as char) "
                    cursor.execute(sql_card, (acceptLanguage))
                    acceptLanguage_record = cursor.fetchall()
                    if acceptLanguage_record:
                        cursor.execute(sql_credit, (
                        str(black_id), float(created), "blacklistRule", str(ruleType), str(fingerprint_record),
                        str(ipAddress_record), str(ipCountry_record), str(metadataKey_record), str(metadataKey_record),
                        (email_record), str(userAgent_record), str(acceptLanguage_record[0][0]),"admin"))
                        connection.commit()

                    else:
                        response = {
                            "status": "error",
                            "code": 404,
                            "data": "null",
                            "message": "acceptLanguage not found",
                        }
                        raise tornado.web.Finish(response)
                    
                else:
                    response = {
                        "status": "error",
                        "code": 404,
                        "data": "null",
                        "message": "acceptLanguage already blacklisted",
                    }
                    raise tornado.web.Finish(response)

                    



            sql_select_Query = "SELECT * FROM blacklist WHERE black_id=cast(%s as char) "

            cursor.execute(sql_select_Query, (black_id))

            records = cursor.fetchall()
            connection.commit()
            #print(records)
            if records:
                result={
                "id" : records[0][0],
                "created" :  str(records[0][1]),
                "objectType" : records[0][2],
                "ruleType" : records[0][3],
                "fingerprint" : records[0][4],
                "email":records[0][9],
                "ipAddress" :records[0][5],
                "ipCountry":records[0][6],
                "metadataKey": records[0][7],
                "metadataValue": records[0][8],
                "userAgent": records[0][10],
                "acceptLanguage":records[0][11],}


                response={"status": "success","code": 200,
                "data": result,
                "message": "Sucessfully added to Blacklist"}
                #print("response---------------------------------",response)
                self.write(response)



            else:
                response = {
                "status": "error",
                "code": 400,
                "data": "null",
                "message": "id not exist",}
                raise tornado.web.Finish(response)

        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "null",
                "message": "BAd REquest",
            }
            raise tornado.web.Finish(response)



    def get(self):

        blacklistRuleId=regex(remove_tag(self.get_argument('blacklistRuleId')))

        if blacklistRuleId:

            connection,cursor=db_connect()

            sql_select_Query = "SELECT * FROM blacklist WHERE black_id=cast(%s as char) "

            cursor.execute(sql_select_Query, (blacklistRuleId))

            records = cursor.fetchall()
            connection.commit()

            #print(records)
            if records:
                result = {
                    "id": records[0][0],
                    "created": str(records[0][1]),
                    "objectType": records[0][2],
                    "ruleType": records[0][3],
                    "fingerprint": records[0][4],
                    "email": records[0][9],
                    "ipAddress": records[0][5],
                    "ipCountry": records[0][6],
                    "metadataKey": records[0][7],
                    "metadataValue": records[0][8],
                    "userAgent": records[0][10],
                    "acceptLanguage": records[0][11], }

                response={"status": "success","code": 200,
                "data": result,
                "message": ""}
                self.write(response)
            else:
                response = {
                    "status": "error",
                    "code": 400,
                    "data": "",
                    "message": "BAd REquest",
                }
                raise tornado.web.Finish(response)
        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "",
                "message": "BAd REquest",
            }
            raise tornado.web.Finish(response)

@jwtauth
class delete_blacklist(BaseHandler):

    def post(self):
        blacklistRuleId = regex(remove_tag(self.get_argument('blacklistRuleId')))
        if blacklistRuleId:
            connection, cursor = db_connect()

            sql_select_Query = "SELECT * FROM blacklist WHERE black_id=cast(%s as char) "

            cursor.execute(sql_select_Query, (blacklistRuleId))

            records = cursor.fetchall()

            if records:
                sql_credit = "INSERT INTO deleted_blacklist(black_id , created , objectType ,ruleType , fingerprint ,ipAddress , ipCountry , metadataKey , metadataValue , email , userAgent , acceptLanguage,merchant_id ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                cursor.execute(sql_credit, (
                    str(records[0][0]), float(records[0][1]), records[0][2], str(records[0][3]), records[0][4], records[0][5],
                    records[0][6], records[0][7], records[0][8], records[0][9], records[0][10],
                    records[0][11],"admin"))
                connection.commit()
                sql_select_Query = "DELETE FROM blacklist WHERE black_id=cast(%s as char) "

                cursor.execute(sql_select_Query, (blacklistRuleId))
                connection.commit()

                result = {
                    "id": blacklistRuleId, }

                response={"status": "success","code": 200,
                "data": result,
                "message": "blacklist deleted successfully"}
                self.write(response)
            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "",
                    "message": "Id doesn't exist",
                }
                raise tornado.web.Finish(response)
        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "",
                "message": "BAd REquest",
            }
            raise tornado.web.Finish(response)


@jwtauth
class list_Blacklist_Rules(BaseHandler):
    def get(self):
        created = remove_tag(self.get_argument('created', False))
        operation = remove_tag(self.get_argument('operation', False))
        deleted = remove_tag(self.get_argument('deleted', False))
        limit = remove_tag(self.get_argument('limit', False))
        startingAfterId = regex(remove_tag(self.get_argument('startingAfterId', False)))
        endingBeforeId = regex(remove_tag(self.get_argument('endingBeforeId', False)))

        connection, cursor = db_connect()


        sql_length_query = ("SELECT COUNT(*) FROM blacklist")
        cursor.execute(sql_length_query)
        length = cursor.fetchall()

        len_records1=length[0][0]

        if limit == False:
            limit = 10
        elif int(limit) > 100:
            limit = 100

        if deleted == False or deleted == "0":

            if operation == "lt" or operation == "lte" or operation == "gt" or operation == "gte" and created:

                if operation == "lt":
                    sql_select_Query = ("SELECT * FROM blacklist WHERE created < %s  ORDER BY created DESC LIMIT %s")
                elif operation == "lte":
                    sql_select_Query = ("SELECT * FROM blacklist WHERE created <= %s ORDER BY created DESC LIMIT %s")
                elif operation == "gt":
                    sql_select_Query = ("SELECT * FROM blacklist WHERE created > %s  ORDER BY created DESC LIMIT %s")
                elif operation == "gte":
                    sql_select_Query = ("SELECT * FROM blacklist WHERE created >= %s ORDER BY created DESC LIMIT %s")

                cursor.execute(sql_select_Query, (float(created), int(limit)))
                records = cursor.fetchall()
                #print("records",records)
                connection.commit()
                # len_records = len(records)
                limit = len(records)
                if len(records) == int(limit) and len(records)>0:
                    # card_ID = []
                    # for i in range(limit):
                    #     var = records[i][7]
                    #     #print(var)
                    #     if var.startswith("tok_"):
                    #         connection = pymysql.connect(host='localhost', user='root', password='', db='token')
                    #         cursor = connection.cursor()
                    #         sql_select_Query = ("SELECT card_id FROM token WHERE id=%s")
                    #
                    #         cursor.execute(sql_select_Query, records[i][7])
                    #         card_records = cursor.fetchall()
                    #         card_ID.append(card_records)
                    #     elif var.startswith("card_"):
                    #         card_ID.append(records[i][7])
                    #     else:
                    #         card_ID.append("null")
                    #
                    # #print("cardid", card_ID)
                    # card_data = []
                    # for i in range(len(records)):
                    #     connection = pymysql.connect(host='localhost', user='root', password='', db='card')
                    #     cursor = connection.cursor()
                    #     sql_select_Query = ("SELECT * FROM cards WHERE card_id= %s ")
                    #
                    #     cursor.execute(sql_select_Query, (card_ID[i]))
                    #     data = cursor.fetchall()
                    #     card_data.append(data)
                    # #print("card_data", card_data)
                    result = []
                    for i in range(int(limit)):
                        if records[i] != ():
                            for j in range(4,11):
                                
                                if records[i][j]!='0':
                                    rule=records[i][j]
                        data = {
                            "id": records[i][0],
                            "created":  str(records[i][1]),
                            "objectType": records[i][2],
                            "ruleType": records[i][3],
                            "rules": rule, }
                        result.append(data)

                    response = {"status": "success", "code": 200,
                                "data": result,
                                "data_length": len_records1,
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

            # if customerId and operation==False:
            #     try:
            #         connection = pymysql.connect(host='localhost', user='root', password='', db='blacklist')
            #         cursor = connection.cursor()
            #         sql_select_Query = ("SELECT * FROM blacklist WHERE customerId = %s ORDER BY created DESC LIMIT %s ")
            #         cursor.execute(sql_select_Query, (customerId, int(limit)))
            #         records = cursor.fetchall()
            #         #print(records)
            #         result= []
            #         for i in range(len(records)):
            #             data = {
            #                   "id" : records[0][0],
            #                   "created" : records[0][1],
            #                   "objectType" : records[0][2],
            #                   "amount" : records[0][3],
            #                   "currency" : records[0][4],
            #                   "interval" : records[0][5],
            #                   "intervalCount" : records[0][6],
            #                   "name" : records[0][8],
            #                   "trialPeriodDays" : records[0][9]
            #                 }
            #             result.append(data)
            #
            #         self.write(json.dumps(result))
            #     except:
            #         self.write("Customer not exist")

            if startingAfterId:
                sql_select_Query = ("SELECT created FROM blacklist WHERE black_id = cast(%s as char)")
                cursor.execute(sql_select_Query, (startingAfterId))
                record = cursor.fetchall()
                sql_select_Query = ("SELECT * FROM blacklist WHERE created>= %s ORDER BY created ASC LIMIT 10 ")
                cursor.execute(sql_select_Query, (record))
                records = cursor.fetchall()
                #print(records)
                results = []
                for i in range(len(records)):
                    if records[i] != ():
                        for j in range(4,11):
                            if records[i][j]!='0':
                                rule=records[i][j]
                    data = {
                        "id": records[i][0],
                        "created":  str(records[i][1]),
                        "objectType": records[i][2],
                        "ruleType": records[i][3],
                        "rules": rule, }
                    results.append(data)
                results = results[::-1]

                response = {"status": "success", "code": 200,
                            "data": results,
                            "data_length": len_records1,
                            "message": ""}
                self.write(response)

            if endingBeforeId:

                sql_select_Query = ("SELECT created FROM blacklist WHERE black_id = cast(%s as char)")
                cursor.execute(sql_select_Query, (endingBeforeId))
                record = cursor.fetchall()
                sql_select_Query = ("SELECT * FROM blacklist WHERE created<= %s ORDER BY created DESC LIMIT 10 ")
                cursor.execute(sql_select_Query, (record))
                records = cursor.fetchall()
                #print(records)
                results = []
                for i in range(len(records)):
                    if records[i] != ():
                        for j in range(4,11):
                            
                            if records[i][j]!='0':
                                rule=records[i][j]
                    data = {
                        "id": records[i][0],
                        "created":  str(records[i][1]),
                        "objectType": records[i][2],
                        "ruleType": records[i][3],
                        "rules": rule, }
                    results.append(data)

                response = {"status": "success", "code": 200,
                            "data": results,
                            "data_length": len_records1,
                            "message": ""}
                self.write(response)

        if deleted:
            sql_length_query = ("SELECT COUNT(*) FROM blacklist")
            cursor.execute(sql_length_query)
            length = cursor.fetchall()

            len_records1=length[0][0]
            if operation == "lt" or operation == "lte" or operation == "gt" or operation == "gte" and created:

                if operation == "lt":
                    sql_select_Query = (
                        "SELECT * FROM deleted_blacklist WHERE created < %s  ORDER BY created DESC LIMIT %s")
                elif operation == "lte":
                    sql_select_Query = (
                        "SELECT * FROM deleted_blacklist WHERE created <= %s ORDER BY created DESC LIMIT %s")
                elif operation == "gt":
                    sql_select_Query = (
                        "SELECT * FROM deleted_blacklist WHERE created > %s  ORDER BY created DESC LIMIT %s")
                elif operation == "gte":
                    sql_select_Query = (
                        "SELECT * FROM deleted_blacklist WHERE created <= %s ORDER BY created DESC LIMIT %s")

                cursor.execute(sql_select_Query, (float(created), int(limit)))
                records = cursor.fetchall()
                #print(records)
                connection.commit()

                if len(records) == int(limit):
                    # card_ID = []
                    # for i in range(limit):
                    #     var = records[i][7]
                    #     #print(var)
                    #     if var.startswith("tok_"):
                    #         connection = pymysql.connect(host='localhost', user='root', password='', db='token')
                    #         cursor = connection.cursor()
                    #         sql_select_Query = ("SELECT card_id FROM token WHERE id=%s")
                    #
                    #         cursor.execute(sql_select_Query, records[i][7])
                    #         card_records = cursor.fetchall()
                    #         card_ID.append(card_records)
                    #     elif var.startswith("card_"):
                    #         card_ID.append(records[i][7])
                    #     else:
                    #         card_ID.append("null")
                    #
                    # #print("cardid", card_ID)
                    # card_data = []
                    # for i in range(len(records)):
                    #     connection = pymysql.connect(host='localhost', user='root', password='', db='card')
                    #     cursor = connection.cursor()
                    #     sql_select_Query = ("SELECT * FROM cards WHERE card_id= %s ")
                    #
                    #     cursor.execute(sql_select_Query, (card_ID[i]))
                    #     data = cursor.fetchall()
                    #     card_data.append(data)
                    # #print("card_data", card_data)
                    result = []
                    for i in range(int(limit)):
                        if records[i] != ():
                            sql_select_Query = ("SELECT * FROM blacklist WHERE black_id=cast(%s as char)")
                            cursor.execute(sql_select_Query, (records[i][3],records[i][0]))
                            rule = cursor.fetchall()
                            for i in range(4,12):
                                if rule[0][i]!='0':
                                    ruleData = rule[0][i]

                            data = {
                                "id": records[i][0],
                                "created":  str(records[i][1]),
                                "objectType": records[i][2],
                                "ruleType": records[i][3],
                                "rules": ruleData, }
                            result.append(data)

                    response = {"status": "success", "code": 200,
                                "data": result,
                                "data_length": len_records1,
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

            # if customerId and operation==False:
            #     try:
            #         connection = pymysql.connect(host='localhost', user='root', password='', db='blacklist')
            #         cursor = connection.cursor()
            #         sql_select_Query = ("SELECT * FROM blacklist WHERE customerId = %s ORDER BY created DESC LIMIT %s ")
            #         cursor.execute(sql_select_Query, (customerId, int(limit)))
            #         records = cursor.fetchall()
            #         #print(records)
            #         result= []
            #         for i in range(len(records)):
            #             data = {
            #                   "id" : records[0][0],
            #                   "created" : records[0][1],
            #                   "objectType" : records[0][2],
            #                   "amount" : records[0][3],
            #                   "currency" : records[0][4],
            #                   "interval" : records[0][5],
            #                   "intervalCount" : records[0][6],
            #                   "name" : records[0][8],
            #                   "trialPeriodDays" : records[0][9]
            #                 }
            #             result.append(data)
            #
            #         self.write(json.dumps(result))
            #     except:
            #         self.write("Customer not exist")

            if startingAfterId:

                sql_select_Query = ("SELECT created FROM deleted_blacklist WHERE black_id = cast(%s as char)")
                cursor.execute(sql_select_Query, (startingAfterId))
                record = cursor.fetchall()
                sql_select_Query = ("SELECT * FROM deleted_blacklist WHERE created>= %s ORDER BY created ASC LIMIT 10 ")
                cursor.execute(sql_select_Query, (record))
                records = cursor.fetchall()
                #print(records)
                results = []
                for i in range(len(records)):
                    sql_select_Query = ("SELECT * FROM blacklist WHERE black_id=cast(%s as char)")
                    cursor.execute(sql_select_Query, (records[i][3],records[i][0]))
                    rule = cursor.fetchall()
                    for i in range(4,12):
                        if rule[0][i]!='0':
                            ruleData = rule[0][i]

                    data = {
                        "id": records[i][0],
                        "created":  str(records[i][1]),
                        "objectType": records[i][2],
                        "ruleType": records[i][3],
                        "rules": ruleData, }
                    result.append(data)

                response = {"status": "success", "code": 200,
                            "data": result,
                            "data_length": len_records1,
                            "message": ""}
                self.write(response)

            if endingBeforeId:

                sql_select_Query = ("SELECT created FROM deleted_blacklist WHERE black_id = cast(%s as char)")
                cursor.execute(sql_select_Query, (endingBeforeId))
                record = cursor.fetchall()
                sql_select_Query = ("SELECT * FROM deleted_blacklist WHERE created<= %s ORDER BY created DESC LIMIT 10 ")
                cursor.execute(sql_select_Query, (record))
                records = cursor.fetchall()
                #print(records)
                results = []
                for i in range(len(records)):
                    sql_select_Query = ("SELECT * FROM blacklist WHERE black_id=cast(%s as char)")
                    cursor.execute(sql_select_Query, (records[i][3],records[i][0]))
                    rule = cursor.fetchall()
                    for i in range(4,12):
                        if rule[0][i]!='0':
                            ruleData = rule[0][i]

                    data = {
                        "id": records[i][0],
                        "created":  str(records[i][1]),
                        "objectType": records[i][2],
                        "ruleType": records[i][3],
                        "rules": ruleData, }
                    result.append(data)

                response = {"status": "success", "code": 200,
                            "data": result,
                            "data_length": len_records1,
                            "message": ""}
                self.write(response)


@jwtauth
class blacklist_filter(BaseHandler):
    def post(self):
        ruleType = remove_tag(self.get_argument('ruleType'))
        fingerprint = remove_tag(self.get_argument('fingerprint',False))
        ipAddress = remove_tag(self.get_argument('ipAddress',False))
        ipCountry = remove_tag(self.get_argument('ipCountry',False))
        metadataKey = remove_tag(self.get_argument('metadataKey',False))
        metadataValue = remove_tag(self.get_argument('metadataValue',False))
        email = remove_tag(self.get_argument('email',False))
        userAgent = remove_tag(self.get_argument('userAgent',False))
        acceptLanguage = remove_tag(self.get_argument('acceptLanguage',False))
        token = self.request.headers.get('Authorization')
        limit=self.get_argument('limit', False)
        # m_id = remove_tag(self.get_argument('m_id'))
        time=self.get_argument('time', False)
        pre_time=self.get_argument('pre_time', False)



        if limit ==False:
            limit=10
        else:
            limit=int(limit)
        
        if limit>100:
            limit=100

        connection, cursor = db_connect()

        query = f"SELECT * FROM blacklist WHERE created<{time}"
        count_query = f"SELECT COUNT(*) FROM blacklist WHERE created<{time}"
        if pre_time:
            query = f"SELECT * FROM blacklist WHERE created>{time}"

        if ruleType =='fingerprint' :
            if query[-5:] == "WHERE":
                add = f" fingerprint = '{fingerprint}'"
            else:
                add = f" AND fingerprint = '{fingerprint}'"

            query = query + add
            count_query=count_query+add
        
        if ruleType =='ipAddress':
            if query[-5:] == "WHERE":
                add = f" ipAddress = '{ipAddress}'"
            else:
                add = f" AND ipAddress = '{ipAddress}'"

            query = query + add
            count_query=count_query+add

        if ruleType =='ipCountry':
            if query[-5:] == "WHERE":
                add = f" ipCountry = '{ipCountry}'"
            else:
                add = f" AND ipCountry = '{ipCountry}'"
        
            query = query + add
            count_query=count_query+add

        if ruleType =='metadataKey':
            if query[-5:] == "WHERE":
                add = f" metadataKey = '{metadataKey}'"
            else:
                add = f" AND metadataKey = '{metadataKey}'"
        
            query = query + add
            count_query=count_query+add

        if ruleType =='metadataValue':
            if query[-5:] == "WHERE":
                add = f" metadataValue = '{metadataValue}'"
            else:
                add = f" AND metadataValue = '{metadataValue}'"
            query = query + add
            count_query=count_query+add
        
        if ruleType =='email':
            if query[-5:] == "WHERE":
                add = f" email = '{email}'"
            else:
                add = f" AND email = '{email}'"
            query = query + add
            count_query=count_query+add
        if ruleType =='userAgent':
            if query[-5:] == "WHERE":
                add = f" userAgent = '{userAgent}'"
            else:
                add = f" AND userAgent = '{userAgent}'"
            query = query + add
            count_query=count_query+add
        if ruleType =='acceptLanguage':
            if query[-5:] == "WHERE":
                add = f" acceptLanguage = '{acceptLanguage}'"
            else:
                add = f" AND acceptLanguage = '{acceptLanguage}'"
    
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
        #print("query-------------------------------------------------------------------------",query)
        cursor.execute(query)
        records = cursor.fetchall()
        cursor.execute(count_query)
        count = cursor.fetchall()
        # if len(records) == int(limit):
        #     result = []
        #     for i in range(int(limit)):
        #         if records[i] != ():
        #             sql_select_Query = ("SELECT blacklist.%s FROM blacklist WHERE black_id=cast(%s as char)")
        #             cursor.execute(sql_select_Query, (records[i][3],records[i][0]))
        #             rule = cursor.fetchall()
        #             data = {
        #                 "id": records[i][0],
        #                 "created":  str(records[i][1]),
        #                 "objectType": records[i][2],
        #                 "ruleType": records[i][3],
        #                 "rules": rule[0], }
        #             result.append(data)


        if records:
            
            results=[]
            for i in range(len(records)):
                # key = records[i][3]
                # #print("keyyyyyyyyyyyy",key)
                # #print("saadsdasd",records[i][3],type(records[i][3]),records[i][0],type(records[i][0]))
                # sql_select_Query = f"SELECT blacklist.{records[i][3]} FROM blacklist WHERE black_id={records[i][0]}"
                # cursor.execute(sql_select_Query)
                # rule = cursor.fetchall()
                # #print(rule,"123123123123123123")
                for j in range(4,12):
                    #print(records[i][j],"424234234234234234")
                    if records[i][j]!='0' :
                        ruleData = records[i][j]
                        #print("aasdasdasdasdasdadasdasdadadad",ruleData)

                result = {
                    "id": records[i][0],
                    "created":  str(records[i][1]),
                    "objectType": records[i][2],
                    "ruleType": records[i][3],
                    "rules": ruleData, }
                results.append(result)

                # result = {
                #     "id": records[i][0],
                #     "created": str(records[i][1]),
                #     "objectType": records[i][2],
                #     "ruleType": records[i][3],
                #     "fingerprint": records[i][4],
                #     "email": records[i][9],
                #     "ipAddress": records[i][5],
                #     "ipCountry": records[i][6],
                #     "metadataKey": records[i][7],
                #     "metadataValue": records[i][8],
                #     "userAgent": records[i][10],
                #     "acceptLanguage": records[i][11],
                #     # "rule":rule[i][9]
                #      }
                # results.append(result)
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
        