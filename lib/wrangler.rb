class Wrangler
  attr_accessor :wranglers
  attr_reader :client

  def initialize(params)
    @client = params[:client] 

    # Normalize initialization variable if array isn't passed
    targets = params[:targets]
    targets = [targets] unless targets.class == Array
    @wranglers = targets.map { |t| convert_to_class(t) }
  end

  def clear
    wranglers.each do |wrangler|
      while true
        begin
          wrangler.pull
          wrangler.erase
          sleep(5)
        rescue NoTweetsError
          break
        end
      end
    end
  end

  private

  # Converts a symbol into a new class instance
  def convert_to_class(item)
    normalized_string = item.to_s.capitalize
    eval(normalized_string).new(client)
  end
end
