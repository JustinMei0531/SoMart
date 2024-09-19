import base64
import uuid
import os
import mimetypes
from werkzeug.utils import secure_filename


def convert_avatar_format(image_path):
    assert isinstance(image_path, str)

    # Check if the image path exists and is a file
    if not os.path.exists(image_path) or not os.path.isfile(image_path):
        print("Cannot find path: {}".format(image_path))
        return "", False

    # Guess the MIME type of the image
    mime_type, _ = mimetypes.guess_type(image_path)

    if mime_type is None:
        print("Unsupported image format for file: {}".format(image_path))
        return "", False

    # Read and encode the image content in base64
    with open(image_path, "rb") as f:
        image_content = f.read()
        image_encoded = base64.b64encode(image_content).decode("utf-8")

    # Return the data URL format (data:mime_type;base64,encoded_data)
    data_url = f"data:{mime_type};base64,{image_encoded}"

    return data_url, True


def save_avatar(image_base64, user_email):
    # Decode base64 data
    image_data = base64.b64decode(image_base64)
    
    # Create an unique filename using UUID
    filename = secure_filename("{}_{}.png".format(user_email, uuid.uuid1().hex))
    # Get folder abs path
    base_folder = os.path.abspath(os.path.dirname(__file__) + '/../')
    # Save image
    filepath = os.path.join(os.path.join(base_folder, "static", "avatars"), filename)
    with open(filepath, mode="wb") as f:
        f.write(image_data)
    
    return filepath

def delete_old_avatar(old_avatar_path):
    if os.path.exists(old_avatar_path) and "default_avatar.png" not in old_avatar_path:
        os.remove(old_avatar_path)