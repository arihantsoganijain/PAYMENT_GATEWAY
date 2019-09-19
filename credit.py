import tornado.web
import tornado
import tornado.ioloop
import uuid
import time
import pymysql
import os
import json
from remove_tags import *
from auth import *
from cross_origin import *
from db import *

created = time.time()

##print(type(created))
@jwtauth
class credit(BaseHandler):
    def post(self):
        amount = remove_tag(self.get_argument('amount'))
        currency = remove_tag(self.get_argument('currency'))
        description = remove_tag(self.get_argument('description',False))
        customerId = remove_tag(self.get_argument('customerId',False))
        card = remove_tag(self.get_argument('card',False))
        metadata = remove_tag(self.get_argument('metadata',False))

        customer_check=customerId
        customerId=regex(customerId)
        card_check = card
        card = regex(card)
        ###print("-----",card)

        if customer_check==customerId and card_check==card:
            if amount and currency:
                credit_id = 'credit_' + str(uuid.uuid1())

                if customerId or card:
                    connection, cursor = db_connect()
                    customer_records=0
                    card_records=0
                    ###print("===========",customerId)
                    if customerId:
                        sql_select_Query = "SELECT id FROM customers WHERE id =cast(%s as char) "

                        cursor.execute(sql_select_Query, (customerId,))
                        customer_records = cursor.fetchall()
                        ##print("customer_records", customer_records)
                    else:
                        response = {
                            "status": "error",
                            "code": 404,
                            "data": "null",
                            "message": "customer id does not exist",
                        }
                        raise tornado.web.Finish(response)

                    if card:
                        if card[0:4] == "tok_":

                            sql_select_Query = "SELECT id FROM token WHERE id=cast(%s as char) "

                            cursor.execute(sql_select_Query, (card,))
                            card_records = cursor.fetchall()
                            ##print("card_records",card_records)

                        elif card[0:5] == "card_":

                            sql_select_Query = "SELECT card_id FROM cards WHERE card_id=cast(%s as char) "

                            cursor.execute(sql_select_Query, (card,))
                            card_records = cursor.fetchall()
                            ##print("card_records", card_records)
                        else:
                            response = {
                                "status": "error",
                                "code": 404,
                                "data": "null",
                                "message": "card does not exist",
                            }
                            raise tornado.web.Finish(response)

                    if card_records and customer_records:
                        sql_credit = "INSERT INTO credit(credit_id, created, objectType, amount, currency, card_Id, description, customer_Id, metadata, 3D_amount, 3D_currency, 3D_enrolled , 3D_liabilityShift, failureCode, failureMessage,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                        cursor.execute(sql_credit, (str(credit_id), float(created), "credit", int(amount),
                                                    str(currency), card_records[0][0], str(description), customer_records[0][0], metadata, 0, "null",
                                                    0, "null", "null", "null","admin"))
                        connection.commit()

                    elif  customer_records and (card_records==0 or card_records==None):
                        sql_credit = "INSERT INTO credit(credit_id, created, objectType, amount, currency, card_Id, description, customer_Id, metadata, 3D_amount, 3D_currency, 3D_enrolled , 3D_liabilityShift, failureCode, failureMessage,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                        cursor.execute(sql_credit, (str(credit_id), float(created), "credit", int(amount),
                                                    str(currency), "null", str(description), customer_records[0][0], metadata, 0, "null",
                                                    0, "null", "null", "null","admin"))
                        connection.commit()
                    elif card_records and (customer_records==0 or customer_records==None):
                        sql_credit = "INSERT INTO credit(credit_id, created, objectType, amount, currency, card_Id, description, customer_Id, metadata, 3D_amount, 3D_currency, 3D_enrolled , 3D_liabilityShift, failureCode, failureMessage,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                        cursor.execute(sql_credit, (str(credit_id), float(created), "credit", int(amount),
                                                    str(currency), card_records[0][0], str(description), "null", metadata, 0, "null",
                                                    0, "null", "null", "null","admin"))
                        connection.commit()
                    else:
                        response = {
                            "status": "error",
                            "code": 404,
                            "data": "null",
                            "message": "something went wrong",
                        }
                        raise tornado.web.Finish(response)
                    sql_query ="SELECT * FROM credit INNER JOIN cards ON (credit.card_Id = cards.card_id) OR (credit.customer_Id = cards.customerId) WHERE credit.credit_id =cast(%s as char)"
                    cursor.execute(sql_query, (credit_id))
                    record = cursor.fetchall()
                    ##print(record)
                    if record:
                        result = {
                            "id": record[0][0],
                            "created":  str(record[0][1]),
                            "objectType": record[0][2],
                            "amount": record[0][3],
                            "currency": record[0][4],
                            "description": record[0][6],
                            "card": {
                                "id": record[0][16],
                                "created": str(record[0][17]),
                                "objectType": record[0][18],
                                "first6": record[0][19],
                                "last4": record[0][20],
                                "fingerprint": record[0][21],
                                "expMonth": record[0][22],
                                "expYear": record[0][23],
                                "cardholderName": record[0][24],
                                "customerId": record[0][25],
                                "brand": record[0][26],
                                "type": record[0][27],
                                "country": record[0][28]
                            },
                            "customerId": record[0][7],
                            "metadata": record[0][8]
                        }
                        response = {"status": "success","code": 200,
                                    "data": result,
                                    "message": "credit created successfully"}
                        self.write(response)
                    elif record == ():
                        sql_query = "SELECT * FROM credit WHERE credit_id = cast(%s as char)"
                        cursor.execute(sql_query, (credit_id))
                        record = cursor.fetchall()
                        if record:
                            result = {
                                "id": record[0][0],
                                "created":  str(record[0][1]),
                                "objectType": record[0][2],
                                "amount": record[0][3],
                                "currency": record[0][4],
                                "description": record[0][6],
                                "card": record[0][5],
                                "customerId": record[0][7],
                                "metadata": record[0][8]
                            }
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
                    else:
                        response = {
                            "status": "error",
                            "code": 400,
                            "data": "null",
                            "message": "Bad request",
                        }
                        raise tornado.web.Finish(response)
                else:
                    response = {
                        "status": "error",
                        "code": 404,
                        "data": "null",
                        "message": "either customerId or card is required",
                    }
                    self.write(response)
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
                "message": "Wrong values are Given",
            }
            raise tornado.web.Finish(response)


    def get(self):
        credit_id = regex(remove_tag(self.get_argument('credit_id')))

        if credit_id:
            connection, cursor = db_connect()
            sql_query = "SELECT * FROM credit INNER JOIN cards ON (credit.card_Id = cards.card_id) OR (credit.customer_Id = cards.customerId) WHERE credit.credit_id =cast(%s as char)"
            cursor.execute(sql_query, (credit_id))
            record = cursor.fetchall()
            ##print(record)
            if record:
                result = {
                    "id": record[0][0],
                    "created":  str(record[0][1]),
                    "objectType": record[0][2],
                    "amount": record[0][3],
                    "currency": record[0][4],
                    "description": record[0][6],
                    "card": {
                        "id": record[0][16],
                        "created": str(record[0][17]),
                        "objectType": record[0][18],
                        "first6": record[0][19],
                        "last4": record[0][20],
                        "fingerprint": record[0][21],
                        "expMonth": record[0][22],
                        "expYear": record[0][23],
                        "cardholderName": record[0][24],
                        "customerId": record[0][25],
                        "brand": record[0][26],
                        "type": record[0][27],
                        "country": record[0][28]
                    },
                    "customerId": record[0][7],
                    "metadata": record[0][8]
                }
                response = {"status": "success","code": 200,
                            "data": result,
                            "message": ""}
                self.write(response)
            elif record == ():
                sql_query = "SELECT * FROM credit WHERE credit_id =cast(%s as char)"
                cursor.execute(sql_query, (credit_id))
                record = cursor.fetchall()
                if record:
                    result = {
                        "id": record[0][0],
                        "created": str(record[0][1]),
                        "objectType": record[0][2],
                        "amount": record[0][3],
                        "currency": record[0][4],
                        "description": record[0][6],
                        "card": record[0][5],
                        "customerId": record[0][7],
                        "metadata": record[0][8]
                    }
                    response = {"status": "success","code": 200,
                                "data": result,
                                "message": ""}
                    raise tornado.web.Finish(response)
                else:
                    response = {
                        "status": "error",
                        "code": 400,
                        "data": "null",
                        "message": "Bad request",
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

        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "null",
                "message": "Bad request",
            }
            raise tornado.web.Finish(response)

@jwtauth
class credit_update(BaseHandler):
    def post(self):
        credit_id = regex(remove_tag(self.get_argument('credit_id')))
        customer_id = regex(remove_tag(self.get_argument('customer_id',False)))
        description = remove_tag(self.get_argument('description',False))
        metadata = remove_tag(self.get_argument('metadata',False))

        if credit_id:

            connection, cursor = db_connect()
            sql_select = "SELECT customer_Id FROM credit WHERE credit_id =cast(%s as char)"
            cursor.execute(sql_select,(credit_id))
            result = cursor.fetchall()
            if customer_id:
                if result[0][0] == '0':
                    ##print("jhgjhg")
                    sql_update = "UPDATE credit SET customer_Id = %s WHERE credit_id =cast(%s as char)"
                    cursor.execute(sql_update,(customer_id, credit_id))
                    ##print("asdadadadad")
                    connection.commit()
                else:
                    response = {
                        "status": "error",
                        "code": 401,
                        "data": "null",
                        "message": "Cannot Updated",
                    }
                    raise tornado.web.Finish(response)

            if description:
                sql_update = "UPDATE credit SET description = %s WHERE credit_id = cast(%s as char)"
                cursor.execute(sql_update,(description, credit_id))
                connection.commit()

            if metadata:
                sql_update = "UPDATE credit SET metadata = %s WHERE credit_id = cast(%s as char)"
                cursor.execute(sql_update, (metadata, credit_id))
                connection.commit()

            sql_query = "SELECT * FROM credit INNER JOIN cards ON (credit.card_Id = cards.card_id) OR (credit.customer_Id = cards.customerId) WHERE credit.credit_id = cast(%s as char)"
            cursor.execute(sql_query, (credit_id))
            record = cursor.fetchall()
            ##print(record)
            if record:
                result = {
                    "id": record[0][0],
                    "created": str(record[0][1]),
                    "objectType": record[0][2],
                    "amount": record[0][3],
                    "currency": record[0][4],
                    "description": record[0][6],
                    "card": {
                        "id": record[0][16],
                        "created": str(record[0][17]),
                        "objectType": record[0][18],
                        "first6": record[0][19],
                        "last4": record[0][20],
                        "fingerprint": record[0][21],
                        "expMonth": record[0][22],
                        "expYear": record[0][23],
                        "cardholderName": record[0][24],
                        "customerId": record[0][25],
                        "brand": record[0][26],
                        "type": record[0][27],
                        "country": record[0][28]
                    },
                    "customerId": record[0][7],
                    "metadata": record[0][8]
                }
                response = {"status": "success","code": 200,
                            "data": result,
                            "message": "credit update successfully"}
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
class list_credit(BaseHandler):
    def get(self):
        created = self.get_argument('created', False)
        operation = self.get_argument('operation', False)
        customerId = self.get_argument('customerId', False)
        limit = self.get_argument('limit', False)
        startingAfterId = self.get_argument('startingAfterId', False)
        endingBeforeId = self.get_argument('endingBeforeId', False)

        connection, cursor = db_connect()

        if limit == False:
            limit = 10
        elif int(limit) > 100:
            limit = 100

        if operation == "lt" or operation == "lte" or operation == "gt" or operation == "gte" and created and customerId == 0:

            if operation == "lt":
                sql_select_Query = ("SELECT * FROM credit WHERE created < %s  ORDER BY created DESC LIMIT %s")
            elif operation == "lte":
                sql_select_Query = ("SELECT * FROM credit WHERE created <= %s ORDER BY created DESC LIMIT %s")
            elif operation == "gt":
                sql_select_Query = ("SELECT * FROM credit WHERE created > %s  ORDER BY created DESC LIMIT %s")
            elif operation == "gte":
                sql_select_Query = ("SELECT * FROM credit WHERE created <= %s ORDER BY created DESC LIMIT %s")
            cursor.execute(sql_select_Query, (float(created), int(limit)))
            records = cursor.fetchall()
            ##print(records)
            connection.commit()
            len_records = len(records)
            limit = len(records)

            if len(records) == int(limit):

                result = []
                for i in range(int(limit)):
                    if records[i] != ():
                        data = {
                            "id": records[i][0],
                            "created":str(records[i][1]),
                            "objectType": records[i][2],
                            "amount": records[i][3],
                            "currency": records[i][4],
                            "description": records[i][6],
                            "card": records[i][5],
                            "customerId": records[i][7]
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
        if operation == "lt" or operation == "lte" or operation == "gt" or operation == "gte" and created and customerId:
            if operation == "lt":
                sql_select_Query = (
                    "SELECT * FROM credit WHERE created < %s AND customerId=%s ORDER BY created DESC LIMIT %s")
            elif operation == "lte":
                sql_select_Query = (
                    "SELECT * FROM credit WHERE created <= %s AND customerId=%s ORDER BY created DESC LIMIT %s")
            elif operation == "gt":
                sql_select_Query = (
                    "SELECT * FROM credit WHERE created > %s AND customerId=%s ORDER BY created DESC LIMIT %s")
            elif operation == "gte":
                sql_select_Query = (
                    "SELECT * FROM credit WHERE created <= %s AND customerId=%s ORDER BY created DESC LIMIT %s")

            cursor.execute(sql_select_Query, (float(created), str(customerId), int(limit)))
            records = cursor.fetchall()
            ##print(records)
            connection.commit()
            if len(records) == int(limit):

                result = []
                for i in range(int(limit)):
                    if records[i] != ():
                        data = {
                            "id": records[i][0],
                            "created": str(records[i][1]),
                            "objectType": records[i][2],
                            "amount": records[i][3],
                            "currency": records[i][4],
                            "description": records[i][6],
                            "card": records[i][5],
                            "customerId": records[i][7]
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

        if customerId and operation == 0 and created == 0 and startingAfterId == 0 and endingBeforeId == 0:
            try:
                sql_select_Query = ("SELECT * FROM credit WHERE customerId =cast(%s as char) ORDER BY created DESC LIMIT %s ")
                cursor.execute(sql_select_Query, (customerId, int(limit)))
                records = cursor.fetchall()
                ##print(records)
                result = []
                for i in range(len(records)):
                    data = {
                        "id": records[i][0],
                        "created": str(records[i][1]),
                        "objectType": records[i][2],
                        "amount": records[i][3],
                        "currency": records[i][4],
                        "description": records[i][6],
                        "card": records[i][5],
                        "customerId": records[i][7]
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
                    "message": "partnerId not exists",
                }
                raise tornado.web.Finish(response)

        if startingAfterId:
            sql_select_Query = ("SELECT created FROM credit WHERE sub_id =cast(%s as char)")
            cursor.execute(sql_select_Query, (startingAfterId))
            record = cursor.fetchall()
            sql_select_Query = ("SELECT * FROM credit WHERE created>= %s ORDER BY created ASC LIMIT 10 ")
            cursor.execute(sql_select_Query, (record))
            records = cursor.fetchall()
            ##print(records)
            results = []
            for i in range(len(records)):
                result = {
                    "id": records[i][0],
                    "created": str(records[i][1]),
                    "objectType": records[i][2],
                    "amount": records[i][3],
                    "currency": records[i][4],
                    "description": records[i][6],
                    "card": records[i][5],
                    "customerId": records[i][7]
                }
                results.append(result)
            results = results[::-1]

            response = {"status": "success","code": 200,
                        "data": results,
                        "message": ""}
            self.write(response)

        if endingBeforeId:

            sql_select_Query = ("SELECT created FROM credit WHERE sub_id = cast(%s as char)")
            cursor.execute(sql_select_Query, (endingBeforeId))
            record = cursor.fetchall()
            sql_select_Query = ("SELECT * FROM credit WHERE created<= %s ORDER BY created ASC LIMIT 10 ")
            cursor.execute(sql_select_Query, (record))
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
                    "description": records[i][6],
                    "card": records[i][5],
                    "customerId": records[i][7]
                }
                results.append(result)

            response = {"status": "success","code": 200,
                        "data": result,
                        "message": ""}
            self.write(response)
