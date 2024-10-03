from models import db
from sqlalchemy.orm import mapped_column
from sqlalchemy import String, Integer, DateTime


class User(db.Model):
    id = mapped_column(Integer(), primary_key=True, autoincrement=True)
    username = mapped_column(String(32), nullable=False)