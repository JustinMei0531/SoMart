import datetime
import os


class DefaultConfig(object):

    SQLALCHEMY_DATABASE_URI = "sqlite:///../database/somart.db"

    JWT_SECRET_KEY = "Better and stronger"
    JWT_BLACKLIST_ENABLED = True
    WT_BLACKLIST_TOKEN_CHECKS = ["access", "refresh"]

    JWT_ACCESS_TOKEN_EXPIRES = datetime.timedelta(hours=1)

    AVATAR_UPLOAD_FOLDER = "static/avatars"


class DebugConfig(DefaultConfig):
    DEBUG = True

class ReleaseConfig(DefaultConfig):
    RELEASE = True
