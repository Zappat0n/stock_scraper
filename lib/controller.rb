require_relative './stock'

# Process the user instructions
class Controller
  def instruction(text)
    arr = text.strip.split(' ')
    process(arr)
  end

  private

  def process(arr)
    case arr[0].downcase
    when 'name'
      process_name(arr[1].upcase)
    when 'price'
      process_price(arr[1].upcase)
    when 'finish'
      abort('Bye!')
    end
  end

  def process_name(name)
    stock = Stock.new(name)
    puts stock.name
  end

  def process_price(name)
    stock = Stock.new(name)
    puts stock.price.to_s
  end
end
