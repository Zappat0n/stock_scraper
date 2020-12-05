require_relative '../lib/yahoo_scraper'

describe YahooScraper do
  describe '#search(type)' do
    let(:scraper) { YahooScraper.new('AMZN') }

    it 'Returns the value of the type searched' do
      expect(scraper.search('name')).to eq('Amazon.com, Inc. (AMZN)')
      expect(scraper.search('price')).to be_an String
      expect(scraper.search('diff')).to be_an String
    end
  end
end
