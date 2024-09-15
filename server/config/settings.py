import datetime

class DefaultConfig(object):
    SQLALCHEMY_DATABASE_URI = "sqlite:///../server/database/somart.db"

    STATIC_FOLDER_PATH = "server/static"

    JWT_SECRET_KEY = "Better and stronger"

    JWT_ACCESS_TOKEN_EXPIRES = datetime.timedelta(seconds=30)


class DebugConfig(DefaultConfig):
    DEBUG = True

class ReleaseConfig(DefaultConfig):
    RELEASE = True
