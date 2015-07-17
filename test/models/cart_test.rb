require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "add item to cart" do
    cart = Cart.new
    cart.add_item 1

    assert_equal false, cart.empty?
  end

  test "add more same items to cart" do
    cart = Cart.new
    5.times do
      cart.add_item 1
    end
    3.times do
      cart.add_item 2
    end
    cart.add_item 1

    assert_equal 2, cart.items.length
    assert_equal 6, cart.items.first.quantity
    assert_equal 3, cart.items.second.quantity
  end

  test "get the right product from cart" do
    cart = Cart.new
    p1 = Product.create(name:'Ruby book', price: 100)
    cart.add_item(p1.id)

    assert_equal p1.id, cart.items.first.id
    assert_kind_of Product, cart.items.first.product
  end

end
