class Item
  attr_accessor :backlog
  attr_reader :client

  def initialize(client)
    @client = client
    @backlog = []
  end

  def pull
    items = client.pull(self)
    unless items.empty?
      @backlog += items
    else
      raise NoTweetsError
    end
  end

  def erase
    puts "Undoing #{self.class}.."
    client.erase(self)
    @backlog = []
  end
end

class NoTweetsError < StandardError
end
