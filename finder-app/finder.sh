#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Error: Provide exactly two arguments."
    echo "Usage: ./finder.sh <directory-path> <search-string>"
    exit 1
fi

# Assign arguments to variables
filesdir=$1
searchstr=$2

# Check if filesdir exists and is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir is not a valid directory."
    exit 1
fi

# Find all files in the directory and its subdirectories
file_count=0
matching_line_count=0

# Iterate over all files in the directory
while IFS= read -r -d '' file; do
    # Increment file count
    ((file_count++))
    
    # Count the number of lines matching searchstr in the current file
    matching_lines_in_file=$(grep -c -- "$searchstr" "$file")
    
    # Increment the matching line count
    ((matching_line_count+=matching_lines_in_file))
done < <(find "$filesdir" -type f -print0)

# Output the results
echo "The number of files are $file_count and the number of matching lines are $matching_line_count"

