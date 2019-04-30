# This script is useful for cleaning the images dataset. It deletes all the 
# corrupted images in a given folder leaving behind all the good images.
# Can be used to avoid the "OSError : cannot identify image file" while training
# the model.
#
# Remember, any files other than image extensions accepted by PIL will be deleted. 
#
# Usage : python del_unwanted.py $1
# where $1 = "dir_name" ( where images are stored )
# Requires absolute directory path
#
# Example : python del_unwanted.py "~/downloaded/train/alphonso"
#

import os
import sys
from PIL import Image

if len(sys.argv) < 2:
    print("Error : Too Few Arguments \nUsage : python del_unwanted.py $1 \nwhere $1 = \"dir_name\" ( where images are stored ) \nRequires absolute directory path")
    sys.exit()
dirname=sys.argv[1]
cnt=0
for filename in os.listdir(dirname):
    try:
        img=Image.open(dirname+"/"+filename)
    except OSError:
        print("FILE: ", filename, "is corrupt!")
        cnt+=1
        os.remove(dirname+"/"+filename)
print("Successfully Completed Operation! Files Courrupted are ", cnt)