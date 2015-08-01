class CartsController < ApplicationController
  before_action :find_product, only: [:add]
  before_action :initialize_cart

  def add
    @cart.add_item(@product.id)
    session[:cart] = @cart.serialize
    redirect_to :back, notice: "#{@product.name} 已放入購物車"
  end

  def show
  end

  def destroy
    session[:cart] = nil
    redirect_to root_path, notice: '購物車已清空'
  end

  def checkout
    @order = Order.new
  end

  private
  def find_product
    @product = Product.find_by(id: params[:id])
    redirect_to root_path if not @product
  end
end
