#!/bin/bash

# File Filter and Renamer

filter_and_rename_files() {
  local file_path=$1
  local file_type=$2
  local filtered_count=0

  if [ ! -d "$file_path" ]; then
    echo "The specified path does not exist."
    return
  fi

  for file in "$file_path"/*; do
    if [ -f "$file" ]; then
      if [[ "$file" == *"$file_type"* ]]; then
        local new_file_name="${file#$file_type}"
        new_file_name="${new_file_name%.}"
        mv "$file" "$file_path/$new_file_name"
        ((filtered_count++))
      fi
    fi
  done

  echo "$filtered_count"
}

if [ "$1" == "__main__" ]; then
  file_path=$2
  file_type=$3
  filtered_count=$(filter_and_rename_files "$file_path" "$file_type")
  echo "Filtered $filtered_count files."
fi