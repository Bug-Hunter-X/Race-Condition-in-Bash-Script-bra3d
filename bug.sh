#!/bin/bash

# This script demonstrates a race condition bug.

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

# Start two background processes to modify the files
( while true; do echo "1" >> file1.txt; sleep 1; done ) &
( while true; do echo "2" >> file2.txt; sleep 1; done ) &

# Wait for some time before checking
sleep 3

# Check the content of the files
check_file file1.txt
check_file file2.txt

# Stop background processes
kill %1
kill %2