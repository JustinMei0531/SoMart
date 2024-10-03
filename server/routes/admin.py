from flask import Blueprint, jsonify, request
from flask_jwt_extended import create_access_token, jwt_required, get_jwt_identity
from models.admin import Admin
from models.category import Category
from models import db
from utils.avatar import save_avatar, delete_old_avatar, convert_avatar_format
from utils.data import json_content_check
import os

# root_dir = os.path.abspath(os.path.dirname(__name__))
# static_folder = os.path.join(root_dir, "static")


admin_bp = Blueprint("admin", __name__, url_prefix="/admin")


@admin_bp.route("/login", methods=["POST"])
def admin_login():
    data = request.get_json(silent=True)

    if not data or "password" not in data or "email" not in data:
        return jsonify({"message": "Invalid JSON content"}), 401

    # Query admin from database
    admin = db.session.query(Admin).filter_by(email=data["email"]).first()

    if not admin or admin.password != data.get("password"):
        return jsonify({"message": "Invalid email or password"}), 401

    # Create a token
    access_token = create_access_token(identity=data.get("email"), additional_claims={"roles": admin.password})

    # Get root path
    root_path = os.path.abspath(os.path.dirname(__file__) + '/../')
    # Convert avatar data
    avatar, res = convert_avatar_format(admin.avatar_url)

    return jsonify({
        "status": "success",
        "message": "Login successful",
        "token": access_token,
        "user": {
            "email": admin.email,
            "first_name": admin.first_name,
            "last_name": admin.last_name,
            "avatar": avatar if res else ""
        }
    }), 200

@admin_bp.route("/update-avatar", methods=["PUT"])
@jwt_required()
def update_avatar():
    # Get json file from client
    data = request.get_json(silent=True)

    current_user_email = get_jwt_identity()

    admin = db.session.query(Admin).filter_by(email=current_user_email).first()

    if not admin:
        return jsonify({"status": "fail", "message": "User not found"}), 404
    if "avatar_base64" not in data:
        return jsonify({"status": "fail", "message": "Invalid json content"}), 400

    if not data["avatar_base64"]:
        return jsonify({"status": "fail", "message": "No image provided"}), 400

    # Remove old avatar and storage a new one
    if admin.avatar_url and admin.avatar_url != "static/avatars/default_avatar.png":
        delete_old_avatar(admin.avatar_url)
    avatar_filepath = save_avatar(data["avatar_base64"], admin.email)

    admin.avatar_url = avatar_filepath
    db.session.commit()

    return jsonify({
        "status": "success",
        "message": "Avatar updated successfully!",
        "avatar_url": avatar_filepath
    }), 200


@admin_bp.route("/update-profile", methods=["PUT"])
@jwt_required()
def update_profile():
    data = request.get_json(silent=True)

    if not json_content_check(data, "first_name", "last_name", "phone", "email"):
        return jsonify({"status": "fail", "message": "Invalid json content"}), 400

    current_user_email = get_jwt_identity()
    admin = db.session.query(Admin).filter_by(email=current_user_email).first()

    if not admin:
        return jsonify({"status": "fail", "message": "Admin not found"}), 404

    # Modify personal info
    # Find admin based on provided email
    is_exist_admin = db.session.query(Admin).filter_by(email=data["email"]).first()

    if is_exist_admin:
        return jsonify({"status": "fail", "message": "Email has been used"}), 400

    admin.first_name, admin.last_name, admin.email, admin.phone_number = data["first_name"], data["last_name"], data["email"], data["phone"]
    db.session.commit()

    # Return a new token
    access_token = create_access_token(identity=data.get("email"), additional_claims={"roles": admin.password})
    return jsonify({
        "status": "success",
        "message": "Admin info modified successfully",
        "token": access_token
    }), 200


@admin_bp.route("verify-token", methods=["GET"])
@jwt_required()
def verify_token():

    return jsonify({
        "message": "Your token can still be used."
    }), 200
