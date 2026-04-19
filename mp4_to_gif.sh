#!/bin/bash

# Converts all the MP4 in folder to GIF
for i in *.mp4;
  do name=`echo "$i" | cut -d'.' -f1`
  echo "$name"
  ffmpeg -i "$i" "${name}.gif"
done

# Needs to be made executable with `chmod +x mp4-to-gif.sh` from terminal
# Then, runs via `sh ../../R/mp4-to-gif.sh` (e.g. absolute path needed)