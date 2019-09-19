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
import hashlib
from setup import *


def check_login( username, password):
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
@jwtauth
class admin_pass_change(BaseHandler):

    def post(self):

        old_pass = remove_tag(self.get_argument('old_pass'))
        new_pass=remove_tag(self.get_argument('new_pass'))
        # token = self.request.headers.get('Authorization')
        # m_id = remove_tag(self.get_argument('m_id'))

        # parts = token.split()
        # token = parts[1]
        # token_decode = jwt.decode(
        #     token,
        #     secret_key,
        #     options=options, algorithm='HS256')
        # merchant_id = 0
        # for i in range(len(token_decode['mAndR'])):
        #     #print(token_decode['mAndR'][i],"======================",token_decode)
        #     if m_id in token_decode['mAndR'][i]['merchant_id']:
        #         merchant_id=m_id
        #         user_id=token_decode['userid']
        #     else:
        #         pass

        # if merchant_id:
        try:
            connection, cursor = db_connect()
            # select_role='SELECT Role FROM merchant_account WHERE username=cast(%s as char)'
            # cursor.execute(select_role, (username,merchant_id))
            # Role_check = cursor.fetchall()
            # #print(Role_check[0][0])
            # alwd_role=['superowner']
            # if Role_check[0][0] in alwd_role:
            #     pass
            # else:
            #     response = {
            #             "status": "error",
            #             "code": 403,
            #             "data": "",
            #             "message": "Permission Denied",}
            #     raise tornado.web.Finish(response)
            old_pass=hashlib.sha224(old_pass.encode()).hexdigest()
            checklogin=check_login(username,old_pass)
            if checklogin==1:
                pattern = re.compile("^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$")
                if pattern.match(new_pass):
                    new_pass = hashlib.sha224(new_pass.encode()).hexdigest()
                else:
                    response = {
                            "status": "error",
                            "code": 400,
                            "data": "",
                            "message": "password must include Minimum eight characters, at least one letter, one number and one special character",}
                    raise tornado.web.Finish(response)
                pass_update="UPDATE merchant SET password=%s WHERE username=%s"
                cursor.execute(pass_update, (new_pass,user_id))
                connection.commit()
                response = {
                        "status": "success",
                        "code": 200,
                        "data": "",
                        "message": "password changed sucessfully",}
                #print("response",response)
                self.write(response)

            else:
                response = {
                        "status": "error",
                        "code": 403,
                        "data": "",
                        "message": "Incorrect password",}
        except:
            response = {
                        "status": "error",
                        "code": 500,
                        "data": "",
                        "message": "Somthing went wrong",}
