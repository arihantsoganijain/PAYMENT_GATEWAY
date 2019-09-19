import tornado.web
import pymysql
import time
import uuid
import cc_brand
import json
import jwt
from remove_tags import *
import hashlib
from auth import *
from cross_origin import *
from db import *



@jwtauth
class token(BaseHandler):
    def post(self):
        number = remove_tag(self.get_argument('number'))
        exp_month = remove_tag(self.get_argument('exp_month'))
        exp_year = remove_tag(self.get_argument('exp_year'))

        cardholdername = remove_tag(self.get_argument('cardholdername'))
        addressLine1 = remove_tag(self.get_argument('addressLine1', False))
        addressLine2 = remove_tag(self.get_argument('addressLine2', False))
        addressCity = remove_tag(self.get_argument('addressCity', False))
        addressState = remove_tag(self.get_argument('addressState', False))
        addressZip = remove_tag(self.get_argument('addressZip', False))
        addressCountry = remove_tag(self.get_argument('addressCountry', False))
        ipAddress = remove_tag(self.get_argument('ipAddress', False))
        email = remove_tag(self.get_argument('email', False))
        userAgent = remove_tag(self.get_argument('userAgent', False))
        acceptLanguage = remove_tag(self.get_argument('acceptLanguage', False))

        brand = cc_brand.cc_brand(number)
        connection, cursor = db_connect()

        used = 1
        #print(brand)
        type_ = "debit"
        ipCountry = "india"
        D_currency = "currency"
        D_enrolled = int(1)
        D_liabilityShift = "liability shift"

        created = time.time()
        #print(created)
        objectType = "token"
        fingereprint = hashlib.sha224(number.encode()).hexdigest()
        token_id = "tok_" + str(uuid.uuid1())
        card_id = "card_" + str(uuid.uuid1())

        Insert_token = (
            "INSERT INTO token(id ,created ,objectType ,first6 ,last4 ,fingerprint ,expMonth ,expYear ,brand  ,type ,cardholderName ,addressLine1  ,addressLine2 , addressCity , addressState ,addressZip , addressCountry , used , card_id ,ipAddress, ipCountry,email ,userAgent ,acceptLanguage ,3D_currency, 3D_enrolled , 3D_liabilityShift,merchant_id) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
        cursor.execute(Insert_token, (str(token_id), created, str(objectType)
                                      , int(number[:5]), int(number[-4:]),
                                      str(fingereprint)
                                      , int(exp_month), int(exp_year), str(brand), str(type_),
                                      str(cardholdername)
                                      , str(addressLine1),
                                      str(addressLine2), str(addressCity)
                                      , str(addressState), int(addressZip), str(addressCountry), str(used),
                                      str(card_id), str(ipAddress), str(ipCountry), str(email)
                                      , str(userAgent), str(acceptLanguage), D_currency, int(D_enrolled),
                                      D_liabilityShift,"admin"))

        connection.commit()
        sql_select_Query = ("SELECT * FROM token WHERE  id = cast(%s as char)")
        cursor.execute(sql_select_Query, (token_id,))
        record = cursor.fetchall()
        connection.commit()
        #print("======",record)

        result = {
            "id": record[0][0],
            "created": str(record[0][1]),
            "objectType": record[0][2],
            "first6": record[0][3],
            "last4": record[0][4],
            "fingerprint": record[0][5],
            "expMonth": record[0][6],
            "expYear": record[0][7],
            "cardholderName": record[0][10],
            "brand": record[0][8],
            "type": record[0][9],
            "country": record[0][16],
            "used": record[0][17]
        }
        response = {"status": "success","code": 200,
                    "data":result,
                    "message": "token created successfully"}
        self.write(response)
        
        
    def get(self):
        tokenId = regex(remove_tag(self.get_argument('tokenId')))
        connection, cursor = db_connect()
        sql_select_Query = "SELECT * FROM token WHERE id=cast(%s as char)"

        cursor.execute(sql_select_Query, (tokenId,))
        records = cursor.fetchall()
        if records:
            result = {
                "id": records[0][0],
                "created": str(records[0][1]),
                "objectType": records[0][2],
                "first6": records[0][3],
                "last4": records[0][4],
                "fingerprint": records[0][5],
                "expMonth": records[0][6],
                "expYear": records[0][7],
                "cardholderName": records[0][8],
                "brand": records[0][9],
                "type": records[0][10],
                "country": records[0][11],
                "used": records[0][12]
            }
            response = {"status": "success","code": 200,
                        "data":result,
                        "message": ""}
            self.write(response)
        else:
            response = {
                "status": "error",
                "code": 404,
                "data": "null",
                "message": "Wrong Token id",
            }
            raise tornado.web.Finish(response)
