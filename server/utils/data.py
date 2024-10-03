from base64 import b64decode
from hashlib import md5
from datetime import datetime
from pathlib import Path

def json_content_check(obj, *args):
    assert isinstance(obj, dict)
    for key in args:
        if key not in obj:
            return False
    return True


def base64_to_image(b64data, output):

    assert isinstance(output, str)
    image_data = b64decode(b64data)

    # Generate a unique name using the current time's MD5 hash
    current_time = datetime.now().isoformat()
    md5_hash = md5(current_time.encode()).hexdigest()
    file_name = f"{md5_hash}.webp"

    # Ensure the output folder exists
    output_path = Path(output)
    output_path.mkdir(parents=True, exist_ok=True)

    # Save the image as a .webp file
    image_file_path = output_path / file_name
    with open(image_file_path, "wb") as image_file:
        image_file.write(image_data)

    print(f"Image saved as {image_file_path}")
    return file_name
