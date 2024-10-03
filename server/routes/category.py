from flask import Blueprint, jsonify, request
from flask_jwt_extended import create_access_token, jwt_required, get_jwt_identity
from models.admin import Admin
from models.category import Category
from models import db
from utils.avatar import save_avatar, delete_old_avatar, convert_avatar_format
from utils.data import json_content_check
import os

category_bp = Blueprint("category", __name__, url_prefix="/category")

@category_bp.route("get-categories", methods=["GET"])
@jwt_required()
def get_categories():
    categories = db.session.query(Category).all()
    categories = [category.to_dict() for category in categories]
    return jsonify({
        "status": "success",
        "categories": categories
    }), 200