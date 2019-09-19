import tornado.web
import tornado
import tornado.ioloop
import pyaes
import time
import uuid
import pymysql
import hashlib
from remove_tags import *
from auth import *
from cross_origin import *
from db import *


@jwtauth
class Checkout(BaseHandler):
    def post(self):
        amount = remove_tag(self.get_argument('amount', False))
        currency = remove_tag(self.get_argument('currency', False))
        capture = remove_tag(self.get_argument('capture', False))
        metadata= remove_tag(self.get_argument('capture', False))
        planId = regex(remove_tag(self.get_argument('planId', False)))
        captureCharges = remove_tag(self.get_argument('captureCharges', False))
        sub_metadata = remove_tag(self.get_argument('metadata', False))
        amountOptions = remove_tag(self.get_argument('captured',False))
        customAmount = remove_tag(self.get_argument('refunded',False))
        customcurrency = remove_tag(self.get_argument('currency', False))
        customcapture = remove_tag(self.get_argument('capture', False))
        custom_metadata = remove_tag(self.get_argument('metadata', False))
        customerId = regex(remove_tag(self.get_argument('customerId', False)))
        crossSaleOfferIds = regex(remove_tag(self.get_argument('crossSaleOfferIds', False)))
        rememberMe = remove_tag(self.get_argument('rememberMe',False))
        termsAndConditionsUrl = remove_tag(self.get_argument('termsAndConditionsUrl', False))
        D3_enable = remove_tag(self.get_argument('crossSaleOfferIds', False))
        D3_requireEnrolledCard = remove_tag(self.get_argument('rememberMe', False))
        D3_requireSuccessfulLiabilityShiftForEnrolledCard = remove_tag(self.get_argument('rememberMe', False))

        connection, cursor = db_connect()

        if customerId==False:
            customerId=str(uuid.uuid1())

            Insert_customer = ("INSERT INTO customers(id ,created ,objectType,merchant_id ) VALUES (%s,%s,%s,%s)")
            cursor.execute(Insert_customer, (customerId, float(time.time()), "customer","admin"))
            connection.commit()




            records=1
        else:

            sql_select_Query = ("SELECT * FROM customers WHERE id=cast(%s as char)")
            cursor.execute(sql_select_Query, (customerId,))
            records = cursor.fetchall()
            connection.commit()


        if records:
            if amount and currency:
                sql_disputes = "INSERT INTO Checkout(charge_amount ,charge_currency,charge_capture ,charge_metadata ,customerId ,crossSaleOfferIds ,rememberMe  ,termsAndConditionsUrl,3D_enable,3D_requireEnrolledCard  ,3D_requireSuccessfulLiabilityShiftForEnrolledCard, merchant_id)VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                cursor.execute(sql_disputes,(float(amount),str(currency),int(capture),str(metadata),str(customerId),str(crossSaleOfferIds),int(rememberMe),str(termsAndConditionsUrl),int(D3_enable),int(D3_requireEnrolledCard),int(D3_requireSuccessfulLiabilityShiftForEnrolledCard),"admin"))
                connection.commit()

            elif planId:
                sql_disputes = "INSERT INTO Checkout(subscription_planId VARCHAR(41),subscription_captureCharges ,subscription_metadata ,customerId ,crossSaleOfferIds ,rememberMe  ,termsAndConditionsUrl,3D_requireEnrolledCard  ,3D_requireSuccessfulLiabilityShiftForEnrolledCard,merchant_id)VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                cursor.execute(sql_disputes, (
                str(planId), int(captureCharges), str(capture), str(sub_metadata), str(customerId), str(crossSaleOfferIds),
                int(rememberMe), str(termsAndConditionsUrl), int(D3_enable), int(D3_requireEnrolledCard),
                int(D3_requireSuccessfulLiabilityShiftForEnrolledCard),"admin"))
                connection.commit()


            elif (amountOptions or customAmount) and customcurrency:
                sql_disputes = "INSERT INTO Checkout(customCharge_amountOptions,customCharge_customAmount ,customCharge_currency ,customCharge_capture ,customCharge_metadata ,customerId ,crossSaleOfferIds ,rememberMe  ,termsAndConditionsUrl,3D_enable ,3D_requireEnrolledCard  ,3D_requireSuccessfulLiabilityShiftForEnrolledCard ,merchant_id)VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                cursor.execute(sql_disputes, (
                float(amountOptions), float(customAmount), str(customcurrency), int(customcapture),str(custom_metadata), str(customerId), str(crossSaleOfferIds),
                int(rememberMe), str(termsAndConditionsUrl), int(D3_enable), int(D3_requireEnrolledCard),
                int(D3_requireSuccessfulLiabilityShiftForEnrolledCard),"admin"))
                connection.commit()

        else:
            response = {
                "status": "error",
                "code": 404,
                "data": "null",
                "message": "Not enough argument",
            }
            raise tornado.web.Finish(response)
