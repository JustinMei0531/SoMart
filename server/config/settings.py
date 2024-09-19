import datetime
import os


class DefaultConfig(object):

    SQLALCHEMY_DATABASE_URI = "sqlite:///../database/somart.db"


    JWT_SECRET_KEY = "Better and stronger"

    JWT_ACCESS_TOKEN_EXPIRES = datetime.timedelta(seconds=30)

    AVATAR_UPLOAD_FOLDER = "static/avatars"


class DebugConfig(DefaultConfig):
    DEBUG = True

class ReleaseConfig(DefaultConfig):
    RELEASE = True
