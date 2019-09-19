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
from enc_ import *
import hashlib
import base64



@jwtauth
class admin_payout(BaseHandler):
    def get(self):
        token = self.request.headers.get('Authorization')
        connection, cursor = db_connect()

        sql_select="SELECT * FROM payout"
        cursor.execute(sql_select)
        records = cursor.fetchall()
        if records:
                results = []
                for i in range(len(records)):
                    result = {
                        "id": records[i][0],
                        "created": str(records[i][1]),
                        "objectType": records[i][2],
                        "amount": str(records[i][3]),
                        "currency": records[i][4],
                        "status": records[i][5],
                        "payout_till": str(records[i][6]),
                        "merchant_id": records[i][7],
                        "fee": str(records[i][8]),
                    }
                    results.append(result)
                response = {"status": "success", "code": 200,
                            "data": results,
                            "data_length": len(records),
                            "message": ""}
                self.write(response)
                
        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "null",
                "message": "Id doen't exists",
            }
            raise tornado.web.Finish(response)


@jwtauth
class payout_response(BaseHandler):
    def post(self):
        response=self.get_argument('response')
        payout_id = self.get_argument('payout_id')
        connection, cursor = db_connect()


        if response.lower() =="pay":
            sql_select="SELECT * FROM payout WHERE payout_id= %s"
            cursor.execute(sql_select,(payout_id))
            records=cursor.fetchall()
            if records:

                sql_select="UPDATE payout SET status = 'paid' WHERE payout_id= %s"
                cursor.execute(sql_select,(payout_id))
                connection.commit()
                response = {"status": "success", "code": 200,
                            "data": "",
                            "message": "Paid succesfully"}
                self.write(response)

            else:
                response = {
                    "status": "error",
                    "code": 400,
                    "data": "null",
                    "message": "Payout Id doen't exists",
                }
                raise tornado.web.Finish(response)

        else:
            response = {
                "status": "error",
                "code": 400,
                "data": "null",
                "message": "Invalid Response",
            }
            raise tornado.web.Finish(response)