RSpec.describe Wrangler do

  describe '.wranglers' do
    context 'creates array of wranglers' do
      it 'with one target' do
        wrangler = Wrangler.new(:tweets)

        result = wrangler.wranglers

        expect(result.class).to eq(Array)
        expect(result.size).to eq(1)
        expect(result).to include(an_instance_of(Tweets))
      end

      it 'with multiple targets' do
        wrangler = Wrangler.new([:tweets, :likes])

        result = wrangler.wranglers

        expect(result.class).to eq(Array)
        expect(result.size).to eq(2)
        expect(result).to include(an_instance_of(Tweets))
        expect(result).to include(an_instance_of(Likes))
      end
    end
  end
end
