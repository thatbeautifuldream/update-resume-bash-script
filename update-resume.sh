#!/bin/bash

# Source and destination paths for the resume
SOURCE="$HOME/Downloads/Milind_Mishra_Resume.pdf"
DEST="$HOME/code/self/milindmishra.com/public/Milind_Mishra_Resume.pdf"

# Check if source file exists
if [ ! -f "$SOURCE" ]; then
    echo "Error: Resume not found in Downloads folder"
    exit 1
fi

# Change to the website directory
cd "$HOME/code/self/milindmishra.com" || {
    echo "Error: Could not change to website directory"
    exit 1
}

# Fetch latest changes without merging
echo "Fetching latest changes..."
if ! git fetch origin main; then
    echo "Error: Failed to fetch latest changes"
    exit 1
fi

# Copy the file
cp -p "$SOURCE" "$DEST"  # Using -p to preserve attributes

# Check if copy was successful
if [ $? -eq 0 ]; then
    echo "Resume updated successfully"
    
    # Git operations
    if ! git add .; then
        echo "Error: Failed to stage changes"
        exit 1
    fi
    
    if ! git commit -m "updating resume at $(date '+%Y-%m-%d %H:%M:%S') by update-resume.sh"; then
        echo "Error: Failed to commit changes"
        exit 1
    fi
    
    # Force push since we're intentionally replacing the PDF
    if ! git push --force-with-lease origin main; then
        echo "Error: Failed to push changes."
        echo "Someone might have pushed changes while you were updating."
        echo "Please run the script again."
        exit 1
    fi
    
    echo "Git operations completed successfully"
else
    echo "Error: Failed to copy resume"
    exit 1
fi
