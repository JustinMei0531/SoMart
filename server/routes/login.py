from flask import Blueprint, jsonify, request
from flask_jwt_extended import create_access_token
from models.user import user_db, User


login_blueprint = Blueprint("login", __name__)

@login_blueprint.route("/login", methods=["POST"])
def login():
    data = request.get_json(silent=True)

    if not data or "password" not in data or "email" not in data:
        return jsonify({"msg": "Invalid JSON content"}), 401
    
    # Query user from database
    user = user_db.session.query(User).filter_by(email=data["email"]).first()

    if not user or user.password != data.get("password"):
        return jsonify({"msg": "Invalid email or password"}), 401
    
    # Create a token
    access_token = create_access_token(identity=data.get("email"), additional_claims={"roles": user.role})
    
    return jsonify({
        "status": "success",
        "message": "Login successful",
        "token": access_token,
        "user": {
            "email": user.email,
            "first_name": user.first_name,
            "last_name": user.last_name,
            "role": user.role
        }
    }), 200
