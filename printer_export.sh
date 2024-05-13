#!/bin/sh

# Function to copy .gcode files while maintaining directory structure
copy_gcode_files() {
    local source_dir="$1"
    local destination_dir="$2"
    local relative_path="$3"

    # Loop through files and directories in the source directory
    for item in "$source_dir"/*; do
        if [ -d "$item" ]; then
            # If it's a directory, create the corresponding directory in the destination
            mkdir -p "$destination_dir/$relative_path/$(basename "$item")"
            # Recursively call the function for the subdirectory
            copy_gcode_files "$item" "$destination_dir" "$relative_path/$(basename "$item")"
        elif [ "${item##*.}" = "gcode" ]; then
            # If it's a .gcode file, copy it to the destination
			echo $item
            cp "$item" "$destination_dir/$relative_path"
        fi
    done
}

# Check if correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

# Check if source directory exists
if [ ! -d "$1" ]; then
    echo "Error: Source directory '$1' does not exist."
    exit 1
fi

# Check if destination directory exists, if not, create it
if [ ! -d "$2" ]; then
    mkdir -p "$2"
fi

# Clear the destination directory
rm -rf "$2"/*
rm -rf "$2"/'$RECYCLE.BIN'

# Call the function to copy .gcode files while maintaining directory structure
copy_gcode_files "$1" "$2" ""

echo "Copying complete."