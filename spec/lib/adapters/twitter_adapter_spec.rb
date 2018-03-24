# TODO: figure out a way to mock twitter responses

RSpec.describe TwitterAdapter do
  describe 'initialization' do
    it 'valid with good config.yml' do
      # config = './spec/support/configs/good_config.yml'
      config = './config.yml'
      data = YAML.load_file(config)

      expect { TwitterAdapter.new(data) }.to_not raise_error
    end

    it 'invalid with bad config.yml' do
      config = './spec/support/configs/bad_config.yml'
      data = YAML.load_file(config)

      expect { TwitterAdapter.new(data) }.to raise_error(ArgumentError)
    end
  end

  describe '.pull' do
    it 'pulls likes' do
      likes = Likes.new(TWITTER_CLIENT)

      results = TWITTER_CLIENT.pull(likes)

      expect(results.class).to eq(Array)
      expect(results).to include(instance_of(Twitter::Tweet))
    end

    it 'pulls retweets' do
      retweets = Retweets.new(TWITTER_CLIENT)

      results = TWITTER_CLIENT.pull(retweets)

      expect(results.class).to eq(Array)
      expect(results).to include(instance_of(Twitter::Tweet))
    end

    it 'pulls tweets' do
      tweets = Tweets.new(TWITTER_CLIENT)

      results = TWITTER_CLIENT.pull(tweets)

      expect(results.class).to eq(Array)
      expect(results).to include(instance_of(Twitter::Tweet))
    end
  end
end
