from flask import request, jsonify, Blueprint, g
from sqlalchemy.orm import joinedload
from sqlalchemy.exc import IntegrityError
from sqlalchemy import func
from models import db
from flask_jwt_extended import jwt_required
from models.product import Product
from models.category import Category
from utils.data import json_content_check, base64_to_image
from services.search_service import SearchService
import os

product_bp = Blueprint("product", __name__, url_prefix="/product")



@product_bp.route("/get-all-products", methods=["GET"])
@jwt_required()
def get_products():
    default_page_size = 20

    page = request.args.get("page", 1, type=int)
    per_page = request.args.get("per_page", default_page_size, type=int)

    products = db.session.query(Product).options(joinedload(Product.category), joinedload(Product.nutrition)).paginate(page=page, per_page=per_page, error_out=False)
    products_data = [
        {
            "id": product.id,
            "name": product.name,
            "image_url": ["/static/products" + name for name in product.image_names.split(';')],
            'category': product.category.category_name,
            "category_id": product.category.id,
            "description": product.description,
            "tag": product.tag,
            "current_price": product.current_price,
            "before_price": product.before_price,
            'nutrition': product.nutrition.to_dict() if product.nutrition else None
        }
        for product in products.items
    ]

    return jsonify({
        'status': 'success',
        'page': products.page,
        'per_page': products.per_page,
        'total_pages': products.pages,
        'total_products': products.total,
        'products': products_data
    }), 200


@product_bp.route("/upload-product", methods=["POST"])
@jwt_required()
def upload_product():
    data = request.get_json(silent=True)
    if not json_content_check(data, "name", "regular_price", "discount_price", "id", "image_data", "category", "tag", "price_per_kg"):
        return jsonify({"status": "fail", "message": "Invalid json content"}), 400

    images_base64 = data["image_data"]
    base_dir = os.path.abspath(os.path.dirname(__file__) + '/../')
    product_image_names = ""
    # Decode and save images
    for image_data in images_base64:
        # Get file path
        saved_path = os.path.join(base_dir, "static", "products")
        image_name = base64_to_image(image_data, saved_path)

        product_image_names += image_name + ';'

    # Check product category
    category_name = data.get("category", "unknown")
    category = db.session.query(Category).filter_by(category_name=category_name).first()

    if not category:
        category = Category(category_name=category_name)
        db.session.add(category)
        db.session.commit()

    # Create a new product

    try:
        new_product = Product(
            name=data["name"],
            id=data["id"],
            current_price=data["discount_price"],
            before_price=data["regular_price"],
            description=data["description"],
            price_per_kg=data.get("price_per_kg", ""),
            tag=data["tag"],
            image_names=product_image_names,
            category_id=category.id
        )
        db.session.add(new_product)
        db.session.commit()

        return jsonify({"status": "success", "message": "Product uploaded successfully"}), 201

    except IntegrityError as e:
        print(e.args)
        db.session.rollback()  # Rollback in case of any error
        return jsonify({"status": "fail", "message": f"Failed to upload product: {str(e)}"}), 500


@product_bp.route("/inspect-product-id", methods=["POST"])
@jwt_required()
def inspect_product_id():
    data = request.get_json(silent=True)

    if not json_content_check(data, "id"):
        return jsonify({"status": "fail", "message": "Invalid JSON content."}), 400

    if not data["id"].isdigit():
        return jsonify({"status": "success", "message": "Product ID should only contain number"}), 400

    # Query product with give ID from database
    product = db.session.query(Product).filter_by(id=data["id"]).first()

    if not product:
        return jsonify({"status": "success", "message": "Your product ID is valid"}), 200
    else:
        return jsonify({"status": "fail", "massage": "This product ID has been used."}), 409


@product_bp.route("/get-valid-product-id", methods=["GET"])
@jwt_required()
def get_valid_product_id():
    largest_id = db.session.query(func.max(Product.id)).scalar()

    return jsonify({"status": "success", "message": "query successful", "id": largest_id}), 200


@product_bp.route("/export-products", methods=["GET"])
@jwt_required()
def export_products():
    pass


@product_bp.route("/search-product", methods=["GET"])
@jwt_required()
def search_product():
    id = request.args.get("id", "").strip()
    name = request.args.get("name", "").strip()

    if not id and not name:
        return jsonify({"status": "fail", "message": "Query parameter is required"}), 400

    if id:
        # Search product in the database by ID
        product = db.session.query(Product).filter_by(id=int(id)).first()

        if product:
            return jsonify({
                "status": "success",
                "message": "Query success",
                "products": [product.to_dict()]
            }), 200
        else:
            return jsonify({
                "status": "fail",
                "message": "Product not found",
                "products": []
            }), 404
    else:
        # Search products using trie-based search for name
        product_ids = g.search_service.search(name.lower())

        if not product_ids:
            return jsonify({
                "status": "success",
                "message": "No matching products found",
                "products": []
            }), 200

        # Fetch products using the IDs found
        products = db.session.query(Product).filter(Product.id.in_(product_ids)).all()

        product_list = [product.to_dict() for product in products]

        return jsonify({
            "status": "success",
            "message": "Query success",
            "products": product_list
        }), 200

