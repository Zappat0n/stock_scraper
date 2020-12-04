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

  def self.found_orders_in_file
    puts 'I have found some orders in "order.txt". Processing them:'
  end

  def self.puts_help
    returnval  = "\n"
    returnval += " * name: Returns the name of the stock, ex: name MSFT\n"
    returnval += " * price: Returns the price of the stock, ex: price GE\n"
    returnval += " * diff: Returns the difference in price from the previous day, ex: diff AAPL\n"
    returnval += " * quote: Returns the name, price, and difference from yesterday of a given stock, ex: quote GOOG\n"
    returnval += " * finish: Ends the application\n"
    returnval += " * You can request multiple stocks, ex: quote NVDA,MU,BAC\n"
    returnval += "\n"
    puts returnval
  end
end
