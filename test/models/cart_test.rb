require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "add item to cart" do
    cart = Cart.new
    cart.add_item 1

    assert_equal false, cart.empty?
  end
end
