#!/bin/bash
# Usage : bash img_downloader.sh $1 $2 $3 $4
# where $1 = "<images to be searched keyword>" 
#       $2 = "<No of images to download in one iteration (Max 100)>" 
#       $3 = "<No of iterations to do>" 
#       $4 = "<Folder name to be saved in>"
#
# Example : bash img_downloader.sh "Alphonso Mangoes" "80" "10" "alphonso"
# The above code will download 80 * 10 = 800 different images of "Alphonso Mangoes" and 
# save them in the folder "downloaded/train/alphonso".
#
# All the images by default follow the "downloaded/train/folder_name" directory structure.
# Tested this script to download 1860 images at one time.
# This script has been inspired from "https://forums.fast.ai/t/tips-for-building-large-image-datasets/26688" 
# Thanks to @lindyrock
#
# Disclaimer : This is intended only for personal educational purposes. I do not encourage 
# using this for any other purpose.
#

for ((i=1;i<=$3;i++))
do
googleimagesdownload -k "$1" -s medium -wr '{"time_min":"0'$i'/01/2018","time_max":"0'$i'/30/2018"}' -l "$2" -o /content/downloaded -i train/$4
done