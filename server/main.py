from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS
from flask_jwt_extended import JWTManager
from config import settings

# Import all blueprints
from routes.admin import admin_bp

# Import all models
from models.user import user_db


def create_flask_app(config):
    app = Flask(__name__, static_folder="./static")

    # Load configurtion from object
    app.config.from_object(config)

    CORS(app)

    jwt = JWTManager(app)

    # Regisiter blueprints
    app.register_blueprint(admin_bp)

    # Initialize the database
    user_db.init_app(app)

    # Create database tables
    with app.app_context():
        user_db.create_all()

    return app, jwt


app, jwt = create_flask_app(settings.DefaultConfig)

# Global custom response for expired tokens
@jwt.expired_token_loader
def expired_token_callback(jwt_header, jwt_payload):
    return jsonify({
        "message": "Token has expired, please log in again.",
        "status": "fail"
    }), 401


if __name__ == "__main__":
    app.run()
