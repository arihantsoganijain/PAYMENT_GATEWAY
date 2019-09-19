import pymysql
from setup import *
from db import *
import hashlib


def migration():
    # try:
        print("start")
        connection,cursor = sql_connect()
        database_query = "CREATE DATABASE IF NOT EXISTS {}".format(db)
        cursor.execute(database_query)
        print("charge database")
        connection.commit()

        connection,cursor = db_connect()
        sql_charge = "CREATE TABLE IF NOT EXISTS charge (id VARCHAR(36) PRIMARY KEY NOT NULL,created DECIMAL(18,7),objectType VARCHAR(255) NOT NULL,amount FLOAT(25,5),currency VARCHAR(3),description VARCHAR(100),customerId VARCHAR(36),card_id VARCHAR(41),captured TINYINT(1),refunded TINYINT(1),disputed TINYINT(1),dispute_id VARCHAR(255),fraud_status VARCHAR(255),fraud_score VARCHAR(255),cso_id VARCHAR(255),failureCode VARCHAR(255),failureMessage VARCHAR(255),metadata VARCHAR(200),refunded_amt FLOAT(25,5),merchant_id VARCHAR(200) NOT NULL)"
        cursor.execute(sql_charge)
        print("charge table")
        sql_shipping = "CREATE TABLE IF NOT EXISTS shipping (charge_id VARCHAR(36) PRIMARY KEY, sh_name VARCHAR(36),sh_address1 VARCHAR(255),sh_address2 VARCHAR(255),sh_zip FLOAT(6,0),sh_city VARCHAR(255),sh_state VARCHAR(41),sh_country VARCHAR(255),bil_name VARCHAR(36),bil_address1 VARCHAR(255),bil_address2 VARCHAR(255),bil_zip FLOAT(6,0),bil_city VARCHAR(255),bil_state VARCHAR(41),bil_country VARCHAR(255),vat VARCHAR(255),merchant_id VARCHAR(200) NOT NULL)"
        cursor.execute(sql_shipping)
        print("shipping table")
        connection.commit()


        sql_customer = "CREATE TABLE IF NOT EXISTS customers (id VARCHAR(36) PRIMARY KEY,created DECIMAL(18,7),objectType VARCHAR(255),email VARCHAR(30),description VARCHAR(255),defaultCardId VARCHAR(41),metadata VARCHAR(255), merchant_id VARCHAR(200) NOT NULL)"
        cursor.execute(sql_customer)
        print("customer table")



        sql_card = "CREATE TABLE IF NOT EXISTS cards(card_id VARCHAR(41) PRIMARY KEY, created DECIMAL(18,7),objectType VARCHAR(255),first6 INT(6),last4 INT(6),fingerprint VARCHAR(56),expMonth INT(2),expYear INT(2),cardholderName VARCHAR(20),customerId VARCHAR(41),brand VARCHAR(20),type VARCHAR(6),country VARCHAR(15),addressLine1 VARCHAR(200) ,addressLine2 VARCHAR(200), addressCity VARCHAR(200), addressState VARCHAR(200),addressZip INTEGER(6), addressCountry VARCHAR(20), ipAddress VARCHAR(20), email VARCHAR(30),userAgent VARCHAR(200),acceptLanguage VARCHAR(20), merchant_id VARCHAR(200) NOT NULL)"
        cursor.execute(sql_card)
        print("card table")
        connection.commit()



        sql_subscription = "CREATE TABLE IF NOT EXISTS subscription(sub_id VARCHAR(41) PRIMARY KEY,created DECIMAL(18,7),objectType VARCHAR(255),planId VARCHAR(200),customer_id VARCHAR(200),quantity INT(10),captureCharges TINYINT(1),status_trialing VARCHAR(200),status_active VARCHAR(200),status_past_due VARCHAR(200),status_canceled VARCHAR(200),status_unpaid VARCHAR(200),remainingBillingCycles INT(41),start FLOAT(255,20),currentPeriodStart  FLOAT(255,20),currentPeriodEnd  FLOAT(255,20),canceledAt FLOAT(255,20) ,endedAt FLOAT(255,20), trialStart FLOAT(255,20), trialEnd FLOAT(255,20),cancelAtPeriodEnd TINYINT(1), sh_name VARCHAR(200), sh_address1 VARCHAR(200), sh_address2 VARCHAR(200),sh_zip INT(6),sh_city VARCHAR(20),sh_state VARCHAR(20), sh_country VARCHAR(20), bil_name VARCHAR(200),bil_address1 VARCHAR(200),bil_address2 VARCHAR(200),bil_zip INT(6), bil_city VARCHAR(20), bil_state VARCHAR(30),bil_country VARCHAR(20),vat VARCHAR(200),metadata VARCHAR(200), merchant_id VARCHAR(200) NOT NULL)"
        cursor.execute(sql_subscription)
        print("subscription table")
        connection.commit()



        sql_plan = "CREATE TABLE IF NOT EXISTS plan(plan_id VARCHAR(41) PRIMARY KEY,created DECIMAL(18,7),objectType VARCHAR(255),amount FLOAT(200,10),currency VARCHAR(200),intervals VARCHAR(200),intervalCount INT(10),billingCycles VARCHAR(200),name VARCHAR(200),trialPeriodDays INT(10),recursTo VARCHAR(200),metadata VARCHAR(200), merchant_id VARCHAR(200) NOT NULL)"
        cursor.execute(sql_plan)
        print("plan table")
        connection.commit()





        sql_event = "CREATE TABLE IF NOT EXISTS event(event_id VARCHAR(100) PRIMARY KEY,created DECIMAL(18,7),objectType VARCHAR(255),type VARCHAR(200) , data VARCHAR(200),log VARCHAR(200),com_id VARCHAR(255),customer_id VARCHAR(255), merchant_id VARCHAR(200) NOT NULL)"
        cursor.execute(sql_event)
        print("event table")
        sql_data = "CREATE TABLE IF NOT EXISTS data(data_id VARCHAR(100) PRIMARY KEY,created DECIMAL(18,7),objectType VARCHAR(255),amount FLOAT(200,10),currency VARCHAR(200),description VARCHAR(200) ,card VARCHAR(255),captured TINYINT(1),refunded TINYINT(1),desputed TINYINT(1), merchant_id VARCHAR(200) NOT NULL)"
        cursor.execute(sql_data)
        print("data table")
        connection.commit()



        sql_token = "CREATE TABLE IF3453,first6 INT(6),last4 INT(6),fingerprint VARCHAR(255),expMonth INT(2),expYear INT(2),brand VARCHAR(10) ,type VARCHAR(20),cardholderName VARCHAR(20),addressLine1 VARCHAR(200) ,addressLine2 VARCHAR(200), addressCity VARCHAR(200), addressState VARCHAR(200),addressZip INTEGER(6), addressCountry VARCHAR(20), used TINYINT(1), card_id VARCHAR(41),ipAddress VARCHAR(20), ipCountry VARCHAR(20),email VARCHAR(20),userAgent VARCHAR(200),acceptLanguage VARCHAR(20),3D_currency VARCHAR(10), 3D_enrolled TINYINT(1), 3D_liabilityShift VARCHAR(41), merchant_id VARCHAR(200) NOT NULL)"
        cursor.execute(sql_token)
        print("token table")

        connection.commit()

        sql_disputes = "CREATE TABLE3453(255),updated DECIMAL(18,7),amount FLOAT(255,5),currency VARCHAR(56),status VARCHAR(200),reason VARCHAR(200),acceptedAsLost TINYINT(1), chargeId VARCHAR(255), hasEvidence TINYINT(1) ,submissionCount INT(10), merchant_id VARCHAR(200) NOT NULL)"
        cursor.execute(sql_disputes)3453
        print("disputes table")

        connection.commit()

        sql_disputes_evidence = "CREATE TABLE IF NOT EXISTS disputes_evidence(dispute_id VARCHAR(255), productDescription VARCHAR(255),customerName VARCHAR(255),customerEmail VARCHAR(255)" \
                                ",customerPurchaseIp VARCHAR(255),customerSignature VARCHAR(255),billingAddress VARCHAR(200),receipt VARCHAR(200)," \
                                "customerCommunication  VARCHAR(200) ,serviceDate VARCHAR(200),serviceDocumentation VARCHAR(200)," \
                                "duplicateChargeId VARCHAR(200) ,duplicateChargeDocumentation  VARCHAR(200),duplicateChargeExplanation VARCHAR(255)" \
                                ",refundPolicy VARCHAR(255),refundPolicyDisclosure VARCHAR(255),refundRefusalExplanation VARCHAR(255),cancellationPolicy VARCHAR(200)," \
                                "cancellationPolicyDisclosure VARCHAR(200),cancellationRefusalExplanation VARCHAR(200),accessActivityLogs  VARCHAR(200) ," \
                                "shippingAddress VARCHAR(200),shippingDate VARCHAR(200),shippingCarrier VARCHAR(200) ,shippingTrackingNumber  VARCHAR(200)," \
                                "shippingDocumentation VARCHAR(200),uncategorizedText VARCHAR(200) ,uncategorizedFile  VARCHAR(200), merchant_id VARCHAR(200) NOT NULL)"
        cursor.execute(sql_disputes_evidence)
        print("sql_disputes_database")
        connection.commit()




        sql_upload = "CREATE TABLE IF NOT EXISTS upload(file_id VARCHAR(41) PRIMARY KEY, created DECIMAL(18,7), objectType VARCHAR(255), purpose VARCHAR(30), size INT(10), type VARCHAR(10), url VARCHAR(10), merchant_id VARCHAR(200) NOT NULL)"
        cursor.execute(sql_upload)
        print("upload table")
        connection.commit()






        sql_credit = "CREATE TABLE IF NOT EXISTS credit(credit_id VARCHAR(255) PRIMARY KEY, created DECIMAL(18,7), objectType VARCHAR(255),amount INT(10), currency VARCHAR(10),card_Id VARCHAR(41), description VARCHAR(255), customer_Id VARCHAR(41), metadata VARCHAR(41), 3D_amount INT(10), 3D_currency VARCHAR(10), 3D_enrolled TINYINT(1), 3D_liabilityShift VARCHAR(41), failureCode VARCHAR(41), failureMessage VARCHAR(41), merchant_id VARCHAR(200) NOT NULL)"
        cursor.execute(sql_credit)
        print("credit table")
        connection.commit()



        sql_blacklist = "CREATE TABLE IF NOT EXISTS blacklist(black_id VARCHAR(255) PRIMARY KEY, created DECIMAL(18,7), objectType VARCHAR(255),ruleType VARCHAR(255), fingerprint VARCHAR(200),ipAddress VARCHAR(200), ipCountry VARCHAR(255), metadataKey VARCHAR(200), metadataValue VARCHAR(200), email VARCHAR(200), userAgent VARCHAR(200), acceptLanguage VARCHAR(200), merchant_id VARCHAR(200) NOT NULL)"
        cursor.execute(sql_blacklist)
        print("blacklist table")
        connection.commit()



        sql_checkout = "CREATE TABLE IF NOT EXISTS Checkout(charge_amount FLOAT(255,20),charge_currency VARCHAR(3),charge_capture TINYINT(1),charge_metadata VARCHAR(255),subscription_planId VARCHAR(41),subscription_captureCharges TINYINT(1),subscription_metadata VARCHAR(255),customCharge_amountOptions FLOAT(255,20),customCharge_customAmount FLOAT(255,20),customCharge_currency VARCHAR(3),customCharge_capture TINYINT(1),customCharge_metadata VARCHAR(255),customerId VARCHAR(41),crossSaleOfferIds VARCHAR(41),rememberMe TINYINT(1) ,termsAndConditionsUrl VARCHAR(255),3D_enable TINYINT(1),3D_requireEnrolledCard TINYINT(1) ,3D_requireSuccessfulLiabilityShiftForEnrolledCard TINYINT(1), merchant_id VARCHAR(200) NOT NULL)"
        cursor.execute(sql_checkout)
        connection.commit()



        sql_crosssale = "CREATE TABLE IF NOT EXISTS CrossSaleOffer(cso_id VARCHAR(100) PRIMARY KEY, created DECIMAL(18,7), objectType VARCHAR(255), charge_amount FLOAT(255,20), charge_currency VARCHAR(3),charge_capture TINYINT(1), subscription_planId VARCHAR(41),subscription_captureCharges TINYINT(1), template VARCHAR(100), title VARCHAR(100), description VARCHAR(100), imageUrl VARCHAR(100), companyName VARCHAR(100), companyLocation VARCHAR(100), termsAndConditionsUrl VARCHAR(100), partnerId VARCHAR(100), visibleForAllPartners TINYINT(1), visibleForPartnerId VARCHAR(255), metadata VARCHAR(255), merchant_id VARCHAR(200) NOT NULL)"
        cursor.execute(sql_crosssale)
        connection.commit()



        sql_deleted_customers = "CREATE TABLE IF NOT EXISTS deleted_customers (id VARCHAR(36) PRIMARY KEY,created DECIMAL(18,7),objectType VARCHAR(255),email VARCHAR(30),description VARCHAR(255),defaultCardId VARCHAR(41),metadata VARCHAR(255), merchant_id VARCHAR(200) NOT NULL)"
        cursor.execute(sql_deleted_customers)
        print("deleted_customer table")


        sql_deleted_card = "CREATE TABLE IF NOT EXISTS deleted_cards(card_id VARCHAR(41) PRIMARY KEY,created DECIMAL(18,7),objectType VARCHAR(255),first6 INT(6),last4 INT(6),fingerprint VARCHAR(56),expMonth INT(2),expYear INT(2),cardholderName VARCHAR(20),customerId VARCHAR(41),brand VARCHAR(20),type VARCHAR(6),country VARCHAR(15),addressLine1 VARCHAR(200) ,addressLine2 VARCHAR(200), addressCity VARCHAR(200), addressState VARCHAR(200),addressZip INTEGER(6), addressCountry VARCHAR(20), ipAddress VARCHAR(20), email VARCHAR(30),userAgent VARCHAR(200),acceptLanguage VARCHAR(20), merchant_id VARCHAR(200) NOT NULL)"
        cursor.execute(sql_deleted_card)
        print("card table")
        connection.commit()



        sql_deleted_plan = "CREATE TABLE IF NOT EXISTS deleted_plan(plan_id VARCHAR(41) PRIMARY KEY,created DECIMAL(18,7),objectType VARCHAR(255),amount FLOAT(200,10),currency VARCHAR(200),intervals VARCHAR(200),intervalCount INT(10),billingCycles VARCHAR(200),name VARCHAR(200),trialPeriodDays INT(10),recursTo VARCHAR(200),metadata VARCHAR(200), merchant_id VARCHAR(200) NOT NULL)"
        cursor.execute(sql_deleted_plan)
        print("plan table")
        connection.commit()



        sql_deleted_blacklist = "CREATE TABLE IF NOT EXISTS deleted_blacklist(black_id VARCHAR(255) PRIMARY KEY, created DECIMAL(18,7), objectType VARCHAR(255),ruleType VARCHAR(255), fingerprint VARCHAR(200),ipAddress VARCHAR(200), ipCountry VARCHAR(255), metadataKey VARCHAR(200), metadataValue VARCHAR(200), email VARCHAR(200), userAgent VARCHAR(200), acceptLanguage VARCHAR(200), merchant_id VARCHAR(200) NOT NULL)"
        cursor.execute(sql_deleted_blacklist)
        print("blacklist table")
        connection.commit()



        sql_deleted_crosssale = "CREATE TABLE IF NOT EXISTS deleted_CrossSaleOffer(cso_id VARCHAR(100) PRIMARY KEY, created DECIMAL(18,7), objectType VARCHAR(255), charge_amount FLOAT(255,20), charge_currency VARCHAR(3),charge_capture TINYINT(1), subscription_planId VARCHAR(41),subscription_captureCharges TINYINT(1), template VARCHAR(100), title VARCHAR(100), description VARCHAR(100), imageUrl VARCHAR(100), companyName VARCHAR(100), companyLocation VARCHAR(100), termsAndConditionsUrl VARCHAR(100), partnerId VARCHAR(100), visibleForAllPartners TINYINT(1), visibleForPartnerId VARCHAR(255), metadata VARCHAR(255), merchant_id VARCHAR(200) NOT NULL)"
        cursor.execute(sql_deleted_crosssale)
        connection.commit()

        sql_user = "CREATE TABLE IF NOT EXISTS user (username VARCHAR(255), full_name VARCHAR(255), email VARCHAR(255), password VARCHAR(255),secret_code VARCHAR(16))"
        cursor.execute(sql_user)
        connection.commit()

        sql_merchant = "CREATE TABLE IF NOT EXISTS merchant (username VARCHAR(255), full_name VARCHAR(255), email VARCHAR(255), password VARCHAR(255),secret_code VARCHAR(16), countrycode VARCHAR(4), phone VARCHAR(12), Role VARCHAR(15), isphone TINYINT(1), isemail TINYINT(1), isGA TINYINT(1), pcode VARCHAR(6), ecode VARCHAR(6), isBanned TINYINT(1), lockuntill DECIMAL(18,7), referalid VARCHAR(10))"
        cursor.execute(sql_merchant)
        connection.commit()
        # password =hashlib.sha224(password.encode()).hexdigest()

        sql_superadmin = "INSERT INTO merchant (username , full_name , email , password ,secret_code , countrycode , phone , Role , isphone , isemail , isGA , pcode , ecode , isBanned , lockuntill , referalid ) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
        cursor.execute(sql_superadmin,(username , full_name , email , password1 ,secret_code , countrycode , phone , Role , isphone , isemail , isGA , pcode , ecode , isBanned , lockuntill , referalid))
        connection.commit()


        sql_merchant_account = "CREATE TABLE IF NOT EXISTS merchant_account (merchant_id VARCHAR(200) NOT NULL,public_key TEXT NOT NULL,secret_key TEXT NOT NULL, account_name VARCHAR(255),Role VARCHAR(15), username VARCHAR(255),currency VARCHAR(3),created DECIMAL(25,5), status VARCHAR(255))"
        cursor.execute(sql_merchant_account)
        connection.commit()

        sql_log="CREATE TABLE IF NOT EXISTS log (log VARCHAR(255), created DECIMAL(18,7), method VARCHAR(20) , url VARCHAR(255), status INT(3), ip_address VARCHAR(20) , source VARCHAR(20) , request_body MEDIUMTEXT, response_body MEDIUMTEXT, merchant_id VARCHAR(200) NOT NULL)"
        cursor.execute(sql_log)
        connection.commit()
        sql_login_logs = "CREATE TABLE IF NOT EXISTS loginlogs(login_id VARCHAR(255) , platform VARCHAR(255), browser VARCHAR(255),ipaddress VARCHAR(255), type VARCHAR(200),created DECIMAL(25,5))"
        cursor.execute(sql_login_logs)
        print("sql_login_logs")
        connection.commit()

        sql_login_partner = "CREATE TABLE IF NOT EXISTS partners(partner1 VARCHAR(255) NOT NULL , username1 VARCHAR(255) NOT NULL, email1 VARCHAR(255) NOT NULL, partner2 VARCHAR(255) NOT NULL , username2 VARCHAR(255) NOT NULL , email2 VARCHAR(255) NOT NULL, created DECIMAL(25,5) NOT NULL, objectType VARCHAR(255) NOT NULL, status VARCHAR(200) NOT NULL)"
        cursor.execute(sql_login_partner)
        print("sql_partner")
        connection.commit()

        sql_payout = "CREATE TABLE IF NOT EXISTS payout(payout_id VARCHAR(255) NOT NULL , created DECIMAL(25,5) NOT NULL, objectType VARCHAR(255) NOT NULL, amount DECIMAL(25,5) NOT NULL ,currency VARCHAR(3), status VARCHAR(255) NOT NULL , payout_till DECIMAL (25,5) NOT NULL, merchant_id VARCHAR(255) NOT NULL, fee DECIMAL(25,5))"
        cursor.execute(sql_payout)
        print("sql_payout")
        connection.commit()
        



        print("DONE")



    # except:
        # print("try again")
migration()