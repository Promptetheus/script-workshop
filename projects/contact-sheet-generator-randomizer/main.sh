#!/bin/bash


# Read the contact list from CSV format
read_contacts() {
  local contacts=()
  while IFS=, read -r name group; do
    contacts+=("$name $group")
  done < "$1"
  echo "${contacts[@]}"
}

# Write the contacts to CSV format
write_contacts() {
  local contacts=("$@")
  printf "%s,%s\n" "${contacts[@]}" > "$2"
}

# Shuffle the contact list
shuffle_contacts() {
  local contacts=("$@")
  local shuffled=()
  for ((i = 0; i < ${#contacts[@]}; i++)); do
    local j=$(( RANDOM % ${#contacts[@]} ))
    local temp=${contacts[i]}
    contacts[i]=${contacts[j]}
    contacts[j]=$temp
  done
  echo "${contacts[@]}"
}

# Main implementation
if [ $# -ne 2 ]; then
  echo "Usage: $0 input.csv output.csv"
  exit 1
fi

input_file="$1"
output_file="$2"

contacts=($(read_contacts "$input_file"))

shuffled=($(shuffle_contacts "${contacts[@]}"))

write_contacts "${shuffled[@]}" "$output_file"

write_contacts "${contacts[@]}" "${output_file%.csv}_original.csv"

echo "Randomized contact list written to $output_file"
echo "Original contact list written to ${output_file%.csv}_original.csv"