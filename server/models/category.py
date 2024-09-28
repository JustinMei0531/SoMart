from models import db
from sqlalchemy.orm import mapped_column
from sqlalchemy import String, Integer


class Category(db.Model):
    __tablename__ = "category"

    id = mapped_column(Integer(), primary_key=True)
    category_name = mapped_column(String(50), nullable=False, unique=True)
    category_image_url = mapped_column(String(128), nullable=False)

    def __repr__(self):
        return f"<Category {self.category_name}>"

    def to_dict(self):
        return {
            "id": self.id,
            "category_name": self.category_name,
            "category_image_url": self.category_image_url
        }