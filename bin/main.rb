require_relative '../lib/controller'

@controller = Controller.new

loop do
  input = gets.chomp
  @controller.instruction(input)
end
