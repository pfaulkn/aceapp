#!/bin/bash

echo running script 

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "Error: File not found: $1"
    exit 1
fi

# Read the file line by line
while read line; do
    echo $line
    # Skip empty lines and comments
    if [[ -z "$line" || "$line" =~ ^\# ]]; then
        continue
    fi

    # Split the line into key and value
    key="${line%%=*}"
    value="${line#*=}"

    # Export the variable
    export "$key"="$value"
 
    echo keyset = $key
    echo valueset = $value
done < "$1"
