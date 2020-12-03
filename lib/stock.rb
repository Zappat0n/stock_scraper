require_relative '../lib/yahoo_scraper'

# Class to handle the stocks
class Stock < YahooScraper
  def name
    search('name')
  end

  def price
    search('price')
  end
end
