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

#print(type(created))
@jwtauth
class upload(BaseHandler):
    def post(self):
        file = remove_tag(self.get_argument('file'))
        purpose = remove_tag(self.get_argument('purpose'))

        if file and purpose:
            #print(file,purpose)

            connection, cursor = db_connect()

            type = os.path.splitext(file)[1]    #taking extension

            if type not in ['.jpg','.png','.pdf']:
                self.write("File type not supported")
            else:
                #print("type===",type)
                path = os.path.join('/home/techkopra1/Pictures/Screenshot.png')
                file = os.stat(path)
                size = file.st_size
                #print("filesize====",size)
                file_id = "file_" + str(uuid.uuid1())
                id = str(uuid.uuid1())


                sql_post = "INSERT INTO upload (file_id, created, objectType, purpose, size, type, url,merchant_id ) VALUES(%s,%s,%s,%s,%s,%s,%s,%s)"
                cursor.execute(sql_post,(str(file_id),float(created),"file_upload",str(purpose), size, type, "https://google.com","admin"))
                #print("DONE")
                connection.commit()


                sql_get = "SELECT * FROM upload WHERE file_id =cast(%s as char)"
                cursor.execute(sql_get,(file_id))
                result = cursor.fetchall()
                connection.commit()

                result={
                      "id" : result[0][0],
                      "created" : str(result[0][1]),
                      "objectType" : result[0][2],
                      "purpose" : result[0][3],
                      "size" : result[0][4],
                      "type" : result[0][5]
                    }

                response = {"status": "success","code": 200,
                            "data": result,
                            "message": "file uploaded successfully"}
                self.write(response)
        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "null",
                "message": "Bad Request",
            }
            raise tornado.web.Finish(response)

    def get(self):
        file_id = regex(remove_tag(self.get_argument('file_id')))

        if file_id:
            connection, cursor = db_connect()

            sql_get = "SELECT * FROM upload WHERE file_id =cast(%s as char)"
            cursor.execute(sql_get, (file_id))
            result = cursor.fetchall()
            connection.commit()

            result = {
                "id": result[0][0],
                "created": str(result[0][1]),
                "objectType": result[0][2],
                "purpose": result[0][3],
                "size": result[0][4],
                "type": result[0][5]
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
                "message": "Bad Request",
            }
            raise tornado.web.Finish(response)


@jwtauth
class list_file_upload(BaseHandler):
    def get(self):
        created = remove_tag(self.get_argument('created', False))
        operation = remove_tag(self.get_argument('operation', False))
        purpose = remove_tag(self.get_argument('purpose', False))
        limit = remove_tag(self.get_argument('limit', False))
        startingAfterId = regex(remove_tag(self.get_argument('startingAfterId', False)))
        endingBeforeId = regex(remove_tag(self.get_argument('endingBeforeId', False)))

        connection, cursor = db_connect()

        if limit == False:
            limit = 3
        elif int(limit)>100:
            limit=100

        if operation == "lt" or operation == "lte" or operation == "gt" or operation == "gte" and created and purpose==False:

            if operation == "lt":
                sql_select_Query = ("SELECT * FROM upload WHERE created < %s  ORDER BY created DESC LIMIT %s")
            elif operation == "lte":
                sql_select_Query = ("SELECT * FROM upload WHERE created <= %s ORDER BY created DESC LIMIT %s")
            elif operation == "gt":
                sql_select_Query = ("SELECT * FROM upload WHERE created > %s  ORDER BY created DESC LIMIT %s")
            elif operation == "gte":
                sql_select_Query = ("SELECT * FROM upload WHERE created <= %s ORDER BY created DESC LIMIT %s")

            cursor.execute(sql_select_Query, (float(created), int(limit)))
            records = cursor.fetchall()
        elif operation == "lt" or operation == "lte" or operation == "gt" or operation == "gte" and created and purpose:

            if operation == "lt":
                sql_select_Query = ("SELECT * FROM upload WHERE created < %s AND purpose=cast(%s as char) ORDER BY created DESC LIMIT %s")
            elif operation == "lte":
                sql_select_Query = ("SELECT * FROM upload WHERE created <= %s AND purpose=cast(%s as char) ORDER BY created DESC LIMIT %s")
            elif operation == "gt":
                sql_select_Query = ("SELECT * FROM upload WHERE created > %s AND purpose=cast(%s as char) ORDER BY created DESC LIMIT %s")
            elif operation == "gte":
                sql_select_Query = ("SELECT * FROM upload WHERE created <= %s AND purpose=cast(%s as char) ORDER BY created DESC LIMIT %s")

            cursor.execute(sql_select_Query, (float(created),str(purpose), int(limit)))
            records = cursor.fetchall()
            #print(records)
            connection.commit()
        len_records = len(records)
        limit = len(records)
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
                    data = {
                            "id": records[i][0],
                            "created": str(records[i][1]),
                            "objectType": records[i][2],
                            "purpose": records[i][3],
                            "size": records[i][4],
                            "type": records[i][5]
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

        if purpose and operation==False and created==False and startingAfterId==False and endingBeforeId==False:
            try:

                sql_select_Query = ("SELECT * FROM upload WHERE purpose = cast(%s as char) ORDER BY created DESC LIMIT %s ")
                cursor.execute(sql_select_Query, (purpose, int(limit)))
                records = cursor.fetchall()
                #print(records)
                result= []
                for i in range(len(records)):
                    data = {
                                "id": records[i][0],
                                "created": str(records[i][1]),
                                "objectType": records[i][2],
                                "purpose": records[i][3],
                                "size": records[i][4],
                                "type": records[i][5]
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
                    "message": "partnerId not exist",
                }
                raise tornado.web.Finish(response)

        if startingAfterId:

            sql_select_Query = ("SELECT created FROM upload WHERE file_id = cast(%s as char)")
            cursor.execute(sql_select_Query, (startingAfterId))
            record = cursor.fetchall()
            sql_select_Query = ("SELECT * FROM upload WHERE created>= %s ORDER BY created ASC LIMIT 10 ")
            cursor.execute(sql_select_Query, (record))
            records = cursor.fetchall()
            #print(records)
            results = []
            for i in range(len(records)):
                result ={
                                "id": records[i][0],
                                "created": str(records[i][1]),
                                "objectType": records[i][2],
                                "purpose": records[i][3],
                                "size": records[i][4],
                                "type": records[i][5]
                            }

                results.append(result)
            results = results[::-1]

            response = {"status": "success","code": 200,
                        "data": results,
                        "message": ""}
            self.write(response)

        if endingBeforeId:

            sql_select_Query = ("SELECT created FROM upload WHERE file_id = cast(%s as char)")
            cursor.execute(sql_select_Query, (endingBeforeId))
            record = cursor.fetchall()
            sql_select_Query = ("SELECT * FROM upload WHERE created<= %s ORDER BY created ASC LIMIT 10 ")
            cursor.execute(sql_select_Query, (record))
            records = cursor.fetchall()
            #print(records)
            results = []
            for i in range(len(records)):
                result = {
                                "id": records[i][0],
                                "created": str(records[i][1]),
                                "objectType": records[i][2],
                                "purpose": records[i][3],
                                "size": records[i][4],
                                "type": records[i][5]
                            }
                results.append(result)

            response = {"status": "success","code": 200,
                        "data": results,
                        "message": ""}
            self.write(response)
