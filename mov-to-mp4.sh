#!/bin/bash
#
# Convert MOV files to MP4 format using `ffmpeg`. 
# Command would be...
#
# $ ./mov-to-mp4.sh input.mov

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
	echo "Error: ffmpeg is not installed. Please install it first."
	exit 1
fi

# Check if a file was provided as an argument
if [ $# -eq 0 ]; then
	echo "Usage: $0 input.mov"
	echo "Converts a MOV file to MP4 format while preserving the filename"
	exit 1
fi

input_file="$1"

# Check if input file exists
if [ ! -f "$input_file" ]; then
	echo "Error: File '$input_file' not found"
	exit 1
fi

# Check if input file is a MOV file
if [[ ! "$input_file" =~ \.mov$ ]]; then
	echo "Error: Input file must be a MOV file"
	exit 1
fi

# Create output filename by replacing .mov with .mp4
output_file="${input_file%.mov}.mp4"

# Convert the file
echo "Converting $input_file to $output_file..."
ffmpeg -i "$input_file" -c copy -movflags +faststart "$output_file"

# Check if conversion was successful
if [ $? -eq 0 ]; then
	echo "Conversion completed successfully!"
else
	echo "Error: Conversion failed"
	exit 1
fi
