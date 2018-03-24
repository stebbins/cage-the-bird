class Wrangler
  attr_accessor :wranglers
  attr_reader :client

  def initialize(targets, client = TWITTER_CLIENT)
    @client = client

    # Normalize initialization variable if array isn't passed
    targets = [targets] unless targets.class == Array
    @wranglers = targets.map { |t| wrangle(t) }
  end

  def clear
    wranglers.each do |wrangler|
      while true
        begin
          wrangler.pull
          wrangler.erase
        rescue NoTweetsError
          break
        end
      end
    end
  end

  private

  # Converts a symbol into a new class instance
  def wrangle(item)
    normalized_string = item.to_s.capitalize
    eval(normalized_string).new(client)
  end
end
