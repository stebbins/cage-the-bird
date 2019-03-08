require 'twitter'

class TwitterAdapter
  attr_reader :client, :user

  def initialize(client_class, data)
    begin
      @client = client_class.new do |config|
        config.consumer_key         = data[:consumer_key]
        config.consumer_secret      = data[:consumer_secret]
        config.access_token         = data[:access_token]
        config.access_token_secret  = data[:access_token_secret]
      end
      @user = client.user
    rescue
      raise ArgumentError, "Something's wrong with your config.yaml file!"
    end
  end

  def pull(item)
    case item
    when Likes
      client.favorites(count: 100)
    when Retweets
      params = { count: 200 }
      params.merge!(max_id: $max_tweet_id) if $max_tweet_id
      client.retweeted_by_me(params)
    when Tweets
      params = {
        count: 200,
        include_rts: false
      }
      params.merge!(max_id: $max_tweet_id) if $max_tweet_id
      client.user_timeline(user, params)
    end
  end

  def erase(item)
    tweets = item.backlog
    tweets.each do |tweet|
      case item
      when Likes
        client.unfavorite(tweet)
      when Retweets
        client.unretweet(tweet)
      when Tweets
        client.destroy_status(tweet)
      end
    rescue StandardError => e
      puts "error, skipping. #{e.inspect}"
    end
  end

  def username
    self.client.user.name
  end
end
