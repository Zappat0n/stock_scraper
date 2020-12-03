require_relative './yahoo_scraper'

# Class to handle the stocks
class Stock < YahooScraper
  def name
    search('name')
  end

  def price
    search('price')
  end

  def diff
    search('diff')
  end

  def quote
    "#{name}   #{price}   #{diff}"
  end
end
