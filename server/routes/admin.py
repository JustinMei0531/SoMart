from flask import Blueprint, jsonify, request, current_app
from flask_jwt_extended import create_access_token, jwt_required, get_jwt_identity
from models.user import user_db, User
from utils.avatar import save_avatar, delete_old_avatar, convert_avatar_format
import os

# root_dir = os.path.abspath(os.path.dirname(__name__))
# static_folder = os.path.join(root_dir, "static")


admin_bp = Blueprint("admin", __name__, url_prefix="/admin")


@admin_bp.route("/login", methods=["POST"])
def admin_login():
    data = request.get_json(silent=True)

    if not data or "password" not in data or "email" not in data:
        return jsonify({"msg": "Invalid JSON content"}), 401
    
    # Query user from database
    user = user_db.session.query(User).filter_by(email=data["email"]).first()

    if not user or user.password != data.get("password"):
        return jsonify({"msg": "Invalid email or password"}), 401
    
    # Create a token
    access_token = create_access_token(identity=data.get("email"), additional_claims={"roles": user.role})

    # Get root path
    root_path = os.path.abspath(os.path.dirname(__file__) + '/../')
    # Convert avatar data
    avatar, res = convert_avatar_format(user.avatar_url)
    
    return jsonify({
        "status": "success",
        "message": "Login successful",
        "token": access_token,
        "user": {
            "email": user.email,
            "first_name": user.first_name,
            "last_name": user.last_name,
            "role": user.role,
            "avatar": avatar if res else ""
        }
    }), 200

@admin_bp.route("/update-avatar", methods=["PUT"])
@jwt_required()
def update_avatar():    
    # Get json file from client
    data = request.get_json(silent=True)

    current_user_email = get_jwt_identity()

    user = user_db.session.query(User).filter_by(email=current_user_email).first()

    if not user:
        return jsonify({"status": "fail", "message": "User not found"}), 404
    if "avatar_base64" not in data:
        return jsonify({"status": "fail", "message": "Invalid json content"}), 400

    if not data["avatar_base64"]:
        return jsonify({"status": "fail", "message": "No image provided"}), 400

    # Remove old avatar and storage a new one
    if user.avatar_url and user.avatar_url != "static/avatars/default_avatar.png":
        delete_old_avatar(user.avatar_url)
    avatar_filepath = save_avatar(data["avatar_base64"], user.email)

    user.avatar_url = avatar_filepath
    user_db.session.commit()

    return jsonify({
        "status": "success",
        "message": "Avatar updated successfully!",
        "avatar_url": avatar_filepath
    }), 200
