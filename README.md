# Race Condition in Bash Script

This repository demonstrates a race condition bug in a simple bash script. Two background processes concurrently write to separate files, resulting in unpredictable file content due to interleaved writes. The solution addresses the race condition using appropriate locking mechanisms.

## Bug

The `bug.sh` script exhibits a race condition where the two concurrent file writes can lead to incomplete or corrupted data within the files. 

## Solution

The `bugSolution.sh` script demonstrates how to resolve the race condition using flock to acquire exclusive locks on each file before writing. This ensures only one process can write to a file at a time, preserving data integrity.

## Running the Scripts

1. Clone the repository
2. Ensure you have bash installed
3. Run the scripts using `bash bug.sh` and `bash bugSolution.sh`