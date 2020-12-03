require_relative './stock'
require_relative '../io/io'

# Process the user instructions
class Controller
  include MyIO

  INSTRUCTIONS = { 'name' => proc { |stock| MyIO.puts_basic(stock.name) },
                   'price' => proc { |stock| MyIO.puts_basic(stock.price) },
                   'diff' => proc { |stock| MyIO.puts_basic(stock.diff) },
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
      stock = Stock.new(value.upcase)
      order.call(stock)
    else
      order.call
    end
  end
end
