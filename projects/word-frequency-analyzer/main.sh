#!/bin/sh

# word-frequency-analyzer
# Analyzes the frequency of words in a given text file and prints the top N most frequent words.

file="$1"
n="${2:-5}"

# Check if file is provided
if [ -z "$file" ]; then
    echo "Error: Path to the text file is required."
    exit 1
fi

# Check if file exists
if [ ! -f "$file" ]; then
    echo "Error: File does not exist."
    exit 1
fi

# Check if n is a number
if ! [[ "$n" =~ ^[0-9]+$ ]]; then
    echo "Error: Number of top frequent words must be a positive integer."
    exit 1
fi

# Read file, count word frequencies, sort and get top N
cat "$file" | tr -cs '[:alnum:]' '[\n*]' | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -nr | head -n "$n"
