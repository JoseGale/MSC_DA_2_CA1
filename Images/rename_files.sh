#!/bin/bash

# Iterate through each folder in the current directory
for folder in */; do
    # Get folder name without trailing slash
    folder_name=$(basename "$folder")

    # Initialize a counter for sequential numbering
    count=1

    # Iterate through each file in the folder
    for file in "$folder"/*; do
        # Get file extension
        extension="${file##*.}"

	# Format the count with leading zeros
        formatted_count=$(printf "%03d" "$count")

	# Construct the new file name
        new_name="${folder_name}_${formatted_count}.${extension}"

        # Check if the new file name already exists
        if [ -e "$folder/$new_name" ]; then
            echo "File $new_name already exists in $folder. Skipping..."
        else
            # Rename the file with folder name and sequential number
            mv "$file" "$folder/$new_name"
            echo "Renamed $file to $new_name"
        fi

        # Increment the counter
        ((count++))
    done
done
