class CartItem
  attr_reader :id
  attr_accessor :quantity

  def initialize(id, quantity = 1)
    @id = id
    @quantity = quantity
  end

end
