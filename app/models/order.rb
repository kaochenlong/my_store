class Order < ActiveRecord::Base
  has_many :order_items

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
