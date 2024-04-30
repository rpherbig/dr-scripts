import os
from PIL import Image
import PIL.ImageOps

'''
DragonRealms Map Color Inversion Script

This is a Python script that runs through a directory and inverts all images
in the directory and then applies a color swap function to change one single
color into a different color.  This script is intended for changing DragonRealms
maps in Lich into a dark theme.

Usage:  Make sure img_dir is pointing to correct directory.  Run Python script.
All images in directory should change to an inverted palatte.  Then the
change_color function is called to replace a single color with another color.
This currently changes Yellow to Cyan to make water color more pleasant.
Additional color replacements can be made by adding addition instances of
change_color.  Colors are represented in RGB format.

Circle.jpg is bypassed, since it does not need inversion.

Requirements:
-Must have Python installed
-Must have Pillow (PIL) library installed
    -can be installed by running:  pip install pillow
Assumptions:
-All files in directory are images (folders are ignored)
-User has already backed up original files in a separate location

Warning:  Running twice will result in image errors not fixable by this script.
If a run does not complete as intended, restore from backup instead of attempting
second run.

'''

img_dir = 'C:\\Ruby4Lich5\\Lich5\\maps\\'

def change_color(r, g, b, im, r2, g2, b2):
    datas = im.getdata()
    new_image_data = []
    for item in datas:
        if item == (r, g, b):
            new_image_data.append((r2, g2, b2))
        else:
            new_image_data.append(item)
    im.putdata(new_image_data)
    return im

for filename in os.listdir(img_dir):
    if filename != 'circle.png':
        file = os.path.join(img_dir, filename)
        img = Image.open(file)
        img = PIL.ImageOps.invert(img.convert('RGB'))
        #below line changes yellow to cyan
        img = change_color(255, 255, 0, img, 0, 123, 167)
        img.save(file)
        print("finished: " + str(filename))

print("done!")
