import hmac, base64, struct, hashlib, time, pyqrcode, random, sys, os

def get_hotp_token(secret, intervals_no):
    key = base64.b32decode(secret)
    msg = struct.pack(">Q", intervals_no)
    h = hmac.new(key, msg, hashlib.sha1).digest()
    o = h[19] & 15
    h = (struct.unpack(">I", h[o:o+4])[0] & 0x7fffffff) % 1000000
    return h

def get_totp_token(secret):
    return get_hotp_token(secret, intervals_no=int(time.time())//30)

# This works whenever I run it, but I'm not 100% sure it conforms to RFC standards
# Also, I'm not sure if the secret is every allowed to not be 16 bytes
def generate_secret(length=16):
    random_secret = ""
    characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567"
    for _ in range(length):
        random_secret += random.choice(characters)
    return random_secret

# Pads secret with zeroes and separates with a space
def format_secret(secret, to_length=6):
    padded = '0'*(6-len(str(secret)))+str(secret)
    return padded[:3] + ' ' + padded[3:]

# Sets up a user given a label, username, and generates/takes a secret
# Is there a better way to do the "y/n: " stuff?
def setup_user():
    label = 'Amal_Pay'
    user = "user"
    secret = generate_secret()
    return label, user, secret

# secret = "DID NOT SET SECRET"

# Again, is there a better way to do the "y/n: "?
#
# label, user, secret = setup_user()
#
# # I'm unsure if this URL breaks when certain characters are in the label or username
# qr_url = "otpauth://totp/%s:%s?secret=%s&issuer=%s" % (label, user, secret, label)
# url = pyqrcode.create(qr_url)
# myqr=url.terminal(quiet_zone=1)
# os.system('cls' if os.name == 'nt' else 'clear')
# # Is it possible to make the qrcode smaller when printed in Terminal/Console?
# # ##print(url.terminal(quiet_zone=1))
# ##print(myqr)
#
# #print("User secret: ", secret)
# #print(format_secret(get_totp_token(secret)))
# # sys.stdout.write("\r%s" % format_secret(get_totp_token(secret)))
# # sys.stdout.flush()
# # This next line is my code to time-sync the timer. I'm not sure if it actually works though.
# # I think it might have to do with using modular arithmetic on a float
# # time.sleep(1 - time.time() % 1)
#
# # while True:
# #     # These next couple of lines format a progress bar for how many seconds are left until a new code.
# #     seconds = int(30 - time.time() % 30)
# #     lines = "-" * int(seconds)# / 3)
# #     blocks = "█" * (30 - len(lines))
# #     progress = "|" + blocks + lines + "|"
# #
# #     sys.stdout.write("\r%s" % format_secret(get_totp_token(secret)) + "\t" + progress)
#     sys.stdout.flush()
#
#     time.sleep(1)