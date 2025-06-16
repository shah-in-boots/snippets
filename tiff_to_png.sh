#!/bin/bash

# Converts all the TIF in folder to PNG
for i in *.tif;
  do name=`echo "$i" | cut -d'.' -f1`
  echo "$name"
  magick "$i" "${name}.png"
done

# Needs to be made executable with `chmod +x tiff_to_png.sh` from terminal
# Then, runs via `sh ../../R/tiff_to_png.sh` (e.g. absolute path needed)
