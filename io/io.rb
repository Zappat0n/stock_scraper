# Class for managing input and output format
module MyIO
  def self.puts_basic(text)
    puts text
  end

  def self.puts_do_not_understand
    puts 'I do not understand this order'
  end

  def self.puts_help
    puts 'Help'
  end
end
