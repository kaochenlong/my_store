class Admin::ProductsController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_only!

  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice:'成功新增商品'
    else
      # ...
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :is_online, :image)
  end

  def admin_only!
    redirect_to root_path, notice:'your access is not allowed!' unless current_user.is_admin?
  end
end
