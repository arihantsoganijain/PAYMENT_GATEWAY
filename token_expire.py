import redis
import jwt
import time
from db import *


redis_host = "localhost"
redis_port = 6379
redis_password = ""

options = {
    'verify_signature': True,
    'verify_exp': True,
    'verify_nbf': False,
    'verify_iat': True,
    'verify_aud': False
}

def Addblacklist(token):

    c=jwt.decode(token,'my_secret_key',options=options,algorithm='HS256')
    exp_time=c['exp']

    curr_time = time.time()
    r = redis.StrictRedis(host=redis_host, port=redis_port, password=redis_password, decode_responses=True)
    r.set(token, str(token), ex=int(exp_time-curr_time))

def Check_Blacklist(token):
    r = redis.StrictRedis(host=redis_host, port=redis_port, password=redis_password, decode_responses=True)
    z=r.get(token)
    return z
