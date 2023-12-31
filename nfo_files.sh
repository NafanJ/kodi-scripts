#!/bin/bash

# Check if three arguments are provided
if [ "$#" -ne 4 ]; then
  echo "Usage: $0 <name> <season> <range> <arc>"
  exit 1
fi

name="$1"
season="$2"
episode_range="$3"
arc="$4"


# Format season with leading zeros
season=$(printf "%02d" "$season")

# Set the output directory to the current directory
output_directory=$(pwd)

# Loop to create multiple .nfo files
for ((i = 1; i <= episode_range; i++)); do
  # Define the file name with a timestamp and format i with leading zeros
  file_name="${name} S${season}E$(printf "%02d" "$i").nfo"

  # Full path to the .nfo file
  file_path="$output_directory/$file_name"

  # Create the .nfo file with XML content
  cat <<EOF >"$file_path"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<episodedetails>
        <title>${arc} E$(printf "%02d" "$i")</title>
        <season>${season}</season>
        <episode>${i}</episode>
</episodedetails>
EOF

  # Display a message indicating the creation of the file
  echo "Created $file_path"
done

echo "Script completed."
