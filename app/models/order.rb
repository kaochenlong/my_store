class Order < ActiveRecord::Base
  has_many :order_items

  def order_number
    "00000000#{id}"
  end

  def state_readable
    case state
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

  state_machine :initial => :pending do
    event :pay do
      transition :pending => :paid
    end

    event :out do
      transition :paid => :out
    end

    event :deliver do
      transition :out => :deliver
    end
  end

end
