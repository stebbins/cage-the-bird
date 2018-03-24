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
    client.erase(self)
    @backlog = []
  end

  private

  def initialize_method
    must_define_in_child('initialize_method')
  end

  def must_define_in_child(method)
    raise NoMethodError, message: "You must define #{method} for #{self.class}"
  end
end

class NoTweetsError < StandardError
end
