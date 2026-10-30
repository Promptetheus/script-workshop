require 'csv'

def process_audit_files(input_file, output_file)
  # Initialize an empty set to store unique audit files
  unique_files = Set.new

  # Initialize an empty array to store the processed audit files
  processed_files = []

  # Open the input CSV file for reading
  CSV.foreach(input_file, headers: false) do |row|
    # Check if the row has the expected number of columns (1)
    if row.size == 1
      # Add the file to the set of unique files
      unique_files.add(row[0])
    else
      # If the row has extra data, skip it
      next
    end
  end

  # Open the output CSV file for writing
  CSV.open(output_file, 'w') do |output_csv|
    # Write each unique file to the output CSV
    unique_files.each do |file|
      output_csv << [file]
    end
  end
end

# Check if the input file exists
if ARGV.size != 2
  puts "Usage: ruby main.rb <input_file> <output_file>"
  exit 1
end

input_file = ARGV[0]
output_file = ARGV[1]

# Process the audit files
process_audit_files(input_file, output_file)