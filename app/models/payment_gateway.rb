class PaymentGateway < ActiveRecord::Base

  scope :active, where('is_active=?', true)

  validates :name, :class_name, :presence=>true
  validates :additional_flat_fee, :additional_percentage_fee, :free_from_cart_value, :numericality=>true, :presence=>true

  def calculate_for_order_value(order)
    ret = 0
    unless order.total_value < self.free_from_cart_value
      ret += self.additional_flat_fee if self.additional_flat_fee
      if self.additional_percentage_fee
        total = ret + order.total_value
        total = total*(1+self.additional_percentage_fee/100)
        ret = total - order.total_value
      end
    end
    ret
  end

end
