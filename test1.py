import tornado.web
import tornado.ioloop
import requests
import time
import os
import pymysql
from validation import *
from tornado import httpserver ,options
from auth import *
from db import *

host = 'localhost'

class My404Handler(tornado.web.RequestHandler):
    # Override prepare() instead of get() to cover all possible HTTP methods.
    def prepare(self):
        self.set_status(404)
        self.render("notfound.html")


@jwtauth
class tables(tornado.web.RequestHandler):
    def get(self):
        self.render('confirm.html')

@jwtauth
class test23(tornado.web.RequestHandler):
    def get(self):
        self.render("payment.html",error = None)

    def post(self):
        form = Test(self.request.arguments)
        print("hello")
        if form.validate():
            print("123456789")
            owner = form.data['owner']
            cardnumber = form.data['cardnumber']
            expiry_date = form.data['date']
            cvv = form.data['cvv']
            zip = form.data['addressZip']
            amount = form.data['amount']
            print(owner, cardnumber, cvv, expiry_date)

            if owner and cardnumber and expiry_date and cvv and zip and amount:
                print("length", len(expiry_date[:2]))
                #
                # if len(expiry_date[:2]) == 1:
                #
                #     expiry_date = "0" + expiry_date
                #     print("Changed to: " + expiry_date)


                myDate = (time.strftime("%m/%Y"))
                print("mydate",type(myDate),myDate)
                print("date",type(expiry_date),expiry_date)


                month = expiry_date[:2]
                year = expiry_date[-2:]
                live_month =  myDate[:2]
                live_year =  myDate[-2:]
                print("asddasda", expiry_date[:2],myDate[:2])
                if year >= live_year:
                    if int(month) <= 12 and int(month) >= 1:
                        customer_id = 'c9ca38cb-603b-11e9-bcdd-966a0a06784e'

                        card_data = {'customerId': customer_id, 'number': cardnumber, 'exp_month': month,
                                     'exp_year': year, 'cvc': cvv, 'cardholdername': owner, 'addressZip': zip}

                        url = 'http://localhost:8888/api/v1/card/create'
                        headers = {'content-type': 'application/json'}
                        r = requests.post(url, card_data, headers)

                        connection = pymysql.connect(host='localhost', user='root', password='', db='payment_gateway')
                        cursor = connection.cursor()
                        sql = "SELECT card_id FROM cards WHERE first6= %s AND last4= %s AND expMonth= %s AND expYear =%s"
                        cursor.execute(sql, (cardnumber[:6], cardnumber[-4:], month, year))
                        record = cursor.fetchall()

                        # time.sleep(1)

                        charge_data = {'amount': amount, 'currency': 'USD', 'description': 'charge',
                                       'customerId': customer_id, 'card': record[0][0]}
                        url = 'http://localhost:8888/api/v1/charge/create'
                        headers = {'content-type': 'application/json'}
                        r = requests.post(url, charge_data, headers)
                        # time.sleep(1)

                        connection = pymysql.connect(host='localhost', user='root', password='', db='payment_gateway')
                        cursor = connection.cursor()
                        sql = "SELECT id FROM charge WHERE card_id = %s"
                        cursor.execute(sql, (record[0][0]))
                        record = cursor.fetchall()

                        self.render('confirm.html', ID=record, amount=amount)

                    else:
                        self.re
                        print("month expired")

                else:
                    print("year Expired")

                # if expiry_date[:2] >= str(12):
                #     print("card not valid")
                # elif expiry_date[-2:] < myDate[-2:]:
                #     print("card expired")
                #
                # elif expiry_date[-2:] == myDate[-2:]:
                #     if expiry_date[:2] < myDate[:2]:
                #         print("Card expired or card not valid")
                #     elif expiry_date[:2] == myDate[:2]:
                #         print("card not expired")
                # else:
                #     print(" Card not expired. ")



            else:
                self.redirect('/customers')
        else:

            error_dict = {"owner": None, "cardnumber": None, "date": None, "cvv": None, "addressZip": None,"amount": None}
            print(form.errors)
            Error = dict(form.errors)
            for i in list(Error.keys()):
                error_dict[i] = Error[i]

            self.render("payment.html", error=error_dict)






settings = {
    "debug": True,
    "static_path": os.path.join(os.path.dirname(__file__), "static"),
    "template_path": os.path.join(os.path.dirname(__file__), "template")
}


def make_app():
    tornado.options.parse_command_line()
    application = tornado.web.Application([

        ("/customers", test23),
        ("/confirm", tables),
        (r'(.*)', My404Handler),

        (r"/(template)", tornado.web.StaticFileHandler,
         dict(path=settings['template_path'])),
        (r"/(static)", tornado.web.StaticFileHandler,
         dict(path=settings['static_path']))
    ], **settings)

    http_server = tornado.httpserver.HTTPServer(application)
    http_server.listen(8889)


if __name__ == '__main__':
    app = make_app()

    tornado.ioloop.IOLoop.current().start()
