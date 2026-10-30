require 'optparse'
require 'rubysort'
require 'levenshtein'

class AddressBook
  def initialize(data)
    @data = data
  end

  def find_duplicate
    # Sort the data by address
    sorted_data = @data.sort_by { |entry| entry[:address] }

    # Initialize variables to track the most similar entry
    most_similar = nil
    max_similarity = 0

    # Iterate over the sorted data to find the most similar entry
    (0...sorted_data.length - 1).each do |i|
      (i + 1...sorted_data.length).each do |j|
        similarity = levenshtein_distance(sorted_data[i][:address], sorted_data[j][:address])
        if similarity > max_similarity
          max_similarity = similarity
          most_similar = sorted_data[i]
        end
      end
    end

    # Return the most similar entry
    most_similar
  end

  private

  def levenshtein_distance(str1, str2)
    if str1.length == 0
      return str2.length
    elsif str2.length == 0
      return str1.length
    else
      return 1 + levenshtein_distance(str1[1..-1], str2[1..-1])
    end
  end
end

def process_address_book(data)
  address_book = AddressBook.new(data)
  duplicate = address_book.find_duplicate
  puts "Duplicate entry with the most similar details:"
  puts "Address: #{duplicate[:address]}"
  puts "Name: #{duplicate[:name]}"
  puts "Phone: #{duplicate[:phone]}"
end

def parse_address_book
  options = {}
  OptionParser.new do |opts|
    opts.banner = "Usage: ruby main.rb [options]"

    opts.on("-h", "--help", "Prints this help") do
      puts opts.banner
      exit
    end

    opts.on("-f", "--file FILE", "Specifies the address book file") do |file|
      options[:file] = file
    end

    opts.on("-d", "--debug", "Enables debug mode") do
      options[:debug] = true
    end

    opts.parse!
  end

  if options[:file]
    data = File.readlines(options[:file]).map { |line| line.strip.split(',').map(&:strip) }
    process_address_book(data)
  else
    puts "Please specify the address book file using the -f option."
  end
end

if __FILE__ == $0
  parse_address_book
end