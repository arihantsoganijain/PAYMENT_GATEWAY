import tornado
import tornado.web
# import tornado-cors
class BaseHandler(tornado.web.RequestHandler):

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

        self.set_header("Access-Control-Allow-Headers", "x-requested-with,access-control-allow-origin,X-PINGOTHER,authorization,browser,ipaddress,platform")
        #print("set headers!!!")

    def post(self):
        self.write('some post')

    def get(self):
        self.write('some get')

    # def options(self):
    #     # no body
    #     self.set_status(204)
    #     self.finish()

    # def set_default_headers(self):
    #     print("setting headers!!!")
    #     self.set_header("Access-Control-Allow-Origin", "*")
    #     self.set_header("Access-Control-Allow-Headers", "*")
    #     self.set_header('Access-Control-Allow-Methods', 'POST, GET,')
    #     self.set_header("Access-Control-Allow-Headers", "access-control-allow-origin,authorization,content-type")


    # def post(self):
    #     self.write('some post')

    # def get(self):
    #     self.write('some get')

    # def options(self):
    #     # no body
    #     self.set_status(204)
    #     self.finish()

