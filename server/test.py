import os

import cv2
from tqdm import tqdm

target_folder = "F:\\Flutter\\SoMart\\server\\static\\products"

# List all images in the target folder
images = os.listdir(target_folder)
images = [img for img in images if not img.endswith('.webp')]
# Use tqdm to wrap the iterable and show the progress bar
for image in tqdm(images, desc="Processing images", unit="image"):
    img = cv2.imread(os.path.join(target_folder, image), cv2.IMREAD_ANYCOLOR)

    # Save the image as a .webp file
    cv2.imwrite(os.path.join(target_folder, image + ".webp"), img)

print("Done!")
