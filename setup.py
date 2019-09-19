import hashlib

HOST='localhost'
user='techkopra'
paswd='techkopra123'
db='Payment_gateway1'


username='superadmin'
full_name='Amalpay'
email='amalpay@gmail.com'
password='amalpay@123'
secret_code='H32DP7GZ76LQA4OG'
countrycode='+91'
phone="7777777777"
Role='superowner'
isphone=1
isemail=1
isGA=1
pcode='hlbmsx'
ecode='ehglxg'
isBanned=0
lockuntill=0
referalid=''

password1 = hashlib.sha224(password.encode()).hexdigest()
email_host = "callthedocapk@gmail.com"
email_pass = "Callthedoc@123"
merchantroleurl=""