# from Crypto.PublicKey import RSA
# from Crypto.Cipher import PKCS1_OAEP
# import base64

# def generate_keys():
#    modulus_length = 3072

#    key = RSA.generate(modulus_length)
#    pub_key = key.publickey()
#    return key.exportKey(), pub_key.exportKey()

# def encrypt_public_key(a_message, public_key):
#    print(public_key,"Pppppppppppppppppppppppppppppppppppppppppppp")
#    encryptor = PKCS1_OAEP.new(public_key)
#    print(a_message,"eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee")
#    encrypted_msg = encryptor.encrypt(a_message.encode())
#    encoded_encrypted_msg = base64.b64encode(encrypted_msg)
#    return encoded_encrypted_msg

# def decrypt_secret_key(encoded_encrypted_msg, secret_key):
#    encryptor = PKCS1_OAEP.new(secret_key)
#    decoded_encrypted_msg = base64.b64decode(encoded_encrypted_msg)
#    decoded_decrypted_msg = encryptor.decrypt(decoded_encrypted_msg)
#    return decoded_decrypted_msg.decode()

# # def main():
# #    private, public = generate_keys()
# #    message = '21634'
# #    encoded = encrypt_private_key(message, public)
# #    decrypt_public_key(encoded, private)




import zlib
from Crypto import Random
from Crypto.PublicKey import RSA
from Crypto.Cipher import AES, PKCS1_OAEP

import base64, os


# def generate_keys():
#    modulus_length = 3072
#    privatekey = RSA.generate(modulus_length, Random.new().read)
#    publickey = privatekey.publickey()
#    exprivatekey = privatekey.exportKey()
#    expublickey = publickey.exportKey()
#    return exprivatekey,expublickey


# def encrypt_message_rsa(a_message, publickey):
#    if a_message==False:
#       return False
#    # try:

#    impublickey = RSA.importKey(publickey)
#    encryptor = PKCS1_OAEP.new(impublickey)
#    encrypted_msg = encryptor.encrypt(a_message.encode())
#    # encrypted_msg = base64.b85encode(base64.b64encode(a_message.encode())).decode()
#    encoded_encrypted_msg = base64.b85encode(base64.b64encode(encrypted_msg)).decode()
#    return encoded_encrypted_msg
#    # except:
#    #    return False


# def decrypt_secret_key(encoded_encrypted_msg, privatekey):
#    if encoded_encrypted_msg==False:
#       return False
#    try:
#       imprivatekey = RSA.importKey(privatekey)
#       decoded_msg = encoded_encrypted_msg
#       decryptor = PKCS1_OAEP.new(imprivatekey)
#       decoded_decrypted_msg = decryptor.decrypt(base64.b64decode(base64.b85decode(encoded_encrypted_msg.encode())))
#       return decoded_decrypted_msg.decode()
#    except:
#       return False



def generate_keys_rsa():
   modulus_length = 3072
   privatekey = RSA.generate(modulus_length, Random.new().read)
   publickey = privatekey.publickey()
   exprivatekey = base64.b85encode(base64.b64encode(privatekey.exportKey())).decode()
   expublickey = base64.b85encode(base64.b64encode(publickey.exportKey())).decode()
   return exprivatekey, expublickey


def encrypt_message_rsa(a_message, publickey):
   impublickey = RSA.importKey(base64.b64decode(base64.b85decode(publickey.encode())))
   encryptor = PKCS1_OAEP.new(impublickey)
   encrypted_msg = encryptor.encrypt(a_message.encode())
   encoded_encrypted_msg = base64.b85encode(base64.b64encode(encrypted_msg)).decode()
   return encoded_encrypted_msg


def decrypt_secret_key(encoded_encrypted_msg, privatekey):
   imprivatekey = RSA.importKey(base64.b64decode(base64.b85decode(privatekey.encode())))
   decoded_msg = base64.b64decode(base64.b85decode(encoded_encrypted_msg.encode()))
   decryptor = PKCS1_OAEP.new(imprivatekey)
   decoded_decrypted_msg = decryptor.decrypt(decoded_msg)
   return decoded_decrypted_msg.decode()