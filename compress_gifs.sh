#!/bin/bash

# Script for compressing gifs using gifsicle
# Function should be used in a directory containing the gifs to be compressed
# Script will compress all gifs in the directory
# Roughly at 1/4 of the original size

#for i in *.gif; do
#	gifsicle -O3 --colors 64 $i -o $i
#done

# Loop through all .gif files in the current directory and subdirectories
find . -type f -name "*.gif" | while read -r gif_file; do
  gifsicle -O3 --lossy=20 --colors 32 --dither "$gif_file" -o "$gif_file"
	echo "Compressed: $gif_file"
done

