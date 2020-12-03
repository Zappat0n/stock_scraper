require_relative '../lib/yahoo_scraper'

describe YahooScraper do
  describe '#search(type)' do
    # context 'Calls the given block once for each element in self, passing that element as a parameter.' do

    it 'Returns the value of the type searched' do
      scraper = YahooScraper.new('AMZN')
      expect(scraper.search('name')).to eq('Amazon.com, Inc. (AMZN)')
      expect(scraper.search('price').gsub(',', '').to_f).to be_an Float
    end
  end
end
