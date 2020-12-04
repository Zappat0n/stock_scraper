#!/usr/bin/ruby
require_relative '../lib/controller'

@controller = Controller.new

puts 'Welcome to my Stock scraper from Yahoo Finance!'
@controller.check_file
puts 'Please introduce an order (help to list orders):'

loop do
  input = gets.chomp
  @controller.instruction(input)
end
