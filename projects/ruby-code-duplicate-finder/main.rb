def find_duplicate_lines(file_path)
  # Read the file contents
  file_contents = File.read(file_path)

  # Split the file contents into lines
  lines = file_contents.split("\n")

  # Create a hash to store the lines and their line numbers
  line_hash = {}

  # Iterate over the lines and store them in the hash
  lines.each_with_index do |line, index|
    line_hash[line] = index + 1
  end

  # Filter the hash to find duplicate lines
  duplicate_lines = line_hash.select { |line, number| line_hash[line] > number }.keys

  # Return the duplicate lines and their line numbers
  duplicate_lines.map do |line|
    [line, line_hash[line]]
  end
end

def main
  # Get the file path from the user
  file_path = gets.chomp

  # Validate the file path
  if file_path.empty?
    puts "Please enter a valid file path."
    return
  end

  # Find and print the duplicate lines
  duplicate_lines = find_duplicate_lines(file_path)
  if duplicate_lines.empty?
    puts "No duplicate lines found."
  else
    puts "Duplicate lines found:"
    duplicate_lines.each do |line, line_number|
      puts "#{line}: #{line_number}"
    end
  end
end

if __FILE__ == $0
  main
end