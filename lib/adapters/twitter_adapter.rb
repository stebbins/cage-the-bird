require 'twitter'

class TwitterAdapter
  attr_reader :client

  def initialize(data)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key         = data[:consumer_key]
      config.consumer_secret      = data[:consumer_secret]
      config.access_token         = data[:access_token]
      config.access_token_secret  = data[:access_token_secret]
    end
  end
end
