class CartsController < ApplicationController
  before_action :find_product
  before_action :initialize_cart

  def add
    @cart.add_item(@product.id)
    session[:cart] = @cart.serialize
    redirect_to :back, notice: "#{@product.name} 已放入購物車"
  end

  private
  def find_product
    @product = Product.find_by(id: params[:id])
    redirect_to root_path if not @product
  end
end
