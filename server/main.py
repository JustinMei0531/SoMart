from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS
from flask_jwt_extended import JWTManager, create_access_token, jwt_required, get_jwt_identity
from config import settings

# Import all blueprints
from routes.login import login_blueprint

# Import all models
from models.user import user_db


def create_flask_app(config):
    app = Flask(__name__, static_folder="./static")

    # Load configurtion from object
    app.config.from_object(config)

    CORS(app)

    JWTManager(app)

    # Regisiter blueprints
    app.register_blueprint(login_blueprint)

    # Initialize the database
    user_db.init_app(app)

    # Create database tables
    with app.app_context():
        user_db.create_all()

    
    return app


app = create_flask_app(settings.DefaultConfig)


if __name__ == "__main__":
    app.run()    
