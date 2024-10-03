from models import db
from sqlalchemy.orm import mapped_column
from sqlalchemy import String, Text, Integer, DateTime


class Review(db.Model):
    __tablename__ = "review"

    review_id = mapped_column(Integer(), primary_key=True)
    product_name = mapped_column(String(128), nullable=False)
    rating = mapped_column(Integer(), default=5)
    date = mapped_column(DateTime(), nullable=False)
