#!/bin/bash

# Check if the directory path is provided as a command-line argument
if [ -z "$1" ]; then
    echo "Usage: $0 <directory-path>"
    exit 1
fi

# Store the directory path from the argument
DIR_PATH="$1"

# Check if the provided argument is a valid directory
if [ ! -d "$DIR_PATH" ]; then
    echo "Error: Directory $DIR_PATH does not exist."
    exit 1
fi

# Create a timestamp in the format YYYY-MM-DD_HH-MM-SS
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Define the backup folder name
BACKUP_DIR="${DIR_PATH}/backup_${TIMESTAMP}"

# Create the backup folder
mkdir -p "$BACKUP_DIR"

# Copy all files from the original directory to the backup folder
cp -r "$DIR_PATH"/* "$BACKUP_DIR"

# Output the result of the backup creation
echo "Backup created: $BACKUP_DIR"

# Implement the rotation logic
# Find all backup folders and store them in a list
BACKUP_LIST=($(ls -dt ${DIR_PATH}/backup_*))

# Check if there are more than 3 backups
if [ ${#BACKUP_LIST[@]} -gt 3 ]; then
    # Calculate how many backups to delete
    DELETE_COUNT=$((${#BACKUP_LIST[@]} - 3))

    # Remove the oldest backups
    for ((i=3; i<${#BACKUP_LIST[@]}; i++)); do
        rm -rf "${BACKUP_LIST[$i]}"
        echo "Removed old backup: ${BACKUP_LIST[$i]}"
    done
fi

