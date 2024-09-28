import os.path
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.orm import mapped_column
from sqlalchemy import String, Integer, DateTime
from datetime import datetime
from pathlib import Path

user_db = SQLAlchemy()


class User(user_db.Model):
    first_name = mapped_column(String(30)) # User firstname
    last_name = mapped_column(String(30)) # User lastname
    phone_number = mapped_column(String(18)) # User mobile number 
    email = mapped_column(String(60), primary_key=True) # User email
    password = mapped_column(String(32)) # User password. The limited length is from 8 to 32
    role = mapped_column(Integer(), default=0) # User role, 0 represents a common user, 1 repersents an admin
    registration_time = mapped_column(DateTime(), default=datetime.now())

    avatar_url = mapped_column(String(128), default="static/avatars/default_avatar.png") # Avatar image file path
