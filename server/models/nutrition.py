from models import db
from sqlalchemy.orm import mapped_column
from sqlalchemy import Float, Integer


class Nutrition(db.Model):
    __tablename__ = "nutrition"
    id = db.Column(db.Integer, primary_key=True)

    # Energy in kJ
    energy_per_serving = mapped_column(db.String(50), nullable=True)  # Storing as string to allow "Less than" values
    energy_per_100g = mapped_column(db.String(50), nullable=True)

    # Protein in grams
    protein_per_serving = mapped_column(db.String(50), nullable=True)
    protein_per_100g = mapped_column(db.String(50), nullable=True)

    # Fat (total) in grams
    fat_total_per_serving = mapped_column(db.String(50), nullable=True)
    fat_total_per_100g = mapped_column(db.String(50), nullable=True)

    # Saturated Fat in grams
    saturated_fat_per_serving = mapped_column(db.String(50), nullable=True)
    saturated_fat_per_100g = mapped_column(db.String(50), nullable=True)

    # Trans Fat in grams
    trans_fat_per_serving = mapped_column(db.String(50), nullable=True)
    trans_fat_per_100g = mapped_column(db.String(50), nullable=True)

    # Polyunsaturated Fat in grams
    polyunsaturated_fat_per_serving = mapped_column(db.String(50), nullable=True)
    polyunsaturated_fat_per_100g = mapped_column(db.String(50), nullable=True)

    # Monounsaturated Fat in grams
    monounsaturated_fat_per_serving = mapped_column(db.String(50), nullable=True)
    monounsaturated_fat_per_100g = mapped_column(db.String(50), nullable=True)

    # Carbohydrates in grams
    carbohydrate_per_serving = mapped_column(db.String(50), nullable=True)
    carbohydrate_per_100g = mapped_column(db.String(50), nullable=True)

    # Sugars in grams
    sugars_per_serving = mapped_column(db.String(50), nullable=True)
    sugars_per_100g = mapped_column(db.String(50), nullable=True)

    # Dietary Fiber in grams
    fiber_per_serving = mapped_column(db.String(50), nullable=True)
    fiber_per_100g = mapped_column(db.String(50), nullable=True)

    # Sodium in mg
    sodium_per_serving = mapped_column(db.String(50), nullable=True)
    sodium_per_100g = mapped_column(db.String(50), nullable=True)

    def to_dict(self):
        return {
            "id": self.id,
            "energy_per_serving": self.energy_per_serving,
            "energy_per_100g": self.energy_per_100g,
            "protein_per_serving": self.protein_per_serving,
            "protein_per_100g": self.protein_per_100g,
            "fat_total_per_serving": self.fat_total_per_serving,
            "fat_total_per_100g": self.fat_total_per_100g,
            "saturated_fat_per_serving": self.saturated_fat_per_serving,
            "saturated_fat_per_100g": self.saturated_fat_per_100g,
            "trans_fat_per_serving": self.trans_fat_per_serving,
            "trans_fat_per_100g": self.trans_fat_per_100g,
            "polyunsaturated_fat_per_serving": self.polyunsaturated_fat_per_serving,
            "polyunsaturated_fat_per_100g": self.polyunsaturated_fat_per_100g,
            "monounsaturated_fat_per_serving": self.monounsaturated_fat_per_serving,
            "monounsaturated_fat_per_100g": self.monounsaturated_fat_per_100g,
            "carbohydrate_per_serving": self.carbohydrate_per_serving,
            "carbohydrate_per_100g": self.carbohydrate_per_100g,
            "sugars_per_serving": self.sugars_per_serving,
            "sugars_per_100g": self.sugars_per_100g,
            "fiber_per_serving": self.fiber_per_serving,
            "fiber_per_100g": self.fiber_per_100g,
            "sodium_per_serving": self.sodium_per_serving,
            "sodium_per_100g": self.sodium_per_100g
        }