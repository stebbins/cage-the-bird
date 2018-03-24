RSpec.describe Bird do
  context 'initialization' do
    it 'valid with good config.yml' do
      config = './spec/support/configs/good_config.yml'

      expect { Bird.new(config) }.to_not raise_error
    end

    it 'invalid with bad config.yml' do
      config = './spec/support/configs/bad_config.yml'

      expect { Bird.new(config) }.to raise_error(ArgumentError)
    end
  end
end
