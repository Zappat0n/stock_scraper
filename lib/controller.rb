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
    arr = text.strip.split(' ')
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
        stock = Stock.new(value.upcase)
        order.call(stock)
      else
        process_multiple_order(order,value)
      end
    else
      order.call
    end
  end

  async def process_multiple_order(order, values)
    values.split(',').each do |value|
      stock = Stock.new(value.strip.upcase)
      order.call(stock)
    end
  end
end
