class Item
  def erase
    erase_method
  end

  private

  def erase_method
    raise NoMethodError, message: "You must define erase_method for #{self.class}"
  end
end
