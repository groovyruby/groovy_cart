class ShippingMethod < ActiveRecord::Base

  PRICING_TYPES = %w( flat_per_item flat_per_order )

  validates :name, :presence=>true
  validates :flat_price, :numericality=>true
  validates :free_from_cart_value, :numericality=>true, :if=>:free_from_cart_value?
  validates :pricing_type, :inclusion=>{:in=>ShippingMethod::PRICING_TYPES}


  def calculate_for_cart(cart)
    ret = 0.0
    if self.pricing_type=='flat_per_item'
      ret = self.flat_price * cart.get_items_count
    elsif self.pricing_type=='flat_per_order'
      ret = self.flat_price
    end
    
    if self.free_from_cart_value != nil and self.free_from_cart_value > cart.items_value
      ret = 0
    end
    
    ret
  end

  def to_s
    self.name
  end
end
