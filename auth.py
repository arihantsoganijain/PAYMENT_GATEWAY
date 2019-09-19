import jwt
from token_expire import *
from setup import *
from cross_origin import *
secret_key = 'my_secret_key'
options = {
    'verify_signature': True,
    'verify_exp': True,
    'verify_nbf': False,
    'verify_iat': True,
    'verify_aud': False
}
class BaseHandler(tornado.web.RequestHandler):

    def set_default_headers(self):
        #print ("setting headers!!!")
        self.set_header("Access-Control-Allow-Origin", "*")
        self.set_header("Access-Control-Allow-Headers", "x-requested-with")
        self.set_header('Access-Control-Allow-Methods', 'POST, GET, OPTIONS')
        
    def post(self):
        self.write('some post')

    def get(self):
        self.write('some get')

    def options(self):
        # no body
        self.set_status(204)
        self.finish()
# a=BaseHandler
def jwtauth(handler_class):
    ''' Handle Tornado JWT Auth '''
    # #print("yyyyyyyyyyyyyyyyyyyyyyyyy")
    # tornado.web.RequestHandler.set_header("Access-Control-Allow-Origin", "*")
    # tornado.web.RequestHandler.set_header("Access-Control-Allow-Headers", "x-requested-with")
    # tornado.web.RequestHandler.set_header('Access-Control-Allow-Methods', 'POST, GET, OPTIONS')
    # #print("zzzzzzzzzzzzzzzzzzzzzzzzzz")
    def wrap_execute(handler_execute):
        def require_auth(handler, kwargs):

            # header = handler.request.headers.get('*')
            #print("---------------")
            auth = handler.request.headers.get('Authorization')
            #print("5---------------",auth)
            if auth:
                parts = auth.split()

                if parts[0].lower() != 'bearer':
                    handler._transforms = []
                    handler.set_status(401)
                    handler.write("invalid header authorization")
                    handler.finish()
                elif len(parts) == 1:
                    handler._transforms = []
                    handler.set_status(401)
                    handler.write("invalid header authorization")
                    handler.finish()
                elif len(parts) > 2:
                    handler._transforms = []
                    handler.set_status(401)
                    handler.write("invalid header authorization")
                    handler.finish()
                #print("1---------------")
                token = parts[1]
                if Check_Blacklist(token)==None:
                    #print("2---------------")
                    try:
                        #print('fgfgfgfg')
                        a=jwt.decode(
                            token,
                            secret_key,
                            options=options,algorithm='HS256'
                        )
                        connection, cursor = db_connect()
                        sql_select = "SELECT * FROM merchant WHERE user_id = %s"
                        cursor.execute = (sql_select,(username))
                        #print("endof deco")
                        # if a['user_id'] == username:
                        #     pass:
                        # else:
                        #     response = {
                        #     "status": "error",
                        #     "code": 403,
                        #     "data": "",
                        #     "message": "Permission Denied",}
                            # raise tornado.web.Finish(response)

                    except Exception as e:

                        #print("3---------------")
                        handler._transforms = []
                        handler.set_status(401)
                        handler.write(e.message)
                        handler.finish()
                else:
                    handler._transforms = []
                    handler.write("Please login First")
                    handler.finish()
            else:
                handler._transforms = []
                handler.write("Missing authorization")
                handler.finish()

            return True

        def _execute(self, transforms, *args, **kwargs):

            try:
                require_auth(self, kwargs)
            except Exception:
                return False

            return handler_execute(self, transforms, *args, **kwargs)

        return _execute
        

    handler_class._execute = wrap_execute(handler_class._execute)
    return handler_class
