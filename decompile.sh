#!/bin/bash

# Prompt the user for input
# TODO: change this so it doesn't have to be in the same directory
echo "Please enter the full name of the jar file (the jar file has to be in the same directory as the decompile.sh):"
read name

# installing needed packages
echo "installing needed packages"
sudo apt install unzip -y

# notification of the name
echo "Using $name as the name of the jar file"

# unziping the jar file
echo "unziping $name"
unzip "$name"

# Check if the directory exists
if [ -d "$name" ]; then
    # Change to the directory
    cd "$name"
    echo "Changed to directory: $name"
else
    echo "Directory $name does not exist."
fi

# this command once in the directory will add the java files in the same folder or sub folder as the class folders
# TODO: fix this command to work with special characters like $
find . -type f -name "*.class" -exec sh -c 'f="{}"; javap -c -p "$f" > "$(dirname "$f")/$(basename "$f" .class).java"' \;
