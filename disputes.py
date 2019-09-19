import tornado.web
import tornado
import tornado.ioloop
import pyaes
import time
import uuid
import pymysql
from db import *



class disputes(tornado.web.RequestHandler):
    def post(self):
        charge = self.get_argument("chargeId")
        amount = self.get_argument("amount")
        currency = self.get_argument("currency")
        status = self.get_argument("status")
        reason = self.get_argument("reason")
        evidence = self.get_argument("evidence", False)
        acceptedAsLost = self.get_argument("acceptedAsLost", False)

        productDescription = self.get_argument("productDescription", False)
        customerName = self.get_argument("customerName", False)
        customerEmail = self.get_argument("customerEmail", False)
        customerPurchaseIp = self.get_argument("customerPurchaseIp", False)
        customerSignature = self.get_argument("customerSignature", False)
        billingAddress = self.get_argument("billingAddress", False)
        receipt = self.get_argument("receipt", False)
        customerCommunication = self.get_argument("customerCommunication", False)
        serviceDate = self.get_argument("serviceDate", False)
        serviceDocumentation = self.get_argument("serviceDocumentation", False)
        duplicateChargeId = self.get_argument("duplicateChargeId", False)
        duplicateChargeDocumentation = self.get_argument("duplicateChargeDocumentation", False)
        duplicateChargeExplanation = self.get_argument("duplicateChargeExplanation", False)
        refundPolicy = self.get_argument("refundPolicy", False)
        refundPolicyDisclosure = self.get_argument("refundPolicyDisclosure", False)
        refundRefusalExplanation = self.get_argument("refundRefusalExplanation", False)
        cancellationPolicy = self.get_argument("cancellationPolicy", False)
        cancellationPolicyDisclosure = self.get_argument("cancellationPolicyDisclosure", False)
        cancellationRefusalExplanation = self.get_argument("cancellationRefusalExplanation", False)
        accessActivityLogs = self.get_argument("accessActivityLogs", False)
        shippingAddress = self.get_argument("shippingAddress", False)
        shippingDate = self.get_argument("shippingDate", False)
        shippingCarrier = self.get_argument("shippingCarrier", False)
        shippingTrackingNumber = self.get_argument("shippingTrackingNumber", False)
        shippingDocumentation = self.get_argument("shippingDocumentation", False)
        uncategorizedText = self.get_argument("uncategorizedText", False)
        uncategorizedFile = self.get_argument("uncategorizedFile", False)

        connection,cursor=db_connect()

        disputeId = "disp_" + str(uuid.uuid1())
        created = time.time()

        if evidence == "Yes":
            hasEvidence = 1
            submissionCount = 1
            if status and reason in ['RETRIEVAL_REQUEST_NEW', 'RETRIEVAL_REQUEST_RESPONSE_UNDER_REVIEW',
                                     'RETRIEVAL_REQUEST_REPRESENTED', 'CHARGEBACK_NEW',
                                     'CHARGEBACK_RESPONSE_UNDER_REVIEW',
                                     'CHARGEBACK_REPRESENTED_SUCCESSFULLY', 'CHARGEBACK_REPRESENTED_UNSUCCESSFULLY',
                                     'FRAUDULENT', 'UNRECOGNIZED', 'DUPLICATE', 'SUBSCRIPTION_CANCELED',
                                     'PRODUCT_NOT_RECEIVED', 'PRODUCT_UNACCEPTABLE', 'CREDIT_NOT_PROCESSED',
                                     'GENERAL']:
                sql = "INSERT INTO disputes(id,created,objectType ,updated ,amount,currency,status ,reason,acceptedAsLost, chargeId, hasEvidence, submissionCount,merchant_id) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                cursor.execute(sql, (
                disputeId, created, 'dispute', created, amount, currency, status, reason, acceptedAsLost, charge,
                hasEvidence, submissionCount,"admin"))
                connection.commit()

                sqlupdate = "UPDATE charge SET dispute_id =%s , disputed =%s WHERE id =%s"
                cursor.execute(sqlupdate, (disputeId, '1', charge))
                connection.commit()

                sql_insert = "INSERT INTO disputes_evidence(dispute_id, productDescription ,customerName ,customerEmail, customerPurchaseIp ,customerSignature ,billingAddress ,receipt, customerCommunication ,serviceDate,serviceDocumentation, duplicateChargeId ,duplicateChargeDocumentation,duplicateChargeExplanation,refundPolicy,refundPolicyDisclosure,refundRefusalExplanation,cancellationPolicy, cancellationPolicyDisclosure,cancellationRefusalExplanation ,accessActivityLogs, shippingAddress,shippingDate ,shippingCarrier ,shippingTrackingNumber, shippingDocumentation,uncategorizedText,uncategorizedFile,merchant_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                cursor.execute(sql_insert, (
                str(disputeId), str(productDescription), str(customerName), str(customerEmail), str(customerPurchaseIp),
                str(customerSignature),
                str(billingAddress), str(receipt), str(customerCommunication), str(serviceDate),
                str(serviceDocumentation),
                str(duplicateChargeId), str(duplicateChargeDocumentation), str(duplicateChargeExplanation),
                str(refundPolicy), str(refundPolicyDisclosure), str(refundRefusalExplanation), str(cancellationPolicy),
                str(cancellationPolicyDisclosure),
                str(cancellationRefusalExplanation), str(accessActivityLogs), str(shippingAddress), str(shippingDate),
                str(shippingCarrier),
                str(shippingTrackingNumber), str(shippingDocumentation), str(uncategorizedText),
                str(uncategorizedFile),"admin"))
                connection.commit()

                sql_query = "SELECT * FROM disputes INNER JOIN charge ON disputes.id = charge.dispute_id INNER JOIN cards ON cards.card_id = charge.card_id INNER JOIN disputes_evidence ON disputes_evidence.dispute_id = disputes.id WHERE charge.id =%s"
                cursor.execute(sql_query, (charge))
                record = cursor.fetchall()
                ##print(record,"================",record[0][13],record[0][32],record[0][57])

                result = {"id": record[0][0],
                          "created": str(record[0][1]),
                          "objectType": record[0][2],
                          "updated": str(record[0][3]),
                          "amount": record[0][4],
                          "currency": record[0][5],
                          "status": record[0][6],
                          "reason": record[0][7],
                          "acceptedAsLost": record[0][8],
                          "charge": {
                              "id": record[0][13],
                              "created": str(record[0][14]),
                              "objectType": record[0][15],
                              "amount": record[0][16],
                              "currency": record[0][17],
                              "card": {
                                  "id": record[0][33],
                                  "created": str(record[0][34]),
                                  "objectType": record[0][35],
                                  "first6": record[0][36],
                                  "last4": record[0][37],
                                  "fingerprint": record[0][38],
                                  "expMonth": record[0][39],
                                  "expYear": record[0][40],
                                  "cardholderName": record[0][41],
                                  "customerId": record[0][42],
                                  "brand": record[0][43],
                                  "type": record[0][44],
                                  "country": record[0][45],
                              },
                              "captured": record[0][21],
                              "refunded": record[0][22],
                              "disputed": record[0][23],
                          },
                          "evidence": {
                                      "productDescription": record[0][58],
                                      "customerName": record[0][59],
                                      "customerEmail": record[0][60],
                                      "customerPurchaseIp": record[0][61],
                                      "customerSignature": record[0][62],
                                      "billingAddress": record[0][63],
                                      "receipt": record[0][64],
                                      "customerCommunication": record[0][65],
                                      "serviceDate": record[0][66],
                                      "serviceDocumentation": record[0][67],
                                      "duplicateChargeId": record[0][68],
                                      "duplicateChargeDocumentation ": record[0][69],
                                      "duplicateChargeExplanation": record[0][70],
                                      "refundPolicy": record[0][71],
                                      "refundPolicyDisclosure ": record[0][72],
                                      "refundRefusalExplanation": record[0][73],
                                      "cancellationPolicy ": record[0][74],
                                      "cancellationPolicyDisclosure ": record[0][75],
                                      "cancellationRefusalExplanation ": record[0][76],
                                      "accessActivityLogs ": record[0][77],
                                      "shippingAddress ": record[0][78],
                                      "shippingDate ": record[0][79],
                                      "shippingCarrier ": record[0][80],
                                      "shippingTrackingNumber": record[0][81],
                                      "shippingDocumentation ": record[0][82],
                                      "uncategorizedText": record[0][83],
                                      "uncategorizedFile": record[0][84]

                          },

                          "evidenceDetails": {
                              "hasEvidence": record[0][10],
                              "submissionCount": record[0][11],
                          }
                          }
                response = {"status": "success",
                            "code": 200,
                            "data": result,
                            "message": "dispute created succesfully"}
                self.write(response)


            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "null",
                    "message": "status or reason not found",
                }
                raise tornado.web.Finish(response)

        elif evidence == "No":
            hasEvidence = 0
            submissionCount = 0
            acceptedAsLost=1
            if status and reason in ['RETRIEVAL_REQUEST_NEW', 'RETRIEVAL_REQUEST_RESPONSE_UNDER_REVIEW',
                                     'RETRIEVAL_REQUEST_REPRESENTED', 'CHARGEBACK_NEW',
                                     'CHARGEBACK_RESPONSE_UNDER_REVIEW',
                                     'CHARGEBACK_REPRESENTED_SUCCESSFULLY', 'CHARGEBACK_REPRESENTED_UNSUCCESSFULLY',
                                     'FRAUDULENT', 'UNRECOGNIZED', 'DUPLICATE', 'SUBSCRIPTION_CANCELED',
                                     'PRODUCT_NOT_RECEIVED', 'PRODUCT_UNACCEPTABLE', 'CREDIT_NOT_PROCESSED',
                                     'GENERAL']:
                sql = "INSERT INTO disputes(id,created,objectType ,updated ,amount,currency,status ,reason,acceptedAsLost, chargeId, hasEvidence, submissionCount,merchant_id) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                cursor.execute(sql, (
                disputeId, created, 'dispute', created, amount, currency, status, reason, acceptedAsLost, charge,
                hasEvidence, submissionCount,"admin"))
                connection.commit()

                sqlupdate = "UPDATE charge SET dispute_id =%s , disputed =%s WHERE id =%s"
                cursor.execute(sqlupdate, (disputeId, '1', charge))
                connection.commit()

                sql_query = "SELECT * FROM disputes INNER JOIN charge ON disputes.id = charge.dispute_id INNER JOIN cards ON cards.card_id = charge.card_id  WHERE charge.id =%s"
                cursor.execute(sql_query, (charge))
                records = cursor.fetchall()
                ##print(records)

                result = {"id": records[0][0],
                          "created": str(records[0][1]),
                          "objectType": records[0][2],
                          "updated": str(records[0][3]),
                          "amount": records[0][4],
                          "currency": records[0][5],
                          "status": records[0][6],
                          "reason": records[0][7],
                          "acceptedAsLost": records[0][8],
                          "charge": {
                              "id": records[0][13],
                              "created": str(records[0][14]),
                              "objectType": records[0][15],
                              "amount": records[0][16],
                              "currency": records[0][17],
                              "card": {
                                  "id": records[0][33],
                                  "created": str(records[0][34]),
                                  "objectType": records[0][35],
                                  "first6": records[0][36],
                                  "last4": records[0][37],
                                  "fingerprint": records[0][38],
                                  "expMonth": records[0][39],
                                  "expYear": records[0][40],
                                  "cardholderName": records[0][41],
                                  "customerId": records[0][42],
                                  "brand": records[0][43],
                                  "type": records[0][44],
                                  "country": records[0][45],
                              },
                              "captured": records[0][21],
                              "refunded": records[0][22],
                              "disputed": records[0][23],
                          },
                          "evidence":  'null',

                          "evidenceDetails": {
                              "hasEvidence": records[0][10],
                              "submissionCount": records[0][11],
                          }
                          }

                response = {"status": "success",
                            "code": 200,
                            "data": result,
                            "message": "dispute created succesfully"}

                self.write(response)
            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "null",
                    "message": "status or reason not found",
                }
                raise tornado.web.Finish(response)

    def get(self):
        disputeId = self.get_argument("disputeId")

        connection, cursor = db_connect()

        sql = "SELECT * FROM disputes WHERE id = %s"
        cursor.execute(sql, (disputeId))
        dispute = cursor.fetchall()

        if dispute:

            sql = "SELECT * FROM disputes_evidence WHERE dispute_id = %s"
            cursor.execute(sql, (disputeId))
            records = cursor.fetchall()

            if records:

                sql_select_Query = "SELECT * FROM disputes INNER JOIN charge ON disputes.id = charge.dispute_id INNER JOIN cards ON cards.card_id = charge.card_id INNER JOIN disputes_evidence ON disputes_evidence.dispute_id = disputes.id WHERE disputes.id =%s"
                cursor.execute(sql_select_Query, (disputeId))
                record = cursor.fetchall()
                ##print(record)

                result = {"id": record[0][0],
                          "created": str(record[0][1]),
                          "objectType": record[0][2],
                          "updated": str(record[0][3]),
                          "amount": record[0][4],
                          "currency": record[0][5],
                          "status": record[0][6],
                          "reason": record[0][7],
                          "acceptedAsLost": record[0][8],
                          "charge": {
                              "id": record[0][13],
                              "created": str(record[0][14]),
                              "objectType": record[0][15],
                              "amount": record[0][16],
                              "currency": record[0][17],
                              "card": {
                                  "id": record[0][33],
                                  "created": str(record[0][34]),
                                  "objectType": record[0][35],
                                  "first6": record[0][36],
                                  "last4": record[0][37],
                                  "fingerprint": record[0][38],
                                  "expMonth": record[0][39],
                                  "expYear": record[0][40],
                                  "cardholderName": record[0][41],
                                  "customerId": record[0][42],
                                  "brand": record[0][43],
                                  "type": record[0][44],
                                  "country": record[0][45],
                              },
                              "captured": record[0][21],
                              "refunded": record[0][22],
                              "disputed": record[0][23],
                          },
                          "evidence": {
                              "productDescription": record[0][58],
                              "customerName": record[0][59],
                              "customerEmail": record[0][60],
                              "customerPurchaseIp": record[0][61],
                              "customerSignature": record[0][62],
                              "billingAddress": record[0][63],
                              "receipt": record[0][64],
                              "customerCommunication": record[0][65],
                              "serviceDate": record[0][66],
                              "serviceDocumentation": record[0][67],
                              "duplicateChargeId": record[0][68],
                              "duplicateChargeDocumentation ": record[0][69],
                              "duplicateChargeExplanation": record[0][70],
                              "refundPolicy": record[0][71],
                              "refundPolicyDisclosure ": record[0][72],
                              "refundRefusalExplanation": record[0][73],
                              "cancellationPolicy ": record[0][74],
                              "cancellationPolicyDisclosure ": record[0][75],
                              "cancellationRefusalExplanation ": record[0][76],
                              "accessActivityLogs ": record[0][77],
                              "shippingAddress ": record[0][78],
                              "shippingDate ": record[0][79],
                              "shippingCarrier ": record[0][80],
                              "shippingTrackingNumber": record[0][81],
                              "shippingDocumentation ": record[0][82],
                              "uncategorizedText": record[0][83],
                              "uncategorizedFile": record[0][84]

                          },

                          "evidenceDetails": {
                              "hasEvidence": record[0][10],
                              "submissionCount": record[0][11],
                          }
                          }
                response = {"status": "success",
                            "code": 200,
                            "data": result,
                            "message": ""}
                self.write(response)

            else:

                sql_query = "SELECT * FROM disputes INNER JOIN charge ON disputes.id = charge.dispute_id INNER JOIN cards ON cards.card_id = charge.card_id  WHERE disputes.id =%s"
                cursor.execute(sql_query, (disputeId))
                records = cursor.fetchall()
                #print(records)

                result = {"id": records[0][0],
                          "created": str(records[0][1]),
                          "objectType": records[0][2],
                          "updated": str(records[0][3]),
                          "amount": records[0][4],
                          "currency": records[0][5],
                          "status": records[0][6],
                          "reason": records[0][7],
                          "acceptedAsLost": records[0][8],
                          "charge": {
                              "id": records[0][13],
                              "created": str(records[0][14]),
                              "objectType": records[0][15],
                              "amount": records[0][16],
                              "currency": records[0][17],
                              "card": {
                                  "id": records[0][33],
                                  "created": str(records[0][34]),
                                  "objectType": records[0][35],
                                  "first6": records[0][36],
                                  "last4": records[0][37],
                                  "fingerprint": records[0][38],
                                  "expMonth": records[0][39],
                                  "expYear": records[0][40],
                                  "cardholderName": records[0][41],
                                  "customerId": records[0][42],
                                  "brand": records[0][43],
                                  "type": records[0][44],
                                  "country": records[0][45],
                              },
                              "captured": records[0][21],
                              "refunded": records[0][22],
                              "disputed": records[0][23],
                          },
                          "evidence": 'null',

                          "evidenceDetails": {
                              "hasEvidence": records[0][10],
                              "submissionCount": records[0][11],
                          }
                          }

                response = {"status": "success",
                            "code": 200,
                            "data": result,
                            "message": ""}

                self.write(response)

        else:
            response = {
                "status": "error",
                "code": 404,
                "data": "null",
                "message": "dispute id doesn't exists",
            }
            raise tornado.web.Finish(response)

class dispute_update(tornado.web.RequestHandler):
    def post(self):
        disputeId = self.get_argument("disputeId")
        productDescription = self.get_argument("productDescription", False)
        customerName = self.get_argument("customerName", False)
        customerEmail = self.get_argument("customerEmail", False)
        customerPurchaseIp = self.get_argument("customerPurchaseIp", False)
        customerSignature = self.get_argument("customerSignature", False)
        billingAddress = self.get_argument("billingAddress", False)
        receipt = self.get_argument("receipt", False)
        customerCommunication = self.get_argument("customerCommunication", False)
        serviceDate = self.get_argument("serviceDate", False)
        serviceDocumentation = self.get_argument("serviceDocumentation", False)
        duplicateChargeId = self.get_argument("duplicateChargeId", False)
        duplicateChargeDocumentation = self.get_argument("duplicateChargeDocumentation", False)
        duplicateChargeExplanation = self.get_argument("duplicateChargeExplanation", False)
        refundPolicy = self.get_argument("refundPolicy", False)
        refundPolicyDisclosure = self.get_argument("refundPolicyDisclosure", False)
        refundRefusalExplanation = self.get_argument("refundRefusalExplanation", False)
        cancellationPolicy = self.get_argument("cancellationPolicy", False)
        cancellationPolicyDisclosure = self.get_argument("cancellationPolicyDisclosure", False)
        cancellationRefusalExplanation = self.get_argument("cancellationRefusalExplanation", False)
        accessActivityLogs = self.get_argument("accessActivityLogs", False)
        shippingAddress = self.get_argument("shippingAddress", False)
        shippingDate = self.get_argument("shippingDate", False)
        shippingCarrier = self.get_argument("shippingCarrier", False)
        shippingTrackingNumber = self.get_argument("shippingTrackingNumber", False)
        shippingDocumentation = self.get_argument("shippingDocumentation", False)
        uncategorizedText = self.get_argument("uncategorizedText", False)
        uncategorizedFile = self.get_argument("uncategorizedFile", False)

        connection, cursor = db_connect()

        sql = "SELECT * FROM disputes_evidence WHERE dispute_id = %s"
        cursor.execute(sql, (disputeId))
        record = cursor.fetchall()

        if record:
            sql_update = "UPDATE disputes_evidence SET productDescription =%s,customerName =%s ,customerEmail =%s, customerPurchaseIp =%s ,customerSignature =%s ,billingAddress =%s ,receipt =%s, customerCommunication  =%s,serviceDate =%s,serviceDocumentation =%s, duplicateChargeId =%s ,duplicateChargeDocumentation =%s,duplicateChargeExplanation =%s,refundPolicy =%s,refundPolicyDisclosure =%s,refundRefusalExplanation =%s,cancellationPolicy =%s, cancellationPolicyDisclosure =%s,cancellationRefusalExplanation =%s ,accessActivityLogs =%s, shippingAddress =%s,shippingDate =%s ,shippingCarrier =%s ,shippingTrackingNumber =%s, shippingDocumentation =%s,uncategorizedText =%s,uncategorizedFile =%s WHERE dispute_id = %s"
            cursor.execute(sql_update, (
                str(productDescription), str(customerName), str(customerEmail), str(customerPurchaseIp),
                str(customerSignature),
                str(billingAddress), str(receipt), str(customerCommunication), str(serviceDate),
                str(serviceDocumentation),
                str(duplicateChargeId), str(duplicateChargeDocumentation), str(duplicateChargeExplanation),
                str(refundPolicy), str(refundPolicyDisclosure), str(refundRefusalExplanation),
                str(cancellationPolicy),
                str(cancellationPolicyDisclosure),
                str(cancellationRefusalExplanation), str(accessActivityLogs), str(shippingAddress),
                str(shippingDate),
                str(shippingCarrier),
                str(shippingTrackingNumber), str(shippingDocumentation), str(uncategorizedText),
                str(uncategorizedFile), disputeId))
            connection.commit()

            # sql_select_Query = "SELECT * FROM disputes INNER JOIN charge ON disputes.id = charge.dispute_id INNER JOIN cards ON cards.card_id = charge.card_id INNER JOIN disputes_evidence ON disputes_evidence.dispute_id = disputes.id WHERE disputes.id =%s"
            # cursor.execute(sql_select_Query, (disputeId))
            # records = cursor.fetchall()
            # #print(records)
            # if records:
            #     #print(records, "========", records[0][13], record[0][33], record[0][58])
            #     result = {"id": record[0][0],
            #               "created": str(record[0][1]),
            #               "objectType": record[0][2],
            #               "updated": str(record[0][3]),
            #               "amount": record[0][4],
            #               "currency": record[0][5],
            #               "status": record[0][6],
            #               "reason": record[0][7],
            #               "acceptedAsLost": record[0][8],
            #               "charge": {
            #                   "id": record[0][13],
            #                   "created": str(record[0][14]),
            #                   "objectType": record[0][15],
            #                   "amount": record[0][16],
            #                   "currency": record[0][17],
            #                   "card": {
            #                       "id": record[0][33],
            #                       "created": str(record[0][34]),
            #                       "objectType": record[0][35],
            #                       "first6": record[0][36],
            #                       "last4": record[0][37],
            #                       "fingerprint": record[0][38],
            #                       "expMonth": record[0][39],
            #                       "expYear": record[0][40],
            #                       "cardholderName": record[0][41],
            #                       "customerId": record[0][42],
            #                       "brand": record[0][43],
            #                       "type": record[0][44],
            #                       "country": record[0][45],
            #                   },
            #                   "captured": record[0][21],
            #                   "refunded": record[0][22],
            #                   "disputed": record[0][23],
            #               },
            #               "evidence": {
            #                   "productDescription": record[0][58],
            #                   "customerName": record[0][59],
            #                   "customerEmail": record[0][60],
            #                   "customerPurchaseIp": record[0][61],
            #                   "customerSignature": record[0][62],
            #                   "billingAddress": record[0][63],
            #                   "receipt": record[0][64],
            #                   "customerCommunication": record[0][65],
            #                   "serviceDate": record[0][66],
            #                   "serviceDocumentation": record[0][67],
            #                   "duplicateChargeId": record[0][68],
            #                   "duplicateChargeDocumentation ": record[0][69],
            #                   "duplicateChargeExplanation": record[0][70],
            #                   "refundPolicy": record[0][71],
            #                   "refundPolicyDisclosure ": record[0][72],
            #                   "refundRefusalExplanation": record[0][73],
            #                   "cancellationPolicy ": record[0][74],
            #                   "cancellationPolicyDisclosure ": record[0][75],
            #                   "cancellationRefusalExplanation ": record[0][76],
            #                   "accessActivityLogs ": record[0][77],
            #                   "shippingAddress ": record[0][78],
            #                   "shippingDate ": record[0][79],
            #                   "shippingCarrier ": record[0][80],
            #                   "shippingTrackingNumber": record[0][81],
            #                   "shippingDocumentation ": record[0][82],
            #                   "uncategorizedText": record[0][83],
            #                   "uncategorizedFile": record[0][84]
            #
            #               },
            #
            #               "evidenceDetails": {
            #                   "hasEvidence": record[0][10],
            #                   "submissionCount": record[0][11],
            #               }
            #               }
            #     response = {"status": "success",
            #                 "code": 200,
            #                 "data": result,
            #                 "message": "dispute updated succesfully"}
            #     self.write(response)
            sql_select_Query = "SELECT * FROM disputes INNER JOIN charge ON disputes.id = charge.dispute_id INNER JOIN cards ON cards.card_id = charge.card_id INNER JOIN disputes_evidence ON disputes_evidence.dispute_id = disputes.id WHERE disputes.id =%s"
            cursor.execute(sql_select_Query, (disputeId))
            record = cursor.fetchall()
            #print(record)
            if record:
                result = {"id": record[0][0],
                          "created": str(record[0][1]),
                          "objectType": record[0][2],
                          "updated": str(record[0][3]),
                          "amount": record[0][4],
                          "currency": record[0][5],
                          "status": record[0][6],
                          "reason": record[0][7],
                          "acceptedAsLost": record[0][8],
                          "charge": {
                              "id": record[0][13],
                              "created": str(record[0][14]),
                              "objectType": record[0][15],
                              "amount": record[0][16],
                              "currency": record[0][17],
                              "card": {
                                  "id": record[0][33],
                                  "created": str(record[0][34]),
                                  "objectType": record[0][35],
                                  "first6": record[0][36],
                                  "last4": record[0][37],
                                  "fingerprint": record[0][38],
                                  "expMonth": record[0][39],
                                  "expYear": record[0][40],
                                  "cardholderName": record[0][41],
                                  "customerId": record[0][42],
                                  "brand": record[0][43],
                                  "type": record[0][44],
                                  "country": record[0][45],
                              },
                              "captured": record[0][21],
                              "refunded": record[0][22],
                              "disputed": record[0][23],
                          },
                          "evidence": {
                              "productDescription": record[0][58],
                              "customerName": record[0][59],
                              "customerEmail": record[0][60],
                              "customerPurchaseIp": record[0][61],
                              "customerSignature": record[0][62],
                              "billingAddress": record[0][63],
                              "receipt": record[0][64],
                              "customerCommunication": record[0][65],
                              "serviceDate": record[0][66],
                              "serviceDocumentation": record[0][67],
                              "duplicateChargeId": record[0][68],
                              "duplicateChargeDocumentation ": record[0][69],
                              "duplicateChargeExplanation": record[0][70],
                              "refundPolicy": record[0][71],
                              "refundPolicyDisclosure ": record[0][72],
                              "refundRefusalExplanation": record[0][73],
                              "cancellationPolicy ": record[0][74],
                              "cancellationPolicyDisclosure ": record[0][75],
                              "cancellationRefusalExplanation ": record[0][76],
                              "accessActivityLogs ": record[0][77],
                              "shippingAddress ": record[0][78],
                              "shippingDate ": record[0][79],
                              "shippingCarrier ": record[0][80],
                              "shippingTrackingNumber": record[0][81],
                              "shippingDocumentation ": record[0][82],
                              "uncategorizedText": record[0][83],
                              "uncategorizedFile": record[0][84]

                          },

                          "evidenceDetails": {
                              "hasEvidence": record[0][10],
                              "submissionCount": record[0][11],
                          }
                          }
                response = {"status": "success",
                            "code": 200,
                            "data": result,
                            "message": ""}
                self.write(response)
            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": "null",
                    "message": "dispute id doesn't exists",
                }
                raise tornado.web.Finish(response)


        else:
            response = {
                "status": "error",
                "code": 404,
                "data": "null",
                "message": "dispute id doesn't exists",
            }
            raise tornado.web.Finish(response)
