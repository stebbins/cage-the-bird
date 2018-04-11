require './spec/support/fake_client'

RSpec.describe TwitterAdapter do
  describe '.pull' do
    before(:each) do
      @adapter = TwitterAdapter.new(FakeClient, '')
    end

    it 'pulls likes' do
      likes = Likes.new(@adapter)

      results = @adapter.pull(likes)

      expect(results.class).to eq(Array)
    end

    it 'pulls retweets' do
      retweets = Retweets.new(@adapter)

      results = @adapter.pull(retweets)

      expect(results.class).to eq(Array)
    end

    it 'pulls tweets' do
      tweets = Tweets.new(@adapter)

      results = @adapter.pull(tweets)

      expect(results.class).to eq(Array)
    end
  end
end
