#!/bin/bash

# Simple script to add all the images for a image based conference
# Presumes that the names are all sequential/organized to some degree

for i in $(ls -1tr *.{png,jpg,jpeg,gif,JPG,JPEG,PNG,GIF} 2>/dev/null); do
	echo "## {background-image=\"$i\" background-size=\"contain\"}"
	echo ""
done >> case.qmd

# Needs to be made executable with `chmod +x image-to-qmd.sh` from terminal
# Then, runs via `sh ../../R/image-to-qmd.sh` (e.g. absolute path needed)
