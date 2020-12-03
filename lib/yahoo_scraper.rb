require 'nokogiri'
require 'open-uri'

# Scraper for Yahoo finance
class YahooScraper
  attr_reader :doc

  ADDRESS = 'https://finance.yahoo.com/quote/'.freeze
  SEARCHES = { 'name' => 'h1[data-reactid="7"]',
               'price' => 'span[data-reactid="32"]',
               'diff' => 'span[data-reactid="33"]' }.freeze

  def initialize(quote)
    @doc = Nokogiri::HTML(URI.parse("#{ADDRESS}#{quote}").open)
  end

  def search(type)
    arr = @doc.search(SEARCHES[type])
    arr = arr.size > 1 ? arr.select { |value| value.to_s.include? 'Fw(' } : arr
    value(arr[0].to_s)
  end

  private

  def value(line)
    start = line.index('>') + 1
    finish = line.rindex('<') - 1
    line[start..finish]
  end
end
