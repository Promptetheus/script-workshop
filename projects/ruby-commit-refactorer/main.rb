def refactor_commit_message(original_message)
  # Remove leading and trailing whitespace
  original_message = original_message.strip

  # Check if the message is empty
  return "Fix: Commit message is empty" if original_message.empty?

  # Split the message into parts
  parts = original_message.split(" ")

  # Check if the message is a single word
  return "Fix: Commit message should be a sentence" if parts.size == 1

  # Refactor the message
  refactored_message = "Refactor: #{parts[0]} - #{parts[1]}"

  # Add a verb to the end of the message
  refactored_message += " - #{parts[2]}"

  # Return the refactored message
  refactored_message
end

def main
  # Get the original commit message from the user
  original_message = gets.chomp

  # Refactor the commit message
  refactored_message = refactor_commit_message(original_message)

  # Print the refactored message
  puts "Refactored Commit Message: #{refactored_message}"
end

if __FILE__ == $0
  main
end