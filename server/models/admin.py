import os.path
from sqlalchemy.orm import mapped_column
from sqlalchemy import String, DateTime
from datetime import datetime
from models import db


class Admin(db.Model):
    __tablename__ = "admin"
    first_name = mapped_column(String(30)) # User firstname
    last_name = mapped_column(String(30)) # User lastname
    phone_number = mapped_column(String(18)) # User mobile number 
    email = mapped_column(String(60), primary_key=True) # User email
    password = mapped_column(String(32)) # User password. The limited length is from 8 to 32
    registration_time = mapped_column(DateTime(), default=datetime.now())

    avatar_url = mapped_column(String(128), default="static/avatars/default_avatar.png") # Avatar image file path
