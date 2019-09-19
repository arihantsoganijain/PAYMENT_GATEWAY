import tornado.web
import time
import uuid
import pymysql
import json
from remove_tags import *
from auth import *
from cross_origin import *
from db import *
import os
import random
import string
import pybase64



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


def randomString(stringLength):
    """Generate a random string of fixed length """
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(stringLength))

@jwtauth
class CrossSale(BaseHandler1):
    def post(self):
        amount = remove_tag(self.get_argument('amount', False))
        currency = remove_tag(self.get_argument('currency', False))
        capture = remove_tag(self.get_argument('capture', False))
        planId = regex(remove_tag(self.get_argument('planId', False)))
        captureCharges = remove_tag(self.get_argument('captureCharges', False))
        template = remove_tag(self.get_argument('template'))
        title = remove_tag(self.get_argument('title'))
        description = remove_tag(self.get_argument('description', False))
        imageData = self.get_argument('imageData', False)
        companyName = remove_tag(self.get_argument('companyName'))
        companyLocation = remove_tag(self.get_argument('companyLocation'))
        termsAndConditionsUrl = remove_tag(self.get_argument('termsAndConditionsUrl'))
        visibleForAllPartners = remove_tag(self.get_argument('visibleForAllPartners', False))
        visibleForPartnerIds = remove_tag(self.get_argument('visibleForPartnerIds', False))
        metadata = remove_tag(self.get_argument('metadata', False))
        partnerId = remove_tag(self.get_argument('partnerId', False))

        # if imageData:
        #     image=imageData[0]["filename"]
        # else:
        #     image="null"



        if template and title and companyName and companyLocation and termsAndConditionsUrl:


            connection,cursor=db_connect()

            id = "cso_" + str(uuid.uuid1())
            if amount and currency:
                # if imageData:
                #     filename=randomString(8)
                #     file_extension = '.jpeg'
                #     #print("-----------------------===", filename,file_extension)
                #     filee=str(filename) + str(file_extension)
                #     upload_path = os.path.join(os.path.dirname(__file__), 'static/crossimage/')
                #     file_path = os.path.join(upload_path, filee)
                #     with open(file_path, 'wb') as up:
                #         up.write(pybase64.b64decode(imageData))
                    # filee = str(str(myfilename)+str(file_extension))
                    # upload_path = os.path.join(os.path.dirname(__file__), 'crossimage/')
                    # # if not imageData:
                    # #     ret = 'Invalid Args'
                    # #     result1 = json.dumps(ret)
                    # #     #print(ret)
                    # #     self.render("contact.html", result1=result1)
                    # myfilename = randomString(8)

                    # for meta in imageData:
                    #     if meta['content_type'] in ['image/jpeg', 'image/png', 'image/gif']:
                    #         filename, file_extension = os.path.splitext(meta['filename'])
                    #         #print("-----------------------===", filename)
                    #         file_path = os.path.join(upload_path, str(myfilename) + str(file_extension))
                    #         with open(file_path, 'wb') as up:
                    #             up.write(meta['body'])
                        # else:
                        #     response = {
                        #         "status": "error",
                        #         "code": 404,
                        #         "data": "null",
                        #         "message": "File type is not supported",
                        #     }
                        #     raise tornado.web.Finish(response)
                if imageData:
                    filename=randomString(8)
                    file_extension = '.jpeg'
                    #print("-----------------------===", filename,file_extension)
                    filee=str(filename) + str(file_extension)
                    upload_path = os.path.join(os.path.dirname(__file__), 'static/crossimage/')
                    file_path = os.path.join(upload_path, filee)
                    with open(file_path, 'wb') as up:
                        up.write(pybase64.b64decode(imageData))
                
                else:
                    filee = ""
                sql_insert = "INSERT INTO CrossSaleOffer(cso_id , created , objectType , charge_amount , charge_currency ,charge_capture,template , title , description , imageUrl, companyName , companyLocation , termsAndConditionsUrl , partnerId , visibleForAllPartners , visibleForPartnerId , metadata ,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s) "
                cursor.execute(sql_insert,(str(id), float(time.time()), "CrossSaleOffer", float(amount),str(currency),int(capture),str(template),str(title), str(description) ,filee , str(companyName) , str(companyLocation) , str(termsAndConditionsUrl) , str(partnerId) , int(visibleForAllPartners) , str(visibleForPartnerIds) , str(metadata),"admin"))
                connection.commit()

                sql_select = "SELECT * FROM CrossSaleOffer WHERE cso_id=cast(%s as char)"
                cursor.execute(sql_select,(id))
                record = cursor.fetchall()
                ##print("---------",record)

                result ={
                          "id" :record[0][0] ,
                          "created" : str(record[0][1]),
                          "objectType" : record[0][2],
                          "charge" : {
                            "amount" : record[0][3],
                            "currency" : record[0][4],
                            "capture" : record[0][5],
                          },
                          "template" : record[0][8],
                          "title" : record[0][9],
                          "description" : record[0][10],
                          "imageUrl" : record[0][11],
                          "companyName" : record[0][12],
                          "companyLocation" : record[0][13],
                          "termsAndConditionsUrl" : record[0][14],
                          "visibleForAllPartners" : record[0][16],
                        }
                type_event = "CROSS_SALE_OFFER_CREATED"
                id = "event_" + str(uuid.uuid1())
                data = "char_" + str(uuid.uuid1())
                log = "log_" + str(uuid.uuid1())
                created = time.time()


                url = "/api/v1/crosssale/create"
                platform = self.request.headers.get('platform')
                ipaddress = self.request.headers.get('ipaddress')

                request_body= {"amount":amount,"currency":currency,"capture":capture,"planId":planId,"captureCharges":captureCharges,
                "template":template,"title":title,"description":description,"imageData":filee,"companyName":companyName,
                "companyLocation":companyLocation,"termsAndConditionsUrl":termsAndConditionsUrl,"visibleForAllPartners":visibleForAllPartners,
                "visibleForPartnerIds":visibleForPartnerIds,"metadata":metadata,"partnerId":partnerId}

                Insert_log = (
                    "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_log, (str(log), float(created), "post", url, int(200), str(ipaddress), str(platform), str(request_body), str(result),"admin"))


                Insert_event = (
                    "INSERT INTO event(event_id ,created ,objectType ,type ,data ,log,com_id,customer_id,merchant_id ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_event, (id, created, "event", type_event, data, log,result["id"],"admin","admin"))

                Insert_data = (
                    "INSERT INTO data(data_id ,created ,objectType ,amount ,currency ,description,captured ,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_data, (data, created, "crosssale create", float(amount), currency, description, int(record[0][5]),"admin"))
                connection.commit()

                response = {"status": "success","code": 200,
                            "data": result,
                            "message": "crosssale created successfully"}
                self.write(response)
            elif planId :
                if imageData:
                    filename=randomString(8)
                    file_extension = '.jpeg'
                    #print("-----------------------===", filename,file_extension)
                    filee=str(filename) + str(file_extension)
                    upload_path = os.path.join(os.path.dirname(__file__), 'static/crossimage/')
                    file_path = os.path.join(upload_path, filee)
                    with open(file_path, 'wb') as up:
                        up.write(pybase64.b64decode(imageData))
                    
                else:
                    filee = ""
                sql_insert = "INSERT INTO CrossSaleOffer(cso_id , created , objectType , subscription_planId ,subscription_captureCharges,template , title , description , imageUrl, companyName , companyLocation , termsAndConditionsUrl , partnerId , visibleForAllPartners , visibleForPartnerId , metadata, merchant_id ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s) "
                cursor.execute(sql_insert,(str(id), float(time.time()), "CrossSaleOffer", str(planId),int(captureCharges),str(template),str(title), str(description) ,filee , str(companyName) , str(companyLocation) , str(termsAndConditionsUrl) , str(partnerId) , int(visibleForAllPartners) , str(visibleForPartnerIds) , str(metadata),"admin"))
                connection.commit()

                sql_select = "SELECT * FROM CrossSaleOffer WHERE cso_id=cast(%s as char)"
                cursor.execute(sql_select,(id))
                record = cursor.fetchall()

                result ={
                          "id" :record[0][0] ,
                          "created" : str(record[0][1]),
                          "objectType" : record[0][2],
                          "subscription" : {
                            "planId" : record[0][6],
                            "captureCharges" : record[0][7],
                          },
                          "template" : record[0][8],
                          "title" : record[0][9],
                          "description" : record[0][10],
                          "imageUrl" : record[0][11],
                          "companyName" : record[0][12],
                          "companyLocation" : record[0][13],
                          "termsAndConditionsUrl" : record[0][14],
                          "visibleForAllPartners" : record[0][16],
                        }
                type_event = "CROSS_SALE_OFFER_CREATED"
                id = "event_" + str(uuid.uuid1())
                data = "char_" + str(uuid.uuid1())
                log = "log_" + str(uuid.uuid1())
                created = time.time()

                url = "/api/v1/crosssale/create"
                platform = self.request.headers.get('platform')
                ipaddress = self.request.headers.get('ipaddress')

                request_body = {"amount": amount, "currency": currency, "capture": capture, "planId": planId,
                                "captureCharges": captureCharges,
                                "template": template, "title": title, "description": description,
                                "imageData": filee, "companyName": companyName,
                                "companyLocation": companyLocation, "termsAndConditionsUrl": termsAndConditionsUrl,
                                "visibleForAllPartners": visibleForAllPartners,
                                "visibleForPartnerIds": visibleForPartnerIds, "metadata": metadata,
                                "partnerId": partnerId}

                Insert_log = (
                    "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_log, (
                str(log), float(created), "post", url, int(200), str(ipaddress), str(platform),
                str(request_body), str(result), "admin"))

                Insert_event = (
                    "INSERT INTO event(event_id ,created ,objectType ,type ,data ,log ,com_id,customer_id,merchant_id ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_event, (id, created, "event", type_event, data, log,result["id"],"admin","admin"))

                Insert_data = (
                    "INSERT INTO data(data_id ,created ,objectType ,description  ,captured,merchant_id ) VALUES (%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_data, ( data, created, "crosssale create",  description, int(record[0][7]),"admin"))
                connection.commit()

                response = {"status": "success","code": 200,
                            "data": result,
                            "message": "crosssale created successfully"}
                self.write(response)

            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "null",
                    "message": "Not enough argument given",
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
        crossSaleOfferId = remove_tag(self.get_argument('crossSaleOfferId'))

        if crossSaleOfferId:

            connection, cursor = db_connect()
            sql_select = "SELECT * FROM CrossSaleOffer WHERE cso_id=cast(%s as char)"
            cursor.execute(sql_select, (crossSaleOfferId))
            record = cursor.fetchall()

            if record:
                if record[0][3]:
                    result = {
                        "id": record[0][0],
                        "created": str(record[0][1]),
                        "objectType": record[0][2],
                        "charge": {
                            "amount": record[0][3],
                            "currency": record[0][4],
                            "capture": record[0][5],
                        },
                        "template": record[0][8],
                        "title": record[0][9],
                        "description": record[0][10],
                        "imageUrl": record[0][11],
                        "companyName": record[0][12],
                        "companyLocation": record[0][13],
                        "termsAndConditionsUrl": record[0][14],
                        "visibleForAllPartners": record[0][16],
                    }
                    response = {"status": "success","code": 200,
                                "data": result,
                                "message": ""}
                    self.write(response)
                else:
                    result = {
                        "id": record[0][0],
                        "created": str(record[0][1]),
                        "objectType": record[0][2],
                        "subscription": {
                            "planId": record[0][6],
                            "captureCharges": record[0][7],
                        },
                        "template": record[0][8],
                        "title": record[0][9],
                        "description": record[0][10],
                        "imageUrl": record[0][11],
                        "companyName": record[0][12],
                        "companyLocation": record[0][13],
                        "termsAndConditionsUrl": record[0][14],
                        "visibleForAllPartners": record[0][16],
                    }
                    response = {"status": "success","code": 200,
                                "data": result,
                                "message": ""}
                    self.write(response)
            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "null",
                    "message": "crossSaleOfferId not exists",
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
class delete_crosssale(BaseHandler):


    def post(self):
        crossSaleOfferId = regex(remove_tag(self.get_argument('crossSaleOfferId')))
        ###print("-----",crossSaleOfferId)
        if crossSaleOfferId:

            connection, cursor = db_connect()
            sql_get = "SELECT * FROM CrossSaleOffer WHERE cso_id=cast(%s as char)"
            cursor.execute(sql_get, (crossSaleOfferId))
            records = cursor.fetchall()
            #print("**************",records)
            record=[]
            if records[0][4]==None:
                charge_currency=""
            else:
                charge_currency=records[0][4]
            
            if records:
                sql_insert = "INSERT INTO deleted_CrossSaleOffer(cso_id, created, objectType, charge_amount, charge_currency,charge_capture, subscription_planId,subscription_captureCharges, template, title, description, imageUrl, companyName, companyLocation, termsAndConditionsUrl, partnerId, visibleForAllPartners, visibleForPartnerId, metadata,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s) "
                cursor.execute(sql_insert, (
                str(records[0][0]), records[0][1], str(records[0][2]), records[0][3], str(charge_currency), records[0][5], str(records[0][6]),
                records[0][7], str(records[0][8]), str(records[0][9]), str(records[0][10]), str(records[0][11]),
                str(records[0][12]), str(records[0][13]), str(records[0][14]), str(records[0][15]),
                str(records[0][16]),str(records[0][17]),str(records[0][18]),"admin"))
                connection.commit()




                sql_select = "DELETE FROM CrossSaleOffer WHERE cso_id=cast(%s as char)"
                cursor.execute(sql_select, (crossSaleOfferId))
                connection.commit()


                result = {
                        "id": records[0][0],
                         }
                response = {"status": "success","code": 200,
                            "data": result,
                            "message": "crosssale deleted successfully"}
                self.write(response)

                type_event = "CROSS_SALE_OFFER_DELETED"
                id = "event_" + str(uuid.uuid1())
                data = "char_" + str(uuid.uuid1())
                log = "log_" + str(uuid.uuid1())
                created = time.time()

                url = "/api/v1/crosssale/delete"
                platform = self.request.headers.get('platform')
                ipaddress = self.request.headers.get('ipaddress')

                request_body= {"crossSaleOfferId":crossSaleOfferId}

                Insert_log = (
                    "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_log, (str(log), float(created), "post", url, int(200), str(ipaddress), str(platform), str(request_body), str(result),"admin"))


                Insert_event = (
                    "INSERT INTO event(event_id ,created ,objectType ,type ,data ,log,com_id,customer_id,merchant_id  ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_event, (id, created, "event", type_event, data, log,result["id"],"admin","admin"))

                Insert_data = (
                    "INSERT INTO data(data_id ,created ,objectType ,amount ,currency,merchant_id  ) VALUES (%s,%s,%s,%s,%s,%s)")
                cursor.execute(Insert_data, (data, created, "CrossSaleOfferDeleted", records[0][3],str(charge_currency),"admin"))
                connection.commit()

            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "null",
                    "message": "CrossSaleId doesn't exists",
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
class CrossSaleUpdate(BaseHandler):
    def post(self):
        crossSaleOfferId = regex(remove_tag(self.get_argument('crossSaleOfferId')))
        amount = remove_tag(self.get_argument('amount', False))
        currency = remove_tag(self.get_argument('currency', False))
        capture = remove_tag(self.get_argument('capture', False))
        planId = regex(remove_tag(self.get_argument('planId', False)))
        captureCharges = remove_tag(self.get_argument('captureCharges', False))
        template = remove_tag(self.get_argument('template',False))
        title = remove_tag(self.get_argument('title',False))
        description = remove_tag(self.get_argument('description', False))
        imageData =remove_tag( self.get_argument('imageData', False))
        companyName = remove_tag(self.get_argument('companyName',False))
        companyLocation = remove_tag(self.get_argument('companyLocation',False))
        termsAndConditionsUrl = remove_tag(self.get_argument('termsAndConditionsUrl',False))
        visibleForAllPartners = remove_tag(self.get_argument('visibleForAllPartners', False))
        visibleForPartnerIds = remove_tag(self.get_argument('visibleForPartnerIds', False))
        metadata = remove_tag(self.get_argument('metadata', False))
        partnerId = remove_tag(self.get_argument('partnerId', False))

        if crossSaleOfferId:

            connection, cursor = db_connect()

            sql_get = "SELECT cso_id FROM CrossSaleOffer WHERE cso_id=cast(%s as char)"
            cursor.execute(sql_get, (crossSaleOfferId))
            record = cursor.fetchall()
            if record:
                if amount and currency:
                    if capture:
                        sql_update = "UPDATE CrossSaleOffer SET charge_amount =%s , charge_currency =%s , charge_capture =%s, subscription_planId='', subscription_captureCharges=0 WHERE cso_id=cast(%s as char) "
                        cursor.execute(sql_update,(float(amount),currency,capture,crossSaleOfferId))
                        connection.commit()
                    else:

                        sql_update = "UPDATE CrossSaleOffer SET charge_amount =%s , charge_currency =%s,charge_capture =%s, subscription_planId='', subscription_captureCharges=0  WHERE cso_id=cast(%s as char)"
                        cursor.execute(sql_update, (float(amount), currency, crossSaleOfferId))
                        connection.commit()


                elif planId:
                    if captureCharges:
                        sql_update = "UPDATE CrossSaleOffer SET subscription_planId =%s , subscription_captureCharges =%s, charge_capture=0,charge_amount=0,charge_currency=''  WHERE cso_id=%s "
                        cursor.execute(sql_update,(planId,captureCharges,crossSaleOfferId))
                        connection.commit()
                    else:
                        sql_update = "UPDATE CrossSaleOffer SET subscription_planId =%s, subscription_captureCharges =%s, charge_capture=0,charge_amount=0,charge_currency=''   WHERE cso_id=cast(%s as char) "
                        cursor.execute(sql_update, (planId, crossSaleOfferId))
                        connection.commit()

                if template:
                    sql_update = "UPDATE CrossSaleOffer SET template =%s  WHERE cso_id=cast(%s as char)"
                    cursor.execute(sql_update, (template, crossSaleOfferId))
                    connection.commit()

                if title:
                    sql_update = "UPDATE CrossSaleOffer SET title =%s  WHERE cso_id=cast(%s as char) "
                    cursor.execute(sql_update, (title, crossSaleOfferId))
                    connection.commit()


                if description:
                    sql_update = "UPDATE CrossSaleOffer SET description =%s  WHERE cso_id=cast(%s as char) "
                    cursor.execute(sql_update, (description, crossSaleOfferId))
                    connection.commit()

                if imageData!='0' and template=='image_and_text':
                    filename=randomString(8)
                    file_extension = '.jpeg'
                    #print("-----------------------===", filename,file_extension)
                    filee=str(filename) + str(file_extension)
                    upload_path = os.path.join(os.path.dirname(__file__), 'static/crossimage/')
                    file_path = os.path.join(upload_path, filee)
                    with open(file_path, 'wb') as up:
                        up.write(pybase64.b64decode(imageData))
                    sql_update = "UPDATE CrossSaleOffer SET imageUrl =%s  WHERE cso_id=cast(%s as char)"
                    cursor.execute(sql_update, (filee, crossSaleOfferId))
                    connection.commit()
                    sql_update = "UPDATE CrossSaleOffer SET imageUrl =%s  WHERE cso_id=cast(%s as char) "
                    cursor.execute(sql_update, (filee, crossSaleOfferId))
                    connection.commit()

                if companyName:
                    sql_update = "UPDATE CrossSaleOffer SET companyName =%s  WHERE cso_id=cast(%s as char) "
                    cursor.execute(sql_update, (companyName, crossSaleOfferId))
                    connection.commit()

                if companyLocation:
                    sql_update = "UPDATE CrossSaleOffer SET companyLocation =%s  WHERE cso_id=cast(%s as char)"
                    cursor.execute(sql_update, (companyLocation, crossSaleOfferId))
                    connection.commit()

                if termsAndConditionsUrl:
                    sql_update = "UPDATE CrossSaleOffer SET termsAndConditionsUrl =%s  WHERE cso_id=cast(%s as char) "
                    cursor.execute(sql_update, (termsAndConditionsUrl, crossSaleOfferId))
                    connection.commit()

                if visibleForAllPartners:
                    sql_update = "UPDATE CrossSaleOffer SET visibleForAllPartners =%s  WHERE cso_id=cast(%s as char) "
                    cursor.execute(sql_update, (visibleForAllPartners, crossSaleOfferId))
                    connection.commit()

                if visibleForPartnerIds:
                    sql_update = "UPDATE CrossSaleOffer SET visibleForPartnerId =%s  WHERE cso_id=cast(%s as char) "
                    cursor.execute(sql_update, (visibleForPartnerIds, crossSaleOfferId))
                    connection.commit()

                if metadata:
                    sql_update = "UPDATE CrossSaleOffer SET metadata =%s  WHERE cso_id=cast(%s as char)"
                    cursor.execute(sql_update, (metadata, crossSaleOfferId))
                    connection.commit()

                if partnerId:
                    sql_update = "UPDATE CrossSaleOffer SET partnerId =%s  WHERE cso_id=cast(%s as char) "
                    cursor.execute(sql_update, (partnerId, crossSaleOfferId))
                    connection.commit()

                sql_select = "SELECT * FROM CrossSaleOffer WHERE cso_id=cast(%s as char)"
                cursor.execute(sql_select, (crossSaleOfferId))
                record = cursor.fetchall()

                if record:
                    if record[0][4]:
                        result = {
                            "id": record[0][0],
                            "created": str(record[0][1]),
                            "objectType": record[0][2],
                            "charge": {
                                "amount": record[0][3],
                                "currency": record[0][4],
                                "capture": record[0][5],
                            },
                            "template": record[0][8],
                            "title": record[0][9],
                            "description": record[0][10],
                            "imageUrl": record[0][11],
                            "companyName": record[0][12],
                            "companyLocation": record[0][13],
                            "termsAndConditionsUrl": record[0][14],
                            "visibleForAllPartners": record[0][16],
                        }
                        type_event = "CROSS_SALE_OFFER_UPDATED"
                        id = "event_" + str(uuid.uuid1())
                        data = "char_" + str(uuid.uuid1())
                        log = "log_" + str(uuid.uuid1())
                        created = time.time()



                        url = "/api/v1/crosssale/update"
                        platform = self.request.headers.get('platform')
                        ipaddress = self.request.headers.get('ipaddress')

                        request_body= {"crossSaleOfferId":crossSaleOfferId,"amount":amount,"currency":currency,"capture":capture,"planId":planId,"captureCharges":captureCharges,
                        "template":template,"title":title,"description":description,"imageData":imageData,"companyName":companyName,
                        "companyLocation":companyLocation,"termsAndConditionsUrl":termsAndConditionsUrl,"visibleForAllPartners":visibleForAllPartners,
                        "visibleForPartnerIds":visibleForPartnerIds,"metadata":metadata,"partnerId":partnerId}

                        Insert_log = (
                            "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                        cursor.execute(Insert_log, (str(log), float(created), "post", url, int(200), str(ipaddress), str(platform), str(request_body), str(result),"admin"))


                        Insert_event = (
                            "INSERT INTO event(event_id ,created ,objectType ,type ,data ,log,com_id,customer_id,merchant_id  ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                        cursor.execute(Insert_event, (id, created, "event", type_event, data, log,result["id"],"admin","admin"))

                        Insert_data = (
                            "INSERT INTO data(data_id ,created ,objectType ,amount ,currency,merchant_id  ) VALUES (%s,%s,%s,%s,%s,%s)")
                        cursor.execute(Insert_data, (data, created, "CrossSaleOfferUpdate", float(record[0][3]), str(record[0][4]),"admin"))
                        connection.commit()

                        response = {"status": "success","code": 200,
                                    "data": result,
                                    "message": "crosssale updated successfully"}
                        self.write(response)
                    else:
                        result = {
                            "id": record[0][0],
                            "created": str(record[0][1]),
                            "objectType": record[0][2],
                            "subscription": {
                                "planId": record[0][6],
                                "captureCharges": record[0][7],
                            },
                            "template": record[0][8],
                            "title": record[0][9],
                            "description": record[0][10],
                            "imageUrl": record[0][11],
                            "companyName": record[0][12],
                            "companyLocation": record[0][13],
                            "termsAndConditionsUrl": record[0][14],
                            "visibleForAllPartners": record[0][16],
                        }
                        type_event = "CROSS_SALE_OFFER_UPDATED"
                        id = "event_" + str(uuid.uuid1())
                        data = "char_" + str(uuid.uuid1())
                        log = "log_" + str(uuid.uuid1())
                        created = time.time()



                        url = "/api/v1/crosssale/update"
                        platform = self.request.headers.get('platform')
                        ipaddress = self.request.headers.get('ipaddress')

                        request_body= {"crossSaleOfferId":crossSaleOfferId,"amount":amount,"currency":currency,"capture":capture,"planId":planId,"captureCharges":captureCharges,
                        "template":template,"title":title,"description":description,"imageData":imageData,"companyName":companyName,
                        "companyLocation":companyLocation,"termsAndConditionsUrl":termsAndConditionsUrl,"visibleForAllPartners":visibleForAllPartners,
                        "visibleForPartnerIds":visibleForPartnerIds,"metadata":metadata,"partnerId":partnerId}

                        Insert_log = (
                            "INSERT INTO log(log ,created ,method ,url ,status ,ip_address, source, request_body, response_body,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                        cursor.execute(Insert_log, (str(log), float(created), "post", url, int(200), str(ipaddress), str(platform), str(request_body), str(result),"admin"))


                        #print("result",result["id"])
                        Insert_event = (
                            "INSERT INTO event(event_id ,created ,objectType ,type ,data ,log,com_id,customer_id,merchant_id  ) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
                        cursor.execute(Insert_event, (str(id), float(created), "event", str(type_event), str(data), str(log),str(result["id"]),"admin","admin"))

                        Insert_data = (
                            "INSERT INTO data(data_id ,created ,objectType ,description  ,captured,merchant_id ) VALUES (%s,%s,%s,%s,%s,%s)")
                        cursor.execute(Insert_data, (data, float(created), "CrossSaleOfferUpdate", description, int(record[0][7]),"admin"))
                        connection.commit()

                        response = {"status": "success","code": 200,
                                    "data": result,
                                    "message": "successfully update"}
                        self.write(response)


            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "null",
                    "message": "crossSaleOfferId does not exists",
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
class list_CrossSaleOffer(BaseHandler):
    def get(self):
        created = remove_tag(self.get_argument('created', False))
        operation = remove_tag(self.get_argument('operation', False))
        partnerId = remove_tag(self.get_argument('partnerId', False))
        deleted = remove_tag(self.get_argument('deleted', False))
        limit = remove_tag(self.get_argument('limit', False))
        startingAfterId = regex(remove_tag(self.get_argument('startingAfterId', False)))
        endingBeforeId = regex(remove_tag(self.get_argument('endingBeforeId', False)))

        connection, cursor = db_connect()

        sql_length_query = ("SELECT COUNT(*) FROM CrossSaleOffer")
        cursor.execute(sql_length_query)
        length = cursor.fetchall()
        len_records = length[0][0]
        ###print("length", len_records)

        if limit == False:
            limit = 10
        elif int(limit) > 100:
            limit = 100

        if deleted == False or deleted == "0":
            if operation and created :
                if operation == "lt" or operation == "lte" or operation == "gt" or operation == "gte" and created and partnerId == False:

                    if operation == "lt":
                        sql_select_Query = (
                            "SELECT * FROM CrossSaleOffer WHERE created < %s  ORDER BY created DESC LIMIT %s")
                    elif operation == "lte":
                        sql_select_Query = (
                            "SELECT * FROM CrossSaleOffer WHERE created <= %s ORDER BY created DESC LIMIT %s")
                    elif operation == "gt":
                        sql_select_Query = (
                            "SELECT * FROM CrossSaleOffer WHERE created > %s  ORDER BY created DESC LIMIT %s")
                    elif operation == "gte":
                        sql_select_Query = (
                            "SELECT * FROM CrossSaleOffer WHERE created >= %s ORDER BY created DESC LIMIT %s")
                    cursor.execute(sql_select_Query, (float(created), int(limit)))
                    records = cursor.fetchall()
                elif operation == "lt" or operation == "lte" or operation == "gt" or operation == "gte" and created and partnerId:

                    if operation == "lt":
                        sql_select_Query = (
                            "SELECT * FROM CrossSaleOffer WHERE created < %s AND partnerId=cast(%s as char) ORDER BY created DESC LIMIT %s")
                    elif operation == "lte":
                        sql_select_Query = (
                            "SELECT * FROM CrossSaleOffer WHERE created <= %s AND partnerId=cast(%s as char) ORDER BY created DESC LIMIT %s")
                    elif operation == "gt":
                        sql_select_Query = (
                            "SELECT * FROM CrossSaleOffer WHERE created > %s AND partnerId=cast(%s as char) ORDER BY created DESC LIMIT %s")
                    elif operation == "gte":
                        sql_select_Query = (
                            "SELECT * FROM CrossSaleOffer WHERE created >= %s AND partnerId=cast(%s as char) ORDER BY created DESC LIMIT %s")
                    cursor.execute(sql_select_Query, (float(created), str(partnerId), int(limit)))
                    records = cursor.fetchall()
                # ###print(records)
                connection.commit()
                # len_records = len(records)
                limit = len(records)



                if len(records) == int(limit) and len(records)>0:
                    # card_ID = []
                    # for i in range(limit):
                    #     var = records[i][7]
                    #     ###print(var)
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
                    # ##print("cardid", card_ID)
                    # card_data = []
                    # for i in range(len(records)):
                    #     connection = pymysql.connect(host='localhost', user='root', password='', db='card')
                    #     cursor = connection.cursor()
                    #     sql_select_Query = ("SELECT * FROM cards WHERE card_id= %s ")
                    #
                    #     cursor.execute(sql_select_Query, (card_ID[i]))
                    #     data = cursor.fetchall()
                    #     card_data.append(data)
                    # ##print("card_data", card_data)
                    result = []
                    for i in range(int(limit)):
                        if records[i] != ():
                            data = {
                                "id" :records[i][0] ,
                                "created" : str(records[i][1]),
                                "objectType" : records[i][2],
                                "charge" : {
                                  "amount" : records[i][3],
                                  "currency" : records[i][4],
                                  "capture" : records[i][5],
                                },
                                "planId":records[0][6],
                                "captureCharges":records[0][7],
                                "template" : records[i][8],
                                "title" : records[i][9],
                                "description" : records[i][10],
                                "imageUrl" : records[i][11],
                                "companyName" : records[i][12],
                                "companyLocation" : records[i][13],
                                "termsAndConditionsUrl" : records[i][14],
                                "visibleForAllPartners" : records[i][16], }
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

            if partnerId and operation == False and created == False and startingAfterId == False and endingBeforeId == False:
                try:

                    sql_select_Query = (
                        "SELECT * FROM CrossSaleOffer WHERE partnerId =cast(%s as char) ORDER BY created DESC LIMIT %s ")
                    cursor.execute(sql_select_Query, (partnerId, int(limit)))
                    records = cursor.fetchall()
                    ##print(records)
                    result = []
                    for i in range(len(records)):
                        data = {
                            "id" :records[i][0] ,
                            "created" : str(records[i][1]),
                            "objectType" : records[i][2],
                            "charge" : {
                              "amount" : records[i][3],
                              "currency" : records[i][4],
                              "capture" : records[i][5],
                            },
                            "planId":records[0][6],
                            "captureCharges":records[0][7],
                            "template" : records[i][8],
                            "title" : records[i][9],
                            "description" : records[i][10],
                            "imageUrl" : records[i][11],
                            "companyName" : records[i][12],
                            "companyLocation" : records[i][13],
                            "termsAndConditionsUrl" : records[i][14],
                            "visibleForAllPartners" : records[i][16], }
                        result.append(data)

                    response = {"status": "success","code": 200,
                                "data": result,
                                "data_length": len_records,
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
                sql_select_Query = ("SELECT created FROM CrossSaleOffer WHERE cso_id = cast(%s as char)")
                cursor.execute(sql_select_Query, (startingAfterId))
                record = cursor.fetchall()
                sql_select_Query = ("SELECT * FROM CrossSaleOffer WHERE created>= %s ORDER BY created ASC LIMIT %s ")
                cursor.execute(sql_select_Query, (record, int(limit)))
                records = cursor.fetchall()
                ##print(records)
                results = []
                for i in range(len(records)):
                    result = {
                        "id" :records[i][0] ,
                        "created" : str(records[i][1]),
                        "objectType" : records[i][2],
                        "charge" : {
                          "amount" : records[i][3],
                          "currency" : records[i][4],
                          "capture" : records[i][5],
                        },
                        "planId":records[0][6],
                        "captureCharges":records[0][7],
                        "template" : records[i][8],
                        "title" : records[i][9],
                        "description" : records[i][10],
                        "imageUrl" : records[i][11],
                        "companyName" : records[i][12],
                        "companyLocation" : records[i][13],
                        "termsAndConditionsUrl" : records[i][14],
                        "visibleForAllPartners" : records[i][16], }
                    results.append(result)
                results = results[::-1]

                response = {"status": "success","code": 200,
                            "data": results,
                            "data_length": len_records,
                            "message": ""}

                self.write(response)

            if endingBeforeId:
                sql_select_Query = ("SELECT created FROM CrossSaleOffer WHERE cso_id =cast(%s as char)")
                cursor.execute(sql_select_Query, (endingBeforeId))
                record = cursor.fetchall()
                sql_select_Query = ("SELECT * FROM CrossSaleOffer WHERE created<= %s ORDER BY created DESC LIMIT %s ")
                cursor.execute(sql_select_Query, (record, int(limit)))
                records = cursor.fetchall()
                ##print(records)
                results = []
                for i in range(len(records)):
                    result = {
                        "id" :records[i][0] ,
                        "created" : str(records[i][1]),
                        "objectType" : records[i][2],
                        "charge" : {
                          "amount" : records[i][3],
                          "currency" : records[i][4],
                          "capture" : records[i][5],
                        },
                        "planId":records[0][6],
                        "captureCharges":records[0][7],
                        "template" : records[i][8],
                        "title" : records[i][9],
                        "description" : records[i][10],
                        "imageUrl" : records[i][11],
                        "companyName" : records[i][12],
                        "companyLocation" : records[i][13],
                        "termsAndConditionsUrl" : records[i][14],
                        "visibleForAllPartners" : records[i][16], }
                    results.append(result)

                response = {"status": "success","code": 200,
                            "data": results,
                            "data_length": len_records,
                            "message": ""}
                self.write(response)

        if deleted==True or deleted==1 or deleted=='1':
            if operation == "lt" or operation == "lte" or operation == "gt" or operation == "gte" and created and partnerId == False:
                if operation == "lt":
                    sql_select_Query = (
                        "SELECT * FROM deleted_CrossSaleOffer WHERE created < %s  ORDER BY created DESC LIMIT %s")
                elif operation == "lte":
                    sql_select_Query = (
                        "SELECT * FROM deleted_CrossSaleOffer WHERE created <= %s ORDER BY created DESC LIMIT %s")
                elif operation == "gt":
                    sql_select_Query = (
                        "SELECT * FROM deleted_CrossSaleOffer WHERE created > %s  ORDER BY created DESC LIMIT %s")
                elif operation == "gte":
                    sql_select_Query = (
                        "SELECT * FROM deleted_CrossSaleOffer WHERE created >= %s ORDER BY created DESC LIMIT %s")
                cursor.execute(sql_select_Query, (float(created), int(limit)))
                records = cursor.fetchall()
            elif operation == "lt" or operation == "lte" or operation == "gt" or operation == "gte" and created and partnerId:

                if operation == "lt":
                    sql_select_Query = (
                        "SELECT * FROM deleted_CrossSaleOffer WHERE created < %s AND partnerId=cast(%s as char) ORDER BY created DESC LIMIT %s")
                elif operation == "lte":
                    sql_select_Query = (
                        "SELECT * FROM deleted_CrossSaleOffer WHERE created <= %s AND partnerId=cast(%s as char) ORDER BY created DESC LIMIT %s")
                elif operation == "gt":
                    sql_select_Query = (
                        "SELECT * FROM deleted_CrossSaleOffer WHERE created > %s AND partnerId=cast(%s as char) ORDER BY created DESC LIMIT %s")
                elif operation == "gte":
                    sql_select_Query = (
                        "SELECT * FROM deleted_CrossSaleOffer WHERE created >= %s AND partnerId=cast(%s as char) ORDER BY created DESC LIMIT %s")
                cursor.execute(sql_select_Query, (float(created), str(partnerId), int(limit)))
                records = cursor.fetchall()
            ##print(records)
            connection.commit()
            if len(records) == int(limit):
                # card_ID = []
                # for i in range(limit):
                #     var = records[i][7]
                #     ##print(var)
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
                # ##print("cardid", card_ID)
                # card_data = []
                # for i in range(len(records)):
                #     connection = pymysql.connect(host='localhost', user='root', password='', db='card')
                #     cursor = connection.cursor()
                #     sql_select_Query = ("SELECT * FROM cards WHERE card_id= %s ")
                #
                #     cursor.execute(sql_select_Query, (card_ID[i]))
                #     data = cursor.fetchall()
                #     card_data.append(data)
                # ##print("card_data", card_data)
                result = []
                for i in range(int(limit)):
                    if records[i] != ():
                        data = {
                            "id": records[i][0],
                            "created": str(records[i][1]),
                            "objectType": records[i][2],
                            "ruleType": records[i][3],
                            "fingerprint": records[i][4], }
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
                raise tornado.web.Finish(response)

            if partnerId and operation == False and created == False and startingAfterId == False and endingBeforeId == False:
                try:
                    sql_select_Query = (
                        "SELECT * FROM deleted_CrossSaleOffer WHERE partnerId = cast(%s as char) ORDER BY created DESC LIMIT %s ")
                    cursor.execute(sql_select_Query, (partnerId, int(limit)))
                    records = cursor.fetchall()
                    ##print(records)
                    result = []
                    for i in range(len(records)):
                        data = {
                            "id": records[i][0],
                            "created": str(records[i][1]),
                            "objectType": records[i][2],
                            "ruleType": records[i][3],
                            "fingerprint": records[i][4], }
                        result.append(data)

                    response = {"status": "success","code": 200,
                                "data": result,
                                "data_length": len_records,
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

                sql_select_Query = ("SELECT created FROM deleted_CrossSaleOffer WHERE sub_id = cast(%s as char)")
                cursor.execute(sql_select_Query, (startingAfterId))
                record = cursor.fetchall()
                sql_select_Query = (
                    "SELECT * FROM deleted_CrossSaleOffer WHERE created>= %s ORDER BY created ASC LIMIT 10 ")
                cursor.execute(sql_select_Query, (record))
                records = cursor.fetchall()
                ##print(records)
                results = []
                for i in range(len(records)):
                    result = {
                        "id": records[i][0],
                        "created": str(records[i][1]),
                        "objectType": records[i][2],
                        "ruleType": records[i][3],
                        "fingerprint": records[i][4], }
                    results.append(result)
                results = results[::-1]

                response = {"status": "success","code": 200,
                            "data": results,
                            "data_length": len_records,
                            "message": ""}
                self.write(response)

            if endingBeforeId:

                sql_select_Query = ("SELECT created FROM deleted_CrossSaleOffer WHERE sub_id = cast(%s as char)")
                cursor.execute(sql_select_Query, (endingBeforeId))
                record = cursor.fetchall()
                sql_select_Query = (
                    "SELECT * FROM deleted_CrossSaleOffer WHERE created<= %s ORDER BY created ASC LIMIT 10 ")
                cursor.execute(sql_select_Query, (record))
                records = cursor.fetchall()
                ##print(records)
                results = []
                for i in range(len(records)):
                    result = {
                        "id": records[i][0],
                        "created": str(records[i][1]),
                        "objectType": records[i][2],
                        "ruleType": records[i][3],
                        "fingerprint": records[i][4], }
                    results.append(result)

                response = {"status": "success","code": 200,
                            "data": results,
                            "data_length": len_records,
                            "message": ""}
                self.write(response)



@jwtauth
class crosssale_filter(BaseHandler):
    def post(self):
        start_date = (self.get_argument('start_date', False))
        last_date = (self.get_argument('last_date', False))
        title = (self.get_argument('title', False))
        description = (self.get_argument('description', False))
        partner = (self.get_argument('partner', False))
        crossSaleOfferId = (self.get_argument('crossSaleId', False))
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

        query = f"SELECT * FROM CrossSaleOffer WHERE created<{time}"
        count_query = f"SELECT * FROM CrossSaleOffer WHERE created<{time}"
        if pre_time:
             f"SELECT * FROM CrossSaleOffer WHERE created>{pre_time}"
        if start_date and last_date:
            if query[-5:] == "WHERE":
                add = f" created BETWEEN {start_date} AND {last_date}"
            else:
                add = f" AND created BETWEEN {start_date} AND {last_date}"

            query = query + add
            count_query=count_query+add
        
        if title:
            if query[-5:] == "WHERE":
                add = f" title = '{title}'"
            else:
                add = f" AND title = '{title}'"

            query = query + add
            count_query=count_query+add

        if description:
            if query[-5:] == "WHERE":
                add = f" description = '{description}'"
            else:
                add = f" AND description = '{description}'"
        
            query = query + add
            count_query=count_query+add

        if partner=="Show my offers":
            if query[-5:] == "WHERE":
                add = f" merchant_id = 'admin'"
            else:
                add = f" AND merchant_id = 'admin'"
        
            query = query + add
            count_query=count_query+add
        elif partner:
            if query[-5:] == "WHERE":
                add = f" partnerId = '{partner}'"
            else:
                add = f" AND partnerId = '{partner}'"
        
            query = query + add
            count_query=count_query+add

        if crossSaleOfferId:
            if query[-5:] == "WHERE":
                add = f" cso_id = '{crossSaleOfferId}'"
            else:
                add = f" AND cso_id = '{crossSaleOfferId}'"
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
        record = cursor.fetchall()
        if record:
            results=[]
            for i in range(len(record)):
                result = {
                        "id": record[i][0],
                        "created": str(record[i][1]),
                        "objectType": record[i][2],
                        "charge": {
                            "amount": record[i][3],
                            "currency": record[i][4],
                            "capture": record[i][5],
                        },
                        "subscription" : {
                            "planId" : record[i][6],
                            "captureCharges" : record[i][7],
                            },
                        "template": record[i][8],
                        "title": record[i][9],
                        "description": record[i][10],
                        "imageUrl": record[i][11],
                        "companyName": record[i][12],
                        "companyLocation": record[i][13],
                        "termsAndConditionsUrl": record[i][14],
                        "visibleForAllPartners": record[i][16],
                    }
                results.append(result)
            if pre_time:
                results[::-1]
            response ={
                "status": "success",
                "code": 200,
                "data":results,
                "message": "",}
            self.write(response)
        else:
            response = {
                "status": "error",
                "code": 404,
                "data": "null",
                "message": "data not available",
            }
            raise tornado.web.Finish(response)
        