class Admin::OrdersController < Admin::BaseController
  before_action :find_order, except: [:index]

  def index
    @orders = Order.all
  end

  def show
  end

  def pay
    if @order.pay
      redirect_to :back, notice: '狀態已變更'
    else
      redirect_to :back, notice: '狀態發生錯誤'
    end
  end

  def out
    if @order.out
      redirect_to :back, notice: '狀態已變更'
    else
      redirect_to :back, notice: '狀態發生錯誤'
    end
  end

  def deliver
    if @order.deliver
      redirect_to :back, notice: '狀態已變更'
    else
      redirect_to :back, notice: '狀態發生錯誤'
    end
  end

  private
  def find_order
    @order = Order.find_by(id: params[:id])
  end

end
