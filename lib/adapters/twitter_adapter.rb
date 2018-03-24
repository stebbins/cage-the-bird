require 'twitter'

class TwitterAdapter
  attr_reader :client, :user

  def initialize(data)
    begin
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key         = data[:consumer_key]
        config.consumer_secret      = data[:consumer_secret]
        config.access_token         = data[:access_token]
        config.access_token_secret  = data[:access_token_secret]
      end
      @user = client.user
    rescue
      raise ArgumentError, message: config_error_message
    end
  end

  def pull(item)
    case item
    when Likes
      client.favorites(count: 100)
    when Retweets
      client.retweeted_by_me(count: 200)
    when Tweets
      client.user_timeline(user, count: 200, include_rts: false)
    end
  end

  def erase(item)
    tweets = item.backlog
    case item
    when Likes
      client.unfavorite(tweets)
    when Retweets
      client.unretweet(tweets)
    when Tweets
      client.destroy_status(tweets)
    end
  end

  def username
    self.client.user.name
  end

  private

  def config_error_message
    "Something's wrong with your config.yaml file!"
  end

end
