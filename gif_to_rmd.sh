#!/bin/bash

# Simple script to add all the images for a GIF based conference
# Uses the style of xaringan in RMD for the pattern for each slide set
# Presumes that the names are all sequential/organized to some degree
# Run first before adding a YAML to the RMD

for i in *.gif; do
	echo "---"
	echo "background-image: url(\"$i\")"
	echo "background-size: contain\n"
done >> cath-conference.Rmd

# Needs to be made executable with `chmod +x gifs-to-rmd.sh` from terminal
# Then, runs via `sh ../../R/gifs-to-rmd.sh` (e.g. absolute path needed)
