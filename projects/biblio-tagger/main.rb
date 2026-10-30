# Define a hash to store the mapping of keywords to tags
keyword_map = {
  'science' => ['biology', 'chemistry', 'physics'],
  'technology' => ['computer science', 'engineering', 'informatics'],
  'social sciences' => ['psychology', 'sociology', 'anthropology']
}

def parse_tags(input_string)
  # Split the input string into individual tags
  tags = input_string.split(', ')

  # Convert the tags to lowercase and remove duplicates
  tags = tags.map(&:downcase).uniq

  # Return the list of tags
  tags
end

def match_keywords(tags, keyword_map)
  # Initialize an empty set to store the matched tags
  matched_tags = Set.new

  # Iterate over each tag
  tags.each do |tag|
    # Check if the tag is in the keyword map
    keyword_map.each do |keyword, k_tags|
      if k_tags.include?(tag)
        # If the tag is in the keyword map, add the corresponding keywords to the matched tags
        matched_tags |= keyword_map[keyword]
      end
    end
  end

  # Return the matched tags
  matched_tags
end

def assign_tags(entry, matched_tags)
  # Initialize an empty string to store the assigned tags
  assigned_tags = ''

  # Iterate over each matched tag
  matched_tags.each do |tag|
    # Append the matched tag to the assigned tags string
    assigned_tags += "#{tag}, "
  end

  # Remove the trailing comma and space
  assigned_tags = assigned_tags.chomp(', ')

  # Return the assigned tags
  assigned_tags
end

def main
  # Get the input from the user
  input_string = gets.chomp

  # Parse the input string into tags
  tags = parse_tags(input_string)

  # Match the keywords with the tags
  matched_tags = match_keywords(tags, keyword_map)

  # Assign the matched tags to the bibliography entry
  entry = gets.chomp
  assigned_tags = assign_tags(entry, matched_tags)

  # Print the assigned tags
  puts "Assigned tags for '#{entry}': #{assigned_tags}"
end

if __FILE__ == $0
  main
end