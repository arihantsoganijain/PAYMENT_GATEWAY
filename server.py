#Admin Urls imports


import tornado.web
import tornado.ioloop
from customers import *
from plan import *
from card import *
from event import *
from subscription import *
from token123 import *
from credit import *
from file_upload import *
from blacklist import *
from charge import *
from disputes import *
from checkout import *
from crosssale import *
from tornado import httpserver, options
from signup_login import *
from log_filter import *
from log import *
from admin_dashboard import *
from password import *
from payout import *
from payout_corn import *
from managemerchant import *
from usercheckout.checkoutuser import *
#Merchant Urls imports

from merchant.customers import *
from merchant.plan import *
from merchant.card import *
from merchant.event import *
from merchant.subscription import *
from merchant.token123 import *
from merchant.credit import *
from merchant.file_upload import *
from merchant.blacklist import *
from merchant.charge import *
from merchant.disputes import *
from merchant.checkout import *
from merchant.crosssale import *
from merchant.signup_login import *
from merchant.log_filter import *
from merchant.log import *
from merchant.password import *
from merchant.merchant_dashboard import *
from merchant.widget import *
from merchant.account import *
from merchant.partners import *
from merchant.account import *
from merchant.payout import *
class My404Handler(tornado.web.RequestHandler):
    # Override prepare() instead of get() to cover all possible HTTP methods.
    def prepare(self):
        self.set_status(404)
        response = {
            "status": "error",
            "code": 404,
            "data": "null",
            "message": "path not found",
        }
        raise tornado.web.Finish(response)

settings = {
    "debug": True,
    "static_path": os.path.join(os.path.dirname(__file__), "static"),
    "template_path": os.path.join(os.path.dirname(__file__), "template")
}


def make_app():
    tornado.options.parse_command_line()
    application = tornado.web.Application([
        # ADDRESS                                              # URLS

        ("/api/v1/charge/create", charge),                     # Charge Create
        ("/api/v1/customer/create", customer),                 # Customer Create
        ("/api/v1/customer/update", customer_update),          # Customer Create
        ("/api/v1/charge/update", charge_update),              # Charge Update
        ("/api/v1/card/create", card),                         # Card Create
        ("/api/v1/card/update", card_update),                  # Card Update
        ("/api/v1/plan/create", plan),                         # Plan Create
        ("/api/v1/plan/update", plan_update),                  # Plan Update
        ("/api/v1/subscription/create", subscription_create),  # Subscription Create
        ("/api/v1/subscription/update", subscription_update),  # Subscription Update
        ("/api/v1/event/retrive", event),                      # Event Retrieve
        ("/api/v1/common/event/retrive", com_event),           # comEvent Retrieve
        ("/api/v1/customer/event/retrive", cus_event),           # customerEvent Retrieve
        ("/api/v1/common/log/retrive", com_log),           # comEvent Retrieve
        ("/api/v1/customer/log/retrive", cus_log),           # customer Event Retrieve
        ("/api/v1/token/create", token),                       # Token create
        ("/api/v1/file_upload", upload),                       # File Upload
        ("/api/v1/credit/create", credit),                     # Credit Create
        ("/api/v1/credit/update", credit_update),              # Credit Update
        ("/api/v1/blacklist/create", blacklist),               # Blacklist
        ("/api/v1/checkout/create", Checkout),                 # Checkout Create
        ("/api/v1/crossSaleOffer/create", CrossSale),          # crossSaleOffer Create
        ("/api/v1/crossSaleOffer/update", CrossSaleUpdate),    # crossSaleOffer Update
        ("/api/v1/crossSaleOffer/delete", delete_crosssale),   # crossSaleOffer delete
        ("/api/v1/charge/capture", charge_capture),            # Charge Capture
        ("/api/v1/charge/refund", charge_refund),              # Charge Refund
        ("/api/v1/charge/list", list_charge),                  # List Charge
        ("/api/v1/customer/list", list_customer),              # List Customer
        ("/api/v1/card/list", list_card),                      # List Card
        ("/api/v1/plan/list", list_plan),                      # List Plan
        ("/api/v1/subscriptions/list", list_subscriptions),    # List Subscription
        ("/api/v1/event/list", list_event),                    # List Event
        ("/api/v1/blacklist/list", list_Blacklist_Rules),      # List Blacklist
        ("/api/v1/CrossSaleOffer/list", list_CrossSaleOffer),  # List crossSaleOffer
        ("/api/v1/file_upload/list", list_file_upload),        # List File Upload
        ("/api/v1/credit/list", list_credit),                  # List Credit
        # ("/api/v1/customer/signup", Signup),                   # Customer Signup
        ("/api/v1/customer/login", Login),                     # Customer Login
        ("/api/v1/customer/logout", logout),                   # Customer Logout
        ("/api/v1/dispute/create", disputes),                  # dispute create
        ("/api/v1/dispute/update", dispute_update),            # dispute update
        ("/api/v1/card/delete", delete_card),                  # caadmin_dashboardrd delete
        ("/api/v1/subscription/delete", delete_subscription),  # suadmin_dashboardbscription delete
        ("/api/v1/blacklist/delete", delete_blacklist),        # bladmin_dashboardacklist delete
        ("/api/v1/crosssale/delete", delete_crosssale),        # cradmin_dashboardosssale delete
        ("/api/v1/customers/delete", delete_customers),        # cuadmin_dashboardstomers delete
        ("/api/v1/plans/delete", delete_plan),                 # pladmin_dashboardan delete
        # ("/api/v1/customer/Signup_2fa", Signup_2fa),           # admin_dashboardcustomer 2 factor Authorisation
        ("/api/v1/log/retrive", log),                          # loadmin_dashboardg Retrieve
        ("/api/v1/log/list", list_log),                        #logadmin_dashboard list
        ("/api/v1/dashboard", admin_dashboard),                #   admin_dashboard dashboard
        ("/api/v1/graph", admin_graph),                        #admin graph
        ("/api/v1/dashboard", admin_pass_change),              # adadmin_dashboardmin password change
        ("/api/v1/charge/filter", filter_charges),           # charge filter
        ("/api/v1/event/filter", event_filter),              # event_filter
        # ("/api/v1/customer/twofa/refresh", refresh2fa),      # customer refresh 2 factor Authorisation
        ("/api/v1/blacklist/filter", blacklist_filter),      # blacklist_filter
        ("/api/v1/log/filter", log_filter),                  # log_filter
        ("/api/v1/crosssale/filter", crosssale_filter),      # crosssale_filter
        ("/api/v1/customer/filter",customer_filter),
        ("/api/v1/payout/list",admin_payout),
        ("/api/v1/checkout/create",Checkout),
        ("/api/v1/payout/response",payout_response),
        ("/api/v1/payout/generate",payout_corn),
        ("/api/v1/merchant/list",list_merchant),
        ("/api/v1/merchant/retive",merchant_retrive),
        ("/api/v1/singlepayout/generate",payout_gen),
# MERCHANT URLS_---------------------------------------------------------------------------------------------------------



        ("/merchant/api/v1/charge/create", merchant_charge),  # Charge Create
        ("/merchant/api/v1/customer/create", merchant_customer),  # Customer Create
        ("/merchant/api/v1/customer/update", merchant_customer_update),  # Customer Create
        ("/merchant/api/v1/charge/update", merchant_charge_update),  # Charge Update
        ("/merchant/api/v1/card/create", merchant_card),  # Card Create
        ("/merchant/api/v1/card/update", merchant_card_update),  # Card Update
        ("/merchant/api/v1/plan/create", merchant_plan),  # Plan Create
        ("/merchant/api/v1/plan/update", merchant_plan_update),  # Plan Update
        ("/merchant/api/v1/subscription/create", merchant_subscription_create),  # Subscription Create
        ("/merchant/api/v1/subscription/update", merchant_subscription_update),  # Subscription Update
        ("/merchant/api/v1/event/retrive", merchant_event),  # Event Retrieve
        ("/merchant/api/v1/common/event/retrive", merchant_com_event),  # comEvent Retrieve
        ("/merchant/api/v1/customer/event/retrive", merchant_cus_event),  # customerEvent Retrieve
        ("/merchant/api/v1/common/log/retrive", merchant_com_log),  # comEvent Retrieve
        ("/merchant/api/v1/customer/log/retrive", merchant_cus_log),  # customer Event Retrieve
        ("/merchant/api/v1/token/create", merchant_token),  # Token create
        ("/merchant/api/v1/file_upload", merchant_upload),  # File Upload
        ("/merchant/api/v1/credit/create", merchant_credit),  # Credit Create
        ("/merchant/api/v1/credit/update", merchant_credit_update),  # Credit Update
        ("/merchant/api/v1/blacklist/create", merchant_blacklist),  # Blacklist
        ("/merchant/api/v1/checkout/create", merchant_Checkout),  # Checkout Create
        ("/merchant/api/v1/crossSaleOffer/create", merchant_CrossSale),  # crossSaleOffer Create
        ("/merchant/api/v1/crossSaleOffer/update", merchant_CrossSaleUpdate),  # crossSaleOffer Update
        ("/merchant/api/v1/crossSaleOffer/delete", merchant_delete_crosssale),  # crossSaleOffer delete
        ("/merchant/api/v1/charge/capture", merchant_charge_capture),  # Charge Capture
        ("/merchant/api/v1/charge/refund", merchant_charge_refund),  # Charge Refund
        ("/merchant/api/v1/charge/list", merchant_list_charge),  # List Charge
        ("/merchant/api/v1/customer/list", merchant_list_customer),  # List Customer
        ("/merchant/api/v1/card/list", merchant_list_card),  # List Card
        ("/merchant/api/v1/plan/list", merchant_list_plan),  # List Plan
        ("/merchant/api/v1/subscriptions/list", merchant_list_subscriptions),  # List Subscription
        ("/merchant/api/v1/event/list", merchant_list_event),  # List Event
        ("/merchant/api/v1/blacklist/list", merchant_list_Blacklist_Rules),  # List Blacklist
        ("/merchant/api/v1/CrossSaleOffer/list", merchant_list_CrossSaleOffer),  # List crossSaleOffer
        ("/merchant/api/v1/file_upload/list", merchant_list_file_upload),  # List File Upload
        ("/merchant/api/v1/credit/list", merchant_list_credit),  # List Credit
        ("/merchant/api/v1/customer/signup", merchant_Signup),  # Customer Signup
        ("/merchant/api/v1/customer/login", merchant_Login),  # Customer Login
        ("/merchant/api/v1/customer/logout", merchant_logout),  # Customer Logout
        ("/merchant/api/v1/dispute/create", merchant_disputes),  # dispute create
        ("/merchant/api/v1/dispute/update", merchant_dispute_update),  # dispute update
        ("/merchant/api/v1/card/delete", merchant_delete_card),  # card delete
        ("/merchant/api/v1/subscription/delete", merchant_delete_subscription),  # subscription delete
        ("/merchant/api/v1/blacklist/delete", merchant_delete_blacklist),  # blacklist delete
        ("/merchant/api/v1/crosssale/delete", merchant_delete_crosssale),  # crosssale delete
        ("/merchant/api/v1/customers/delete", merchant_delete_customers),  # customers delete
        ("/merchant/api/v1/plans/delete", merchant_delete_plan),  # plan delete
        ("/merchant/api/v1/customer/Signup_2fa", merchant_Signup_2fa),  # customer 2 factor Authorisation
        ("/merchant/api/v1/log/retrive", merchant_log),  # log Retrieve
        ("/merchant/api/v1/log/list", merchant_list_log),  # log list
        ("/merchant/api/v1/passsword/change", pass_change),  # password change
        ("/merchant/api/v1/dashboard", dashboard),          #merchant Dashboard
        ("/merchant/api/v1/graph", d_graph),          #merchant graph
        ("/merchant/api/v1/widget", widget),          #merchant Dashboard
        ("/merchant/api/v1/send_code", Email_send),
        ("/merchant/api/v1/verify_code",Email_verify),
        ("/merchant/api/v1/account_name/change",acc_name_change),
        ("/merchant/api/v1/curency/change",currency_change),
        ("/merchant/api/v1/charge/filter", merchant_filter_charges),           # charge filter
        ("/merchant/api/v1/event/filter", merchant_event_filter),              # event_filter
        # ("/api/v1/customer/twofa/refresh", refresh2fa),      # customer refresh 2 factor Authorisation
        ("/merchant/api/v1/blacklist/filter", merchant_blacklist_filter),      # blacklist_filter
        ("/merchant/api/v1/log/filter", merchant_log_filter),                  # log_filter
        ("/merchant/api/v1/crosssale/filter", merchant_crosssale_filter),      # crosssale_filter
        ("/merchant/api/v1/customer/filter",merchant_customer_filter),
        ("/merchant/api/v1/new_account/create",new_account),

        ("/merchant/api/v1/partner/request", partner_request),      # crosssale_filter
        ("/merchant/api/v1/partner/response",partner_response),
        ("/merchant/api/v1/partner/list",partner),
        ("/merchant/api/v1/partner/delete",partner_delete),
        ("/merchant/api/v1/partner/filter",merchant_partner_filter),
        ("/merchant/api/v1/user/add",user_add),
        ("/merchant/api/v1/payout/list",merchant_payout),





        (r'(.*)',  My404Handler),

        (r"/(template)", tornado.web.StaticFileHandler,
         dict(path=settings['template_path'])),
        (r"/(static)", tornado.web.StaticFileHandler,
         dict(path=settings['static_path']))
    ],**settings)

    http_server = tornado.httpserver.HTTPServer(application)
    http_server.listen(8890)





if __name__ == '__main__':
    app = make_app()

    tornado.ioloop.IOLoop.current().start()
