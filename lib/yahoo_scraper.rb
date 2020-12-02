require 'nokogiri'
require 'open-uri'

# Scraper for Yahoo finance
class YahooScraper
  ADDRESS = 'https://finance.yahoo.com/quote/'
  SEARCHES = { 'name' => 'h1[data-reactid="7"]', 'price' => 'span[data-reactid="32"]'}

  def doc(quote, type)
    @doc = Nokogiri::HTML(URI.open("#{ADDRESS}#{quote}"))
    @doc.search(SEARCHES[type]).first
  end
end

scraper = YahooScraper.new
puts scraper.doc('AMZN', 'name')
