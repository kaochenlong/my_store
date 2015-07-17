require 'test_helper'

class CartItemTest < ActiveSupport::TestCase

  test "cart item can calculate price itself" do
    cart = Cart.new

    p1 = Product.create(name:'ruby book', price:10)
    p2 = Product.create(name:'php book', price:20)

    3.times do
      cart.add_item(p1.id)
    end
    2.times do
      cart.add_item(p2.id)
    end

    assert_equal 30, cart.items.first.price
    assert_equal 40, cart.items.second.price
  end

end
