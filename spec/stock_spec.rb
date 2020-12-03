require_relative '../lib/stock'

describe Stock do
  describe '#name' do
    it 'Returns the name of the stock' do
      stock = Stock.new('AMZN')
      expect(stock.name).to eq('Amazon.com, Inc. (AMZN)')
    end

    it 'Returns the price of the stock' do
      stock = Stock.new('AMZN')
      expect(stock.price.gsub(',', '').to_f).to be_an Float
    end
  end
end
