from flask import Flask, jsonify, g
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS
from flask_jwt_extended import JWTManager
from config import settings
from models import db

# Import all blueprints
from routes.admin import admin_bp
from routes.category import category_bp
from routes.product import product_bp

# Import all models
from models.admin import Admin  # Import your models explicitly
from models.product import Product
from models.category import Category
from models.review import Review
from models.nutrition import Nutrition

# All services
from services.search_service import SearchService

# Initialize the search service globally
search_service = SearchService()

def create_flask_app(config):
    app = Flask(__name__, static_folder="./static")

    # Load configuration from object
    app.config.from_object(config)

    CORS(app)

    jwt = JWTManager(app)

    # Register blueprints
    app.register_blueprint(admin_bp)
    app.register_blueprint(category_bp)
    app.register_blueprint(product_bp)

    # Initialize services and register them in app context
    app.before_request(setup_services)

    return app, jwt


def setup_services():
    """Add services to the global context (g) so they can be accessed across the app."""
    if 'search_service' not in g:
        g.search_service = search_service

app, jwt = create_flask_app(settings.DefaultConfig)

# Initialize database
db.init_app(app)

# Create all tables and populate trie
with app.app_context():
    db.create_all()
    # Enable search service (populate the trie)
    search_service.populate()  # Directly call search_service to populate the Trie

# Global custom response for expired tokens
@jwt.expired_token_loader
def expired_token_callback(jwt_header, jwt_payload):
    return jsonify({
        "message": "Token has expired, please log in again.",
        "status": "fail"
    }), 401

if __name__ == "__main__":
    app.run()
