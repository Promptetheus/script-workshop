#!/bin/bash


rename_files() {
  local directory=$1
  local output_prefix=$2
  local renamed_files=()

  if [ ! -d "$directory" ]; then
    echo "Directory '$directory' does not exist."
    return 1
  fi

  for file in "$directory"/*; do
    if [ -f "$file" ]; then
      local base=${file%.*}
      local extension=${file##*.}
      local new_file="${output_prefix}.${extension}"
      local new_path="${directory}/${new_file}"
      if [ -d "$new_path" ]; then
        rename_files "$new_path" "$output_prefix"
      else
        mv "$file" "$new_path"
        renamed_files+=("$new_file")
      fi
    fi
  done

  echo "${renamed_files[@]}"
}

# Example usage:
if [ "$0" == "$BASH_SOURCE" ]; then
  directory="/path/to/batch/file/directory"
  output_prefix="new_"
  renamed_files=$(rename_files "$directory" "$output_prefix")
  echo "Renamed files:"
  echo "$renamed_files"
fi