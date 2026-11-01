#!/bin/bash


# Function to extract chemical quantity from notebook entry
extract_chemical_quantity() {
  # Validate user input
  if [ -z "$1" ]; then
    echo "Error: Notebook entry is empty"
    return 1
  fi

  # Extract chemical quantity from notebook entry
  quantity=$(echo "$1" | grep -oE '[0-9]+(\.[0-9]+)?')

  # Check if chemical quantity is found
  if [ -z "$quantity" ]; then
    echo "Error: Chemical quantity not found in notebook entry"
    return 1
  fi

  # Print extracted chemical quantity
  echo "$quantity"
}

# Main function
main() {
  # Display user prompt
  read -p "Enter laboratory notebook entry: " notebook_entry

  # Extract chemical quantity from notebook entry
  extracted_quantity=$(extract_chemical_quantity "$notebook_entry")

  # Display extracted chemical quantity
  if [ $? -eq 0 ]; then
    echo "Extracted chemical quantity: $extracted_quantity"
  else
    echo "An error occurred"
  fi
}

# Call main function
main