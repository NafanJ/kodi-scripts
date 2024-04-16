#!/bin/bash

# Help message function
show_help() {
    echo "Usage: $0 title season_number [-h|--help]"
    echo "  title          : Title of the TV series"
    echo "  season_number  : Season number"
    echo "  -h, --help     : Display this help message and exit"
}

# Check for help option
if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

# Check if title and season parameters are provided
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Error: Please provide a title and season number as parameters."
    show_help
    exit 1
fi

# Set the title and season number from the parameters
title="$1"
season_number="$2"

# Get the current directory
directory_path=$(pwd)

# Counter for episode numbers
episode_number=1

# Loop through all files in the directory
for file in "$directory_path"/*; do
    # Skip if not a file
    if [ ! -f "$file" ]; then
        continue
    fi

    # Extract the file extension
    extension="${file##*.}"

    # Continue if the file has no extension or if it's a hidden file (starts with a dot)
    if [[ "$extension" == "$file" ]] || [[ "${file##*/}" == .* ]]; then
        continue
    fi

    # Generate the new filename with the specified format
    new_filename="${title} S${season_number}E$(printf "%02d" $episode_number).$extension"

    # Rename the file
    if mv "$file" "$directory_path/$new_filename"; then
        echo "Renamed $file to $new_filename"
    else
        echo "Failed to rename $file"
    fi

    # Increment the episode number for the next file
    ((episode_number++))
done

echo "Files renamed successfully."
