require 'nokogiri'
require 'open-uri'

# Scraper for Yahoo finance
class YahooScraper
  ADDRESS = 'https://finance.yahoo.com/quote/'.freeze
  SEARCHES = { 'name' => 'h1[data-reactid="7"]', 'price' => 'span[data-reactid="32"]' }.freeze

  def initialize(quote)
    @doc = Nokogiri::HTML(URI.open("#{ADDRESS}#{quote}"))
  end

  def search(type)
    line = @doc.search(SEARCHES[type]).first
    value(line.to_s)
  end

  private

  def value(line)
    start = line.index('>') + 1
    finish = line.rindex('<') - 1
    line[start..finish]
  end
end
