class Cart
  attr_reader :items

  def initialize(items = [])
    @items = items
  end

  def self.build_from_hash(hash)
    all_items = []
    unless hash.nil?
      all_items = hash["items"].map { |item| CartItem.new(item["id"], item["quantity"]) }
    end
    new(all_items)
  end

  def serialize
    serialized_items = @items.map { |item| { "id" => item.id , "quantity" => item.quantity } }

    {
      "items" => serialized_items
    }
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
