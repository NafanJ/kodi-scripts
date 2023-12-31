#!/bin/bash

# Check if title, season, and extension parameters are provided
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "Error: Please provide a title, season number, and file extension as parameters."
    exit 1
fi

# Set the title, season number, and extension from the parameters
title="$1"
season_number="$2"
file_extension="$3"

# Get the current directory
directory_path=$(pwd)

# Counter for episode numbers
episode_number=1

# Loop through all files with the specified extension in the directory
for file in "$directory_path"/*."$file_extension"; do
    # Extract the file extension
    extension="${file##*.}"

    # Generate the new filename with the specified format
    new_filename="${title} S${season_number}E$(printf "%02d" $episode_number).$extension"

    # Rename the file
    mv "$file" "$directory_path/$new_filename"

    # Increment the episode number for the next file
    ((episode_number++))
done

echo "Files renamed successfully."
