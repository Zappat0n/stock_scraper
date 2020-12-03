# Class for managing input and output format
module MyIO
  def self.puts_basic(text)
    puts text
  end

  def self.puts_do_not_understand
    puts 'I do not understand this order'
  end

  def self.puts_wrong_ticker
    puts 'Wrong stock ticker'
  end

  def self.puts_help
    puts
    puts ' * name: Returns the name of the stock, ex: name MSFT'
    puts ' * price: Returns the price of the stock, ex: price GE'
    puts ' * diff: Returns the difference in price from the previous day, ex: diff AAPL'
    puts ' * quote: Returns the name, price, and difference from yesterday of a given stock, ex: quote GOOG'
    puts ' * finish: Ends the application'
    puts ' * You can request multiple stocks, ex: quote NVDA,MU,BAC'
    puts
  end
end
