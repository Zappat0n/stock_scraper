require_relative './stock'
require_relative '../io/io'
require 'async/await'

# Process the user instructions
class Controller
  include MyIO
  include Async::Await

  INSTRUCTIONS = { 'name' => proc { |stock| MyIO.puts_basic(stock.name) },
                   'price' => proc { |stock| MyIO.puts_basic(stock.price) },
                   'diff' => proc { |stock| MyIO.puts_basic(stock.diff) },
                   'quote' => proc { |stock| MyIO.puts_basic(stock.quote) },
                   'finish' => proc { abort('Bye!') },
                   'help' => proc { MyIO.puts_help } }.freeze

  def instruction(text)
    arr = text.include?(' ') ? [text[0, text.index(' ')], text[text.index(' ') + 1..-1]] : [text]
    process(arr)
  end

  def check_file
    file = File.open('orders.txt')
    file_data = file.readlines.map(&:chomp)
    return if file_data.size.zero?

    MyIO.found_orders_in_file
    file_data.each do |value|
      puts "\n* #{value}"
      instruction(value)
    end
    MyIO.finished_processing_orders
  end

  private

  def process(arr)
    order = INSTRUCTIONS[arr[0].downcase]
    order.nil? ? MyIO.puts_do_not_understand : process_order(order, arr[1])
  end

  def process_order(order, value)
    if !value.nil?
      value.include?(',') ? process_multiple_order(order, value) : request(order, value.strip.upcase)
    else
      order.call
    end
  end

  async def process_multiple_order(order, values)
    values.split(',').each { |value| request(order, value.strip.upcase) }
  end

  def request(order, quote)
    if valid?(quote)
      stock = Stock.new(quote.strip.upcase)
      order.call(stock)
    else
      MyIO.puts_wrong_ticker
    end
  end

  def valid?(quote)
    quote.match?(/^[[:alpha:]]+$/)
  end
end
