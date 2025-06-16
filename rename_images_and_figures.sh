#!/bin/bash


# Simple script to replace text in filenames and markdown files
# Usage: ./rename.sh "old_text" "new_text"
# Used to help rename file names and references in markdown files

if [ $# -ne 2 ]; then
    echo "Usage: $0 <old_text> <new_text>"
    echo "Example: $0 L7332 L7"
    exit 1
fi

OLD="$1"
NEW="$2"

echo "Replacing '$OLD' with '$NEW' in current directory..."

# First, rename all files containing the old text
for file in *"$OLD"*; do
    if [ -f "$file" ]; then
        newfile="${file//$OLD/$NEW}"
        if [ "$file" != "$newfile" ]; then
            mv "$file" "$newfile"
            echo "Renamed: $file → $newfile"
        fi
    fi
done

# Then update all markdown files
for md in *.{qmd,Rmd,md}; do
    if [ -f "$md" ]; then
        # Escape special characters for sed
        OLD_ESC=$(printf '%s\n' "$OLD" | sed 's/[[\.*^$()+?{|]/\\&/g')
        NEW_ESC=$(printf '%s\n' "$NEW" | sed 's/[[\.*^$()+?{|]/\\&/g')
        
        # Use sed to replace all occurrences (works on both macOS and Linux)
        if [[ "$OSTYPE" == "darwin"* ]]; then
            sed -i '' "s/$OLD_ESC/$NEW_ESC/g" "$md"
        else
            sed -i "s/$OLD_ESC/$NEW_ESC/g" "$md"
        fi
        echo "Updated: $md"
    fi
done

echo "Done!"
