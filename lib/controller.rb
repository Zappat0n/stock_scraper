require_relative './stock'

# Process the user instructions
class Controller
  INSTRUCTIONS = { 'name' => proc { |stock| puts stock.name },
                   'price' => proc { |stock| puts stock.price },
                   'finish' => proc { abort('Bye!') },
                   'help' => proc { process_help } }.freeze

  def instruction(text)
    arr = text.strip.split(' ')
    process(arr)
  end

  def self.process_help
    puts 'Help'
  end

  private

  def process(arr)
    order = INSTRUCTIONS[arr[0].downcase]

    if !order.nil?
      process_order(order, arr[1])
    else
      puts 'I do not understand this order'
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
