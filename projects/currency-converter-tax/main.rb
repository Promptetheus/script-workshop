class CurrencyConverter
  def initialize(initial_amount, currency, tax_rate)
    @initial_amount = initial_amount
    @currency = currency
    @tax_rate = tax_rate
  end

  def convert_and_calculate_tax
    # Define conversion rates (this can be replaced with API calls or external data sources)
    conversion_rates = {
      'USD' => 1,
      'EUR' => 0.88,
      'GBP' => 0.76,
      'INR' => 74.83,
      'AUD' => 1.48,
      'CAD' => 1.31,
      'CHF' => 0.93
    }

    # Validate user input
    if !conversion_rates.key?(currency.upcase)
      raise "Unsupported currency: #{currency}"
    end

    # Convert initial amount to the specified currency
    converted_amount = @initial_amount * conversion_rates[currency.upcase]

    # Calculate tax amount
    tax_amount = converted_amount * @tax_rate / 100

    # Return converted amount and tax amount
    [converted_amount, tax_amount]
  end
end

def main
  print "Enter initial amount: "
  initial_amount = gets.chomp.to_f

  print "Enter currency (e.g., USD, EUR, GBP, INR, AUD, CAD, CHF): "
  currency = gets.chomp.upcase

  print "Enter tax rate (in %): "
  tax_rate = gets.chomp.to_f

  converter = CurrencyConverter.new(initial_amount, currency, tax_rate)
  converted_amount, tax_amount = converter.convert_and_calculate_tax

  puts "Converted amount: #{converted_amount.round(2)}"
  puts "Tax amount: #{tax_amount.round(2)}"
end

if __FILE__ == $0
  main
end