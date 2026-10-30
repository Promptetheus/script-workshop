#!/bin/bash


# Check if the script is being run directly
if [ "$1" != "" ]; then
  echo "Usage: $0 <config_auditor_output_file>"
  exit 1
fi

# Check if the config_auditor_output_file is provided
if [ -z "$1" ]; then
  echo "Please provide the config_auditor_output_file"
  exit 1
fi

# Define the expected configurations
declare -A expected_configurations
expected_configurations["key1"]="value1"
expected_configurations["key2"]="value2"
expected_configurations["key3"]="value3"

# Read the config_auditor_output_file
while IFS= read -r line; do
  # Check if the line is a key-value pair
  if [[ $line =~ ^([a-zA-Z0-9_]+)=([^=]+)$ ]]; then
    key=${BASH_REMATCH[1]}
    value=${BASH_REMATCH[2]}
    # Check if the key exists in the expected configurations
    if [ -v expected_configurations[$key] ]; then
      # Check if the values match
      if [ "$value" != "${expected_configurations[$key]}" ]; then
        echo "Discrepancy found: $key = $value (expected: ${expected_configurations[$key]})"
      else
        echo "No discrepancy found: $key = $value"
      fi
    else
      echo "Key not found: $key"
    fi
  fi
done < "$1"