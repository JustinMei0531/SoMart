from sqlalchemy.orm import mapped_column, relationship
from sqlalchemy import String, Integer, Text, ForeignKey
from models import db



class Product(db.Model):
    __tablename__ = "product"

    id = mapped_column(Integer(), primary_key=True, autoincrement=True)
    name = mapped_column(String(64), nullable=False)
    current_price = mapped_column(String(32), nullable=False)
    before_price = mapped_column(String(32))
    price_per_kg = mapped_column(String(32), nullable=False)

    description = mapped_column(Text(), nullable=False)
    star_count = mapped_column(Integer(), default=0)
    tag = mapped_column(String(16), nullable=False)
    image_names = mapped_column(String(256), nullable=False)
    category_id = mapped_column(Integer, ForeignKey("category.id"), nullable=False)
    nutrition_id = mapped_column(Integer, ForeignKey("nutrition.id"), nullable=True)


    # Relationships
    category = relationship("Category", backref="products")
    nutrition = relationship("Nutrition", backref="product", uselist=False)

    def __repr__(self):
        return f"<Product {self.name}>"

    def to_dict(self):
        return {
            "id": self.id,
            "name": self.name,
            "current_price": self.current_price,
            "before_price": self.before_price,
            "price_per_kg": self.price_per_kg,
            "description": self.description,
            "star_count": self.star_count,
            "tag": self.tag,
            "image_names": self.image_names.split(';'),  # Split image names into a list
            "category": {
                "id": self.category.id,
                "name": self.category.category_name  # Assuming the Category model has a 'name' field
            } if self.category else None,
            "nutrition": self.nutrition.to_dict() if self.nutrition else None,
            # Assuming the Nutrition model has a to_dict method
        }

