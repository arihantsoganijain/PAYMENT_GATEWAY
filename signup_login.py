import tornado.web
import tornado.ioloop
import requests
import time
import os
import pymysql
# from validation import *
from tornado import httpserver ,options
import hashlib
import jwt
import re
import string
import random
import redis
import datetime
# from auth import *
from token_expire import *
from cross_origin import *
from Twofa import *
from db import *
import uuid
from auth import *
import setup
from setup import username

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
@jwtauth
class logout(BaseHandler1):
    def post(self):
        platform = self.request.headers.get('platform')
        browser = self.request.headers.get('browser')
        ipaddress = self.request.headers.get('ipaddress')
        token = self.get_argument('token')
        try:
            created = time.time()
            decoded=jwt.decode(
                token,
                secret_key,
                options=options,algorithm='HS256'
            )
            #print(decoded["userid"])
            connection, cursor = db_connect()
            query = "INSERT INTO loginlogs (login_id, platform, browser, ipaddress,type,created) VALUES(%s,%s,%s,%s,%s,%s)"
            cursor.execute(query,(decoded["userid"],platform, browser, ipaddress,"logout",created))
            connection.commit()
            Addblacklist(token)
            self.set_header("Access-Control-Allow-Origin", "*")
            # self.set_header("Access-Control-Allow-Headers", "X-Requested-With")
            # self.set_header('Access-Control-Allow-Methods', 'POST, GET, OPTIONS, DELETE, PUT')
            # self.set_header("Access-Control-Allow-Headers", "access-control-allow-origin,authorization,content-type")
            response = {"status": "success", "code": 200,
                        "data": "",
                        "message": "sucessfully logout"}
            self.write(response)
        except:
            response = {"status": "success", "code": 200,
                        "data": "",
                        "message": "sucessfully logout"}
            self.write(response)





def randomString(stringLength):
    """Generate a random string of fixed length """
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(stringLength))


# class Signup(BaseHandler):

#     def post(self):
#         username = self.get_argument('username')
#         full_name = self.get_argument('full_name')
#         email = self.get_argument('email')
#         password = self.get_argument('password')
#         conformpassword = self.get_argument('conformpassword')
#         countrycode = self.get_argument('countrycode')
#         phone = self.get_argument('phone')
#         isGA = self.get_argument('isGA')
#         referalid = self.get_argument('referalid',False)
#         role = "admin"
#         pattern = re.compile("^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$")
#         if pattern.match(password):
#             password = hashlib.sha224(password.encode()).hexdigest()
#             conformpassword = hashlib.sha224(conformpassword.encode()).hexdigest()
#         else:
#             response = {
#                 "status": "error",
#                 "code": 404,
#                 "data": "null",
#                 "message": "password must include Minimum eight characters, at least one letter, one number and one special character",
#             }
#             raise tornado.web.Finish(response)
#         check_register_result = self.check_register(username, full_name, email, password, conformpassword,phone)

#         if check_register_result == 1:
#             connection, cursor = db_connect()
#             pcode=randomString(6)
#             ecode=randomString(6)
#             merchant_id = "mrc_" + str(uuid.uuid1())
#             public_key = "pk_" + str(uuid.uuid1())
#             secret_key = "sk__" + str(uuid.uuid1())

#             if isGA=='1' or isGA=='true':
#                 sql = "INSERT INTO merchant (username, full_name, email, password,secret_code,countrycode,phone,Role,isphone,isemail,isGA,pcode,ecode,referalid) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
#                 label, user, secret = setup_user()
#                 cursor.execute(sql, (username, full_name, email, password,secret,countrycode,phone,role,0,0,1,pcode,ecode,referalid))
#                 connection.commit()

#                 sql = "INSERT INTO merchant_account (merchant_id, public_key, secret_key, account_name,Role,username) VALUES(%s,%s,%s,%s,%s,%s)"

#                 cursor.execute(sql, ( merchant_id, public_key, secret_key,"default","administrator",username))
#                 connection.commit()

#                 # I'm unsure if this URL breaks when certain characters are in the label or username
#                 qr_url = "otpauth://totp/%s:%s?secret=%s&issuer=%s" % (label, username, secret, label)
#                 # url = pyqrcode.create(qr_url)
#                 # myqr = url.terminal(quiet_zone=1)
#                 # os.system('cls' if os.name == 'nt' else 'clear')
#                 # Is it possible to make the qrcode smaller when printed in Terminal/Console?
#                 myotp = format_secret(get_totp_token(secret))
#                 response = {"status": "success", "code": 200,
#                             "data": {"username":username,"qr_url":qr_url},
#                             "message": "Signup is sucessfull"}
#                 self.write(response)
#             else:
#                 sql = "INSERT INTO merchant (username, full_name, email, password,secret_code,countrycode,phone,Role,isphone,isemail,isGA,pcode,ecode,referalid) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"

#                 cursor.execute(sql, (username, full_name, email, password,0,countrycode,phone,role,0,0,0,pcode,ecode,referalid))
#                 connection.commit()
#                 response = {"status": "success", "code": 200,"data": {"username":username},"message": "Signup is sucessfull"}
#                 self.write(response)

#                 sql = "INSERT INTO merchant_account (merchant_id, public_key, secret_key, account_name,Role,username) VALUES(%s,%s,%s,%s,%s,%s)"

#                 cursor.execute(sql, (merchant_id, public_key, secret_key, "default", "administrator", username))
#                 connection.commit()

#         elif check_register_result == 2:
#             response = {
#                 "status": "error",
#                 "code": 404,
#                 "data": "null",
#                 "message": "conform password and password not match",
#             }
#             raise tornado.web.Finish(response)


#         elif check_register_result == 3:
#             response = {
#                 "status": "error",
#                 "code": 404,
#                 "data": "null",
#                 "message": "Email already registered",
#             }
#             raise tornado.web.Finish(response)

#         elif check_register_result == 4:
#             response = {
#                 "status": "error",
#                 "code": 404,
#                 "data": "null",
#                 "message": "Username already registered",
#             }
#             raise tornado.web.Finish(response)


#         elif check_register_result == 5:
#             response = {
#                 "status": "error",
#                 "code": 404,
#                 "data": "null",
#                 "message": "Somthing missing",
#             }
#             raise tornado.web.Finish(response)

#         elif check_register_result == 6:
#             response = {
#                 "status": "error",
#                 "code": 404,
#                 "data": "null",
#                 "message": "Phone is already registered ",
#             }
#             raise tornado.web.Finish(response)




#     def check_register(self, username, fullname, email, password, conformpassword,phone):
#         connection, cursor = db_connect()

#         query ="SELECT username ,email, phone FROM merchant"
#         cursor.execute(query)
#         all= cursor.fetchall()
#         #print(all)
#         #print(username , fullname  , email , password , conformpassword)
#         if username and fullname  and email and password and conformpassword:
#             if username not in [(i[0]) for i in all]:
#                 if email not in [(i[1]) for i in all]:
#                     if phone not in [(i[2]) for i in all]:
#                         if password == conformpassword:
#                             return 1
#                         else:
#                             return 2
#                     else:
#                         return 6
#                 else:
#                     return 3
#             else:
#                 return 4
#         else:
#             return 5

# class Signup_2fa(BaseHandler):
#     def post(self):
#         username = self.get_argument('username')
#         otp = self.get_argument('otp',False)
#         isGA = self.get_argument('isGA',False)
#         connection, cursor = db_connect()
#         #print("a",isGA,username)
#         if isGA=="false":


#             #print("c")
#             sql_update_Query = ("UPDATE merchant SET isGA = 0 WHERE  username =cast(%s as char)")
#             cursor.execute(sql_update_Query, (username,))
#             #print("b")
#             connection.commit()
#             #print("d")
#             response = {
#                 "status": "error",
#                 "code": 404,
#                 "data": "",
#                 "message": "Google authentication failed.",
#             }
#             #print("e")
#             raise tornado.web.Finish(response)



#         query = "SELECT secret_code FROM merchant WHERE username=%s"
#         cursor.execute(query,(username))
#         secret_code = cursor.fetchall()
#         #print("%%%%%%",secret_code[0][0])
#         server_otp=get_totp_token(secret_code[0][0])
#         #print(secret_code,server_otp,otp)
#         if int(server_otp)==int(otp):
#             response = {"status": "success", "code": 200,
#                         "data": "",
#                         "message": "2fa is sucessfull"}
#             self.write(response)
#         else:
#             response = {
#                 "status": "error",
#                 "code": 404,
#                 "data": "",
#                 "message": "Wrong otp",
#             }
#             raise tornado.web.Finish(response)





class Login(BaseHandler):

    def post(self):
        # form = Register(self.request.arguments)
        # #print(form)
        platform = self.request.headers.get('platform')
        browser = self.request.headers.get('browser')
        ipaddress = self.request.headers.get('ipaddress')
        username = self.get_argument('username')
        password = self.get_argument('password')
        otp = self.get_argument('otp',False)
        created = time.time()

        password=hashlib.sha224(password.encode()).hexdigest()
        check_login_result = self.check_login(username, password)
        #print(check_login_result)


        if check_login_result == 1:
            r = redis.StrictRedis(host=redis_host, port=redis_port, password=redis_password, decode_responses=True)
            attempts = r.get(username)
            if attempts==None:
                connection, cursor = db_connect()
                # query = "SELECT * FROM merchant_account WHERE username=%s"
                # cursor.execute(query,(username))
                # data = cursor.fetchall()
                # mAndR = []
                # for i in range(len(data)):
                #     account= {data[i][0]:data[i][4]}
                #     mAndR.append(account)
                query = "SELECT * FROM merchant WHERE username=%s"
                cursor.execute(query, (username))
                mdata = cursor.fetchall()

                #print("----------******",mdata[0][0])
                if mdata[0][10]==1:
                    try:
                        a=int(otp)
                    except:
                        response = {
                            "status": "error",
                            "code": 404,
                            "data": "",
                            "message": "Otp Required",
                        }
                        raise tornado.web.Finish(response)
                    server_otp = get_totp_token(mdata[0][4])
                    if not otp:
                        response = {
                            "status": "error",
                            "code": 400,
                            "username":username,
                            "message": "Otp Required",
                        }
                        raise tornado.web.Finish(response)
                    if int(server_otp) == int(otp):
                        token = jwt.encode({
                            'userid': mdata[0][0],
                            ''
                            'exp': datetime.datetime.utcnow() + datetime.timedelta(seconds=50000000000)
                        },
                            'my_secret_key',
                            algorithm='HS256'
                        )
                       
                        if username == setup.username:
                            pass
                        else:
                            response = {
                                "status": "error",
                                "code": 403,
                                "data": "",
                                "message": "Permission Denied",}
                            raise tornado.web.Finish(response)

                        response = {
                            "status": "success",
                            "code": 200,
                            "token": str(token.decode()),
                            "username":username,
                            "message": "Login successfull",
                        }
                        self.write(response)
                        query = "INSERT INTO loginlogs (login_id, platform, browser, ipaddress,type,created) VALUES(%s,%s,%s,%s,%s,%s)"
                        cursor.execute(query,(username,platform, browser, ipaddress,"login",created))
                        connection.commit()
                    else:
                        response = {
                            "status": "error",
                            "code": 404,
                            "data": "",
                            "message": "Wrong otp",
                        }
                        raise tornado.web.Finish(response)


                elif mdata[0][10]==0:
                    token = jwt.encode({
                        'userid': username,
                        
                        'exp': datetime.datetime.utcnow() + datetime.timedelta(seconds=50000000000)
                    },
                        'my_secret_key',
                        algorithm='HS256'
                    )
                    if username == setup.username:
                            pass
                    else:
                        response = {
                            "status": "error",
                            "code": 403,
                            "data": "",
                            "message": "Permission Denied",}
                        raise tornado.web.Finish(response)

                    response = {
                        "status": "success",
                        "code": 200,
                        "token": str(token.decode()),
                        "username": username,
                        "message": "Login successfull",
                    }
                    self.write(response)

                    query = "INSERT INTO loginlogs (login_id, platform, browser, ipaddress,type) VALUES(%s,%s,%s,%s,%s)"
                    cursor.execute(query,(username,platform, browser, ipaddress,"login"))
                    connection.commit()


            elif int(attempts)<3:
                connection, cursor = db_connect()
                # query = "SELECT * FROM merchant_account WHERE username=%s"
                # cursor.execute(query,(username))
                # data = cursor.fetchall()
                # mAndR = []
                # for i in range(len(data)):
                #     account= {data[i][0]:data[i][4]}
                #     mAndR.append(account)
                query = "SELECT * FROM merchant WHERE username=%s"
                cursor.execute(query, (username))
                mdata = cursor.fetchall()

                #print("----------******",mdata[0][0])
                if mdata[0][10]==1:
                    server_otp = get_totp_token(mdata[0][4])
                    if not otp:
                        response = {
                            "status": "error",
                            "code": 400,
                            "username":username,
                            "message": "otp Required",
                        }
                        raise tornado.web.Finish(response)
                    if int(server_otp) == int(otp):
                        token = jwt.encode({
                            'userid': mdata[0][0],
                            
                            'exp': datetime.datetime.utcnow() + datetime.timedelta(seconds=50000000000)
                        },
                            'my_secret_key',
                            algorithm='HS256'
                        )
                        if username == setup.username:
                            pass
                        else:
                            response = {
                                "status": "error",
                                "code": 403,
                                "data": "",
                                "message": "Permission Denied",}
                            raise tornado.web.Finish(response)

                        response = {
                            "status": "success",
                            "code": 200,
                            "token": str(token.decode()),
                            
                            "username":username,
                            "message": "Login successfull",
                        }
                        self.write(response)
                        query = "INSERT INTO loginlogs (login_id, platform, browser, ipaddress,type) VALUES(%s,%s,%s,%s,%s)"
                        cursor.execute(query,(username,platform, browser, ipaddress,"login"))
                        connection.commit()
                    else:
                        response = {
                            "status": "error",
                            "code": 404,
                            "data": "",
                            "message": "Wrong otp",
                        }
                        raise tornado.web.Finish(response)


                elif mdata[0][10]==0:
                    token = jwt.encode({
                        'userid': username,
                        
                        'exp': datetime.datetime.utcnow() + datetime.timedelta(seconds=50000000000)
                    },
                        'my_secret_key',
                        algorithm='HS256'
                    )
                    if username == setup.username:
                            pass
                    else:
                        response = {
                            "status": "error",
                            "code": 403,
                            "data": "",
                            "message": "Permission Denied",}
                        raise tornado.web.Finish(response)

                    response = {
                        "status": "success",
                        "code": 200,
                        "token": str(token.decode()),
                        
                        "username": username,
                        "message": "Login successfull",
                    }
                    self.write(response)

                    query = "INSERT INTO loginlogs (login_id, platform, browser, ipaddress,type) VALUES(%s,%s,%s,%s,%s)"
                    cursor.execute(query,(username,platform, browser, ipaddress,"login"))
                    connection.commit()


            else:
                response = {
                    "status": "error",
                    "code": 404,
                    "data": {"login_try": attempts},
                    "message": "Wait atleast 15 minutes for login",
                }
                raise tornado.web.Finish(response)



        elif check_login_result == 2:
            r = redis.StrictRedis(host=redis_host, port=redis_port, password=redis_password, decode_responses=True)
            attempts = r.get(username)
            # try:
            if attempts==None:
                r.set(username, 1, ex=int(900))
                response = {
                    "status": "error",
                    "code": 404,
                    "data": {"login_try": attempts},
                    "message": "username and password not match",
                }
                raise tornado.web.Finish(response)
            elif int(attempts)==3:
                r.set(username, 3, ex=int(900))
                response = {
                    "status": "error",
                    "code": 404,
                    "data": {"login_try":attempts},
                    "message": "username and password not match",
                            }
                raise tornado.web.Finish(response)
            elif int(attempts)<3:
                r.set(username, int(attempts)+1, ex=int(900))
                response = {
                    "status": "error",
                    "code": 404,
                    "data": {"login_try": attempts},
                    "message": "username and password not match",
                }
                raise tornado.web.Finish(response)
            else:
                r.set(username, 1, ex=int(900))
                response = {
                    "status": "error",
                    "code": 404,
                    "data": {"login_try": 1},
                    "message": "username and password not match",
                }
                raise tornado.web.Finish(response)
            # except:
            #     r.set(username, 1, ex=int(900))
            #     response = {
            #         "status": "error",
            #         "code": 404,
            #         "data": {"login_try": 1},
            #         "message": "username and password not match",
            #     }
            #     raise tornado.web.Finish(response)


        else:
            r = redis.StrictRedis(host=redis_host, port=redis_port, password=redis_password, decode_responses=True)
            attempts = r.get(username)
            # try:
            if attempts==None:
                r.set(username, 1, ex=int(900))
                response = {
                    "status": "error",
                    "code": 404,
                    "data": {"login_try": attempts},
                    "message": "Something missing",
                }
                raise tornado.web.Finish(response)
            elif int(attempts) == 3:
                r.set(username, 3, ex=int(900))
                response = {
                    "status": "error",
                    "code": 404,
                    "data": {"login_try": attempts},
                    "message": "Something missing",
                }
                raise tornado.web.Finish(response)
            elif int(attempts) < 3:
                r.set(username, int(attempts) + 1, ex=int(900))
                response = {
                    "status": "error",
                    "code": 404,
                    "data": {"login_try": attempts},
                    "message": "Something missing",
                }
                raise tornado.web.Finish(response)
            else:
                r.set(username, 1, ex=int(900))
                response = {
                    "status": "error",
                    "code": 404,
                    "data": {"login_try": attempts},
                    "message": "Something missing",
                }
                raise tornado.web.Finish(response)
            # except:
            #     r.set(username, 1, ex=int(900))
            #     response = {
            #         "status": "error",
            #         "code": 404,
            #         "data": {"login_try": 1},
            #         "message": "Something missing",
            #     }
            #     raise tornado.web.Finish(response)



    def check_login(self, username, password):
        connection, cursor = db_connect()
        query="SELECT username ,password FROM merchant"
        cursor.execute(query)
        all=cursor.fetchall()

        if username and password:
            for i in all:
                if i[0]==username and i[1]==password:
                    return 1
            else:
                return 2
        else:
            return 3


# class Twofa(BaseHandler):
#
#     def post(self):
#         username = self.get_argument('username')
#         otp = self.get_argument('otp')
#         if username and otp:
#             r = redis.StrictRedis(host=redis_host, port=redis_port, password=redis_password, decode_responses=True)
#             _secret = r.get(str(username)+"secret")
#             if _secret:
#                 _otp=get_hotp_token(_secret,intervals_no=int(time.time())//30)
#                 if _otp:
#                     if otp==_otp:
#                         token = jwt.encode({
#                             'userid': username,
#                             'a': {2: True},
#                             'exp': datetime.datetime.utcnow() + datetime.timedelta(seconds=50000000000)
#                         },
#                             'my_secret_key',
#                             algorithm='HS256'
#                         )
#
#                         response={
#                             "status": "success",
#                             "code": 200,
#                             "token": str(token.decode()),
#                             "message": "Login successfull",
#                         }
#                         self.write(response)
#                     else:
#                         response = {
#                             "status": "error",
#                             "code": 404,
#                             "data": "",
#                             "message": "Wrong otp",
#                         }
#                         raise tornado.web.Finish(response)
#                 else:
#                     response = {
#                         "status": "error",
#                         "code": 404,
#                         "data": "",
#                         "message": "Please login first",
#                     }
#                     raise tornado.web.Finish(response)
#             else:
#                 response = {
#                     "status": "error",
#                     "code": 404,
#                     "data":"",
#                     "message": "Wrong otp",
#                 }
#                 raise tornado.web.Finish(response)
#
# class refresh2fa(BaseHandler):
#     def post(self):
#         username = self.get_argument('username')
#         r = redis.StrictRedis(host=redis_host, port=redis_port, password=redis_password, decode_responses=True)
#         _secret = r.get(str(username)+"secret")
#         if _secret:
#             _otp = get_hotp_token(_secret, intervals_no=int(time.time()) // 30)
#             label, user, secret = setup_user()
#             secret=_secret
#             # I'm unsure if this URL breaks when certain characters are in the label or username
#             qr_url = "otpauth://totp/%s:%s?secret=%s&issuer=%s" % (label, user, secret, label)
#             url = pyqrcode.create(qr_url)
#             myqr = url.terminal(quiet_zone=1)
#             os.system('cls' if os.name == 'nt' else 'clear')
#             # Is it possible to make the qrcode smaller when printed in Terminal/Console?
#             myotp = format_secret(get_totp_token(secret))
#             # #print("User secret: ", secret)
#             # #print(format_secret(get_totp_token(secret)))
#             response = {
#                 "status": "success",
#                 "code": 200,
#                 "data": {"myqr": qr_url,
#                          "secret": secret,
#                          "otp": myotp,
#                          },
#                 "message": "username and password matched",
#             }
#             r.set(str(username)+"secret", secret, ex=int(90))
#             self.write(response)
#         else:
#             response = {
#                 "status": "error",
#                 "code": 404,
#                 "data": "",
#                 "message": "Please login first",
#             }
#             raise tornado.web.Finish(response)
