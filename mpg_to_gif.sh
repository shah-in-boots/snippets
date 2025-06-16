#!/bin/bash

# Check if FFmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "Error: FFmpeg is not installed."
    echo "Please install it using: brew install ffmpeg"
    exit 1
fi

# Check if an argument was provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <input.mpg>"
    echo "Example: $0 video.mpg"
    exit 1
fi

# Get the input file
input_file="$1"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: File '$input_file' not found!"
    exit 1
fi

# Check if the input file has .mpg extension
if [[ ! "$input_file" =~ \.mpg$ ]]; then
    echo "Warning: Input file doesn't have .mpg extension"
fi

# Create the output filename by replacing .mpg with .gif
output_file="${input_file%.*}.gif"

echo "Converting $input_file to $output_file..."

# Convert MPG to GIF
# -i: input file
# -vf: video filter
# fps=10: reduce frame rate to 10 fps for smaller file size
# scale=320:-1: reduce width to 320px, maintain aspect ratio
# flags=lanczos: high-quality scaling algorithm
# -loop 0: make the GIF loop forever
ffmpeg -i "$input_file" \
       -vf "fps=10,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
       -loop 0 \
       "$output_file"

# Check if conversion was successful
if [ $? -eq 0 ]; then
    echo "Success! Created: $output_file"
    echo "File size: $(ls -lh "$output_file" | awk '{print $5}')"
else
    echo "Error: Conversion failed!"
    exit 1
fi