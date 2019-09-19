import re
import pymysql
TAG_RE = re.compile(r'<[^>]+>')

def remove_tag(text):
    #print(text,type(text))
    if type(text) == type(False):
        a=0
        return a
    return pymysql.escape_string(TAG_RE.sub('', text))


def regex(string):
    if type(string) == type(False) or string==0:
        a=0
        return a

    if string.startswith("card_"):
        pattern = re.compile("card_[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")
        a = pattern.match(string)
        if a:
            return string
        else:
            a = 0
            return a
    elif string.startswith("tok_"):
        pattern = re.compile("tok_[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")
        a = pattern.match(string)
        if a:
            return string
        else:
            a = 0
            return a
    elif string.startswith("plan_"):
        pattern = re.compile("plan_[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")
        a = pattern.match(string)
        if a:
            return string
        else:
            a = 0
            return a
    elif string.startswith("sub_"):
        pattern = re.compile("sub_[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")
        a = pattern.match(string)
        if a:
            return string
        else:
            a = 0
            return a
    elif string.startswith("credit_"):
        pattern = re.compile("credit_[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")
        a = pattern.match(string)
        if a:
            return string
        else:
            a = 0
            return a
    elif string.startswith("char_"):
        pattern = re.compile("char_[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")
        a = pattern.match(string)
        if a:
            return string
        else:
            a = 0
            return a
    elif string.startswith("event_"):
        pattern = re.compile("event_[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")
        a = pattern.match(string)
        if a:
            return string
        else:
            a = 0
            return a
    elif string.startswith("log_"):
        pattern = re.compile("log_[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")
        a = pattern.match(string)
        if a:
            return string
        else:
            a = 0
            return a
    elif string.startswith("blr_"):
        pattern = re.compile("blr_[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")
        a = pattern.match(string)
        if a:
            return string
        else:
            a = 0
            return a
    elif string.startswith("file_"):
        pattern = re.compile("file_[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")
        a = pattern.match(string)
        if a:
            return string
        else:
            a = 0
            return a

    elif string.startswith("plan_"):
        pattern = re.compile("char_[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")
        a = pattern.match(string)
        if a:
            return string
        else:
            a = 0
            return a
    elif string.startswith("disp_"):
        pattern = re.compile("disp_[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")
        a = pattern.match(string)
        if a:
            return string
        else:
            a = 0
            return a
    elif string.startswith("cso_"):
        pattern = re.compile("cso_[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")
        a = pattern.match(string)
        if a:
            return string
        else:
            a = 0
            return a
    elif (re.compile("[0-9a-f]{12}")).match(string[-12:]):
        pattern = re.compile("[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}")

        a = pattern.match(string)
        if a:
            return string
        else:
            a = 0
            return a
    else:
        a=0

        return a