import tornado.web
import tornado
import tornado.ioloop
import pyaes
import time
import uuid
import pymysql
import json
from remove_tags import *
import hashlib
from auth import *
from cross_origin import *


# class log_filter(BaseHandler):
#     def get(self):
#         first_date = (self.get_argument('first_date', False))
#         last_date = (self.get_argument('last_date', False))
#         charge_id = (self.get_argument('charge_id', False))
#         customer_id = (self.get_argument('customer_id', False))
