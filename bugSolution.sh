#!/bin/bash

# This script demonstrates the solution to the race condition bug using flock.

# Create two files
touch file1.txt
touch file2.txt

# Function to check file content
check_file() {
  local file=$1
  if [ -f "$file" ]; then
    echo "$file exists"
  else
    echo "$file does not exist"
  fi
}

# Function to write to file with locking
write_to_file() {
  local file=$1
  local content=$2
  flock -x "$file" || exit 1
  echo "$content" >> "$file"
  flock -u "$file"
}

# Start processes that write to files using locking
write_to_file file1.txt "1"
write_to_file file2.txt "2"

# Wait for a bit
sleep 1

# Check the content of the files
check_file file1.txt
check_file file2.txt