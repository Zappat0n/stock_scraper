require_relative '../lib/controller'

describe Controller do
  let(:controller) { Controller.new }

  describe '#instruction(text)' do
    it 'Writtes the result of the order to the console' do
      expect { print(controller.instruction('name AMZN')) }.to output(print('Amazon.com, Inc. (AMZN)')).to_stdout
    end
  end
end
