require_relative './stock.rb'

# Process the user instructions
class Controller
  def instuction(text)
    arr = text.strip.split(' ')
    process(arr)
  end

  private

  def process(arr)
    case arr[0].downcase
    when 'name'
      process_name(arr[1].upcase)
    end
  end

  def process_name(name)
    stock = Stock.new(name)
    puts stock.name
  end
end
