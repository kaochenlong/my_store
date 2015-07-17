class Cart

  def initialize
    @items = []
  end

  def add_item(id)
    @items << id
  end

  def empty?
    @items.empty?
  end

end
