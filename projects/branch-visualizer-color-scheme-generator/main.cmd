color_scheme() {
  # Define a dictionary to map words to colors
  declare -A color_map
  color_map["red"]="FF0000"
  color_map["green"]="00FF00"
  color_map["blue"]="0000FF"
  color_map["yellow"]="FFFF00"
  color_map["purple"]="FF00FF"
  color_map["orange"]="FFA500"
  color_map["pink"]="FFC0CB"

  # Define a function to generate a unique color
  generate_color() {
    local word=$1
    local color_map=("${!color_map[@]}")
    local random_color
    for random_color in "${color_map[@]}"; do
      if [[ $word != *$random_color* ]]; then
        echo "$random_color"
        return
      fi
    done
    echo "FF0000"  # default color
  }

  # Generate a unique color scheme for each word in the input
  for word in "$@"; do
    echo -n "${generate_color "$word"} "
  done
  echo
}

# Example usage:
branch_names=("feature/new-feature" "fix/bug-fix" "docs/new-docs")
commits=("commit1" "commit2" "commit3")
color_scheme "${branch_names[@]}" "${commits[@]}"