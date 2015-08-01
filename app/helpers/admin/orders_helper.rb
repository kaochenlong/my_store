module Admin::OrdersHelper
  def order_state(order)
    case order.state
    when 'pending'
      '成交'
    when 'paid'
      '已付款'
    when 'out'
      '已出貨'
    when 'deliver'
      '已收貨'
    end
  end
end
