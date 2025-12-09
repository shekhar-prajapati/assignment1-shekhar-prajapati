#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Error: You must provide exactly two arguments."
    echo "Usage: ./writer.sh <file-path> <write-string>"
    exit 1
fi

writefile=$1
writestr=$2

# Extract the directory path from the full file path
writedir=$(dirname "$writefile")

# Create the directory path if it does not exist
mkdir -p "$writedir"
if [ $? -ne 0 ]; then
    echo "Error: Could not create directory path $writedir"
    exit 1
fi

# Write the string to the file (overwriting if it exists)
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: Could not create or write to file $writefile"
    exit 1
fi

exit 0

