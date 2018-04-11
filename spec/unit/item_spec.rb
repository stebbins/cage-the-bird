require './spec/support/fake_client'

RSpec.describe Item do
  describe '.pull' do
    before(:each) do
      @client = TwitterAdapter.new(FakeClient, '')
    end

    it 'pulls items' do
      @client.client.return_item = true
      item = Likes.new(@client)

      result = item.pull

      expect(result.size).to eq(1)
      expect(item.backlog).to eq(result)
    end

    it 'raises NoTweetsError if pull returns empty' do
      item = Likes.new(@client)

      expect { item.pull }.to raise_error NoTweetsError
    end
  end

  describe '.erase' do
    it 'erases backlog' do
      client = TwitterAdapter.new(FakeClient, '')
      client.client.return_item = true
      item = Likes.new(client)
      item.pull
      expect(item.backlog.size).to eq(1)

      item.erase

      expect(item.backlog.size).to eq(0)
    end
  end
end
