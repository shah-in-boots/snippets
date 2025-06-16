#!/bin/bash

# Simple script that crops gifs that are all the same size
# This should be used in a folder that has GIFs in it
# The format is using `gifsicle` 
# The crop window is `x1,y1-x2,y2' that will be preserved

for i in *.gif; do
    gifsicle --crop 0,50-1024,768 --batch -i "$i" --colors 256
done
