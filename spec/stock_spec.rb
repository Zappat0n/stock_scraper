require_relative '../lib/stock'

describe Stock do
  let(:stock) { Stock.new('AMZN') }

  describe '#name' do
    it 'Returns the name of the stock' do
      expect(stock.name).to eq('Amazon.com, Inc. (AMZN)')
    end
  end
  describe '#price' do
    it 'Returns the price of the stock' do
      expect(stock.price.gsub(',', '').to_f).to be_an Float
    end
  end

  describe '#diff' do
    it 'Returns the difference of the price of the stock' do
      expect(stock.diff).to be_an String
    end
  end
end
