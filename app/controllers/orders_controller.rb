class OrdersController < ApplicationController

  before_action :initialize_cart

  def create

    nonce_from_the_client = params[:payment_method_nonce]

    result = Braintree::Transaction.sale(
      :amount => @cart.total_price,
      :payment_method_nonce => nonce_from_the_client
    )

    @order = Order.new(order_params)
    if result
      @cart.items.each do |item|
        @order.order_items.build({product_id: item.id, quantity: item.quantity})
      end
      if @order.save
        # 1. clean cart
        session[:cart] = nil

        # 2. redirect to product page
        redirect_to products_path, notice:'感謝!'
      else
        render 'carts/checkout'
      end
    else
      render 'carts/checkout'
    end
  end

  private
  def order_params
    params.require(:order).permit(:recipient, :address, :tel, :email, :note)
  end

end
