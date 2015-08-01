class OrdersController < ApplicationController

  def create
    render text: params[:order]
  end

  private
  def order_params
    params.require(:order).permit(:recipient, :address, :tel, :email, :note)
  end

end
