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
end
