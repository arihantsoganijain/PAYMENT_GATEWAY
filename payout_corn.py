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
import requests



def currency_convertor(currency1,currency2):
    url = "https://min-api.cryptocompare.com/data/price?fsym={}&tsyms={}&api_key=1eecefe16a06396e35c13a5d03dd2ed8c4771dacb5934804bf7931db3ea5092b".format(currency1,currency2)
    r = requests.get(url=url)
    r=eval(r.text)
    return r[currency2]

@jwtauth
class payout_corn(BaseHandler):
    def post(self):
# def payout_corn():
        # print(time.time())
        connection, cursor = db_connect()
        sql_select_Query = ("SELECT username FROM merchant")
        cursor.execute(sql_select_Query)
        usernames = cursor.fetchall()
        # print(usernames)
        for i in range(len(usernames)):
            # print(usernames[i],i,type(usernames[i]))
            sql_select_Query = ("SELECT merchant_id FROM merchant_account WHERE username=%s and Role='owner'")
            cursor.execute(sql_select_Query,(usernames[i][0]))
            m_id = cursor.fetchall()
            
            if m_id:
                
                sql_select_Query = ("SELECT payout_till FROM payout WHERE merchant_id=%s ORDER BY created DESC LIMIT 1")
                cursor.execute(sql_select_Query, (m_id[0][0]))
                payout_till = cursor.fetchall()
                
                if payout_till:
                
                    total=0
                    sql_select_Query = ("SELECT amount , currency,created,refunded_amt	 FROM charge WHERE merchant_id=%s AND created>%s ORDER BY created ASC ")
                    cursor.execute(sql_select_Query, (m_id[0][0],payout_till[0][0]))
                    amt_cur = cursor.fetchall()
                    # print(amt_cur,"yoyoyoyoyoyoyoyoyoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo")
                    sql_select_Query = ("SELECT currency FROM merchant_account WHERE username=%s and Role='owner'")
                    cursor.execute(sql_select_Query, (usernames[i][0]))
                    payCurrency = cursor.fetchall()
                    if amt_cur:
                        for j in range(len(amt_cur)):
                            try:
                                refund = int(amt_cur[j][3])
                                
                            except:
                                refund =0
                            try:
                                unit = currency_convertor(str(amt_cur[j][1]), str(payCurrency[0][0]))
                            except:
                                unit=0
                            
                            total=total+float(unit)*float(amt_cur[j][0])- int(refund)
                            payout_till=amt_cur[j][2]
                            # print("payout_til1.1l=",payout_till,type(payout_till),amt_cur[j][2],type(amt_cur[j][2]))
                        # print("payout_till12=",payout_till)
                        fee=(total*2)/100
                        payout_id=uuid.uuid1()
                        created=time.time()
                        # print(str(payout_id), (created), 'payout', type(total),total, str(payCurrency[0][0]), "pending", (payout_till), m_id[0][0], (fee))
                        Insert_payout = "INSERT INTO payout(payout_id ,created,objectType ,amount,currency,status,payout_till ,merchant_id,fee) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s)"

                        cursor.execute(Insert_payout, (str(payout_id), float(created), 'payout', float(total), str(payCurrency[0][0]), "pending", float(payout_till), m_id[0][0], float(fee)))
                        connection.commit()
                    
                else:
                    
                    total = 0
                    sql_select_Query = (
                        "SELECT amount , currency,created,refunded_amt	 FROM charge WHERE merchant_id=%s ORDER BY created ASC ")
                    cursor.execute(sql_select_Query, (m_id[0][0]))
                    amt_cur = cursor.fetchall()
                    # print("amt_cur =",amt_cur,type(amt_cur),len(amt_cur))
                    sql_select_Query = ("SELECT currency FROM merchant_account WHERE username=%s and Role='owner'")
                    cursor.execute(sql_select_Query, (usernames[i][0]))
                    payCurrency = cursor.fetchall()
                    if amt_cur:
                        for j in range(len(amt_cur)):
                            # print(str(amt_cur[j][1]), str(payCurrency[0][0]))
                            try:
                                refund = int(amt_cur[j][3])
                                
                            except:
                                refund =0

                            try:
                                unit = currency_convertor(str(amt_cur[j][1]), str(payCurrency[0][0]))
                                
                            except:
                                unit=0
                            total = total + float(unit) * float(amt_cur[j][0])- int(refund)
                            payout_till = amt_cur[j][2]
                            # print("payout_till1.2=",payout_till,type(payout_till),amt_cur[j][2],type(amt_cur[j][2]))
                            
                        # print("payout_till21=",payout_till)
                        fee = (total * 2) / 100
                        payout_id = uuid.uuid1()
                        created = time.time()
                        # print(str(payout_id), (created), 'payout', type(total),total, str(payCurrency[0][0]), "pending", (payout_till), m_id[0][0], (fee))
                        Insert_payout = "INSERT INTO payout(payout_id ,created,objectType ,amount,currency,status,payout_till ,merchant_id,fee) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                        cursor.execute(Insert_payout,(str(payout_id), float(created), 'payout', float(total), str(payCurrency[0][0]), "pending", float(payout_till), m_id[0][0], float(fee)))
                        connection.commit()
            

# payout_corn()
# print(time.time())
# print("DONE...............")

@jwtauth
class payout_gen(BaseHandler):
    def post(self):
        m_id = remove_tag(self.get_argument('m_id'))
        # print(time.time())
        connection, cursor = db_connect()
        if m_id:
                
            sql_select_Query = ("SELECT payout_till FROM payout WHERE merchant_id=%s ORDER BY created DESC LIMIT 1")
            cursor.execute(sql_select_Query, (m_id))
            payout_till = cursor.fetchall()
            
            if payout_till:
            
                total=0
                sql_select_Query = ("SELECT amount , currency,created,refunded_amt	 FROM charge WHERE merchant_id=%s AND created>%s ORDER BY created ASC ")
                cursor.execute(sql_select_Query, (m_id,payout_till[0][0]))
                amt_cur = cursor.fetchall()
                # print(amt_cur,"yoyoyoyoyoyoyoyoyoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo")
                sql_select_Query = ("SELECT currency FROM merchant_account WHERE merchant_id=%s and Role='owner'")
                cursor.execute(sql_select_Query, (m_id))
                payCurrency = cursor.fetchall()
                if amt_cur:
                    for j in range(len(amt_cur)):
                        try:
                            refund = int(amt_cur[j][3])
                            
                        except:
                            refund =0
                        try:
                            unit = currency_convertor(str(amt_cur[j][1]), str(payCurrency[0][0]))
                        except:
                            unit=0
                        
                        total=total+float(unit)*float(amt_cur[j][0])- int(refund)
                        payout_till=amt_cur[j][2]
                        # print("payout_til1.1l=",payout_till,type(payout_till),amt_cur[j][2],type(amt_cur[j][2]))
                    # print("payout_till12=",payout_till)
                    fee=(total*2)/100
                    payout_id=uuid.uuid1()
                    created=time.time()
                    # print(str(payout_id), (created), 'payout', type(total),total, str(payCurrency[0][0]), "pending", (payout_till), m_id[0][0], (fee))
                    Insert_payout = "INSERT INTO payout(payout_id ,created,objectType ,amount,currency,status,payout_till ,merchant_id,fee) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s)"

                    cursor.execute(Insert_payout, (str(payout_id), float(created), 'payout', float(total), str(payCurrency[0][0]), "pending", float(payout_till), m_id, float(fee)))
                    connection.commit()
                    response = {"status": "success","code": 200,
                                "data": "",
                                "message": "Payout Generated."}
                    self.write(response)
                else:
                    response = {"status": "error","code": 404,
                            "data": "",
                            "message": "No transaction available"}
                    raise tornado.web.Finish(response)
            else:
                
                total = 0
                sql_select_Query = (
                    "SELECT amount , currency,created,refunded_amt	 FROM charge WHERE merchant_id=%s ORDER BY created ASC ")
                cursor.execute(sql_select_Query, (m_id))
                amt_cur = cursor.fetchall()
                # print("amt_cur =",amt_cur,type(amt_cur),len(amt_cur))
                sql_select_Query = ("SELECT currency FROM merchant_account WHERE merchant_id=%s and Role='owner'")
                cursor.execute(sql_select_Query, (m_id))
                payCurrency = cursor.fetchall()
                if amt_cur:
                    for j in range(len(amt_cur)):
                        # print(str(amt_cur[j][1]), str(payCurrency[0][0]))
                        try:
                            refund = int(amt_cur[j][3])
                            
                        except:
                            refund =0

                        try:
                            unit = currency_convertor(str(amt_cur[j][1]), str(payCurrency[0][0]))
                            
                        except:
                            unit=0
                        total = total + float(unit) * float(amt_cur[j][0])- int(refund)
                        payout_till = amt_cur[j][2]
                        # print("payout_till1.2=",payout_till,type(payout_till),amt_cur[j][2],type(amt_cur[j][2]))
                        
                    # print("payout_till21=",payout_till)
                    fee = (total * 2) / 100
                    payout_id = uuid.uuid1()
                    created = time.time()
                    # print(str(payout_id), (created), 'payout', type(total),total, str(payCurrency[0][0]), "pending", (payout_till), m_id[0][0], (fee))
                    Insert_payout = "INSERT INTO payout(payout_id ,created,objectType ,amount,currency,status,payout_till ,merchant_id,fee) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                    cursor.execute(Insert_payout,(str(payout_id), float(created), 'payout', float(total), str(payCurrency[0][0]), "pending", float(payout_till), m_id, float(fee)))
                    connection.commit()
                    response = {"status": "success","code": 200,
                                "data": "",
                                "message": "Payout Generated."}
                    self.write(response)
                else:
                    response = {"status": "error","code": 404,
                            "data": "",
                            "message": "No transaction available"}
                    raise tornado.web.Finish(response)
