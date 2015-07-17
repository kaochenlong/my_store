class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(id)
    item = @items.find { |t| t.id == id }
    if item
      item.quantity += 1
    else
      @items << CartItem.new(id)
    end
  end

  def empty?
    @items.empty?
  end
end
