require 'date'

class ContractTracker
  def initialize
    @contracts = {}
  end

  # Method to add a new contract
  def add_contract(name, expiration_date)
    @contracts[name] = expiration_date
  end

  # Method to send notifications for upcoming contract renewals
  def send_notifications
    today = Date.today
    @contracts.each do |name, expiration_date|
      if expiration_date < today
        puts "Notification: Contract #{name} has expired."
      elsif expiration_date < today + 30
        puts "Reminder: Contract #{name} is up for renewal in 30 days."
      end
    end
  end
end

class Contract
  attr_accessor :name, :expiration_date

  def initialize(name, expiration_date)
    @name = name
    @expiration_date = expiration_date
  end

  # Method to check if the contract has expired
  def expired?
    @expiration_date < Date.today
  end
end

def main
  tracker = ContractTracker.new

  loop do
    puts "Contract Tracker Menu"
    puts "1. Add a new contract"
    puts "2. Send notifications"
    puts "3. Exit"

    choice = gets.chomp

    case choice
    when "1"
      name = gets.chomp
      expiration_date = Date.parse(gets.chomp)
      tracker.add_contract(name, expiration_date)
    when "2"
      tracker.send_notifications
    when "3"
      break
    else
      puts "Invalid choice. Please choose a valid option."
    end
  end
end

if __FILE__ == $0
  main
end