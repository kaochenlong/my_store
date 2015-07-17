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

  def total_price
    @items.inject(0) { |sum, item| sum + item.price }

    #total = 0
    #@items.each do |item|
      #total += item.price
    #end
    #return total
  end
end
