from wtforms import *
from wtforms_tornado import *

class Test(Form):
    amount = StringField('amount',validators=[validators.DataRequired(), validators.Length(min=0, max=50)])
    owner = StringField('owner', validators=[validators.DataRequired(), validators.Length(min=0, max=50)])
    cardnumber = StringField('cardnumber',validators=[validators.DataRequired(), validators.Length(min=0, max=50)])
    date = PasswordField('date', validators=[validators.DataRequired(), validators.Length(min=0, max=50)])
    cvv = PasswordField('cvv',validators=[validators.DataRequired(), validators.Length(min=0, max=50)])
    addressZip = PasswordField('addressZip', validators=[validators.DataRequired(), validators.Length(min=0, max=50)])




