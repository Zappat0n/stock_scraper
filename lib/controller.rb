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

  private

  def process(arr)
    order = INSTRUCTIONS[arr[0].downcase]

    if !order.nil?
      process_order(order, arr[1])
    else
      MyIO.puts_do_not_understand
    end
  end

  def process_order(order, value)
    if !value.nil?
      if !(value.include? ',')
        request(order, value.strip.upcase)
      else
        process_multiple_order(order, value)
      end
    else
      order.call
    end
  end

  async def process_multiple_order(order, values)
    values.split(',').each do |value|
      request(order, value.strip.upcase)
    end
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
