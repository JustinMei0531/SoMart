from sqlalchemy.orm import mapped_column
from sqlalchemy import String, Integer, Text, Float
from models import db


class Product(db.Model):
    __tablename__ = "product"
    product_name = mapped_column(String(36), nullable=False)
    product_id = mapped_column(Integer(), nullable=False, primary_key=True)
    product_price = mapped_column(Float(), nullable=False)
    discount = mapped_column(Float(), default=0.0)
    star_count = mapped_column(Float(), nullable=False)
    description = mapped_column(Text(), nullable=False)
    tag = mapped_column(String(10), nullable=False)

    # Foreign key to the Category model
    category_id = mapped_column(Integer, db.ForeignKey("category.id"), nullable=False)

    # Relationship between product and category
    category = db.relationship("Category", backref="products")

    def __repr__(self):
        return f"<Product {self.product_name}>"

