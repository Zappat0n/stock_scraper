require_relative '../lib/controller'

@controller = Controller.new

puts 'Welcome to my Stock scraper from Yahoo Finance!'
puts 'Please introduce an order:'

loop do
  input = gets.chomp
  @controller.instruction(input)
end
