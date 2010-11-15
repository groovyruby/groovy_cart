class ShippingMethod < ActiveRecord::Base

  PRICING_TYPES = %w( flat_per_item flat_per_order )

  validates :name, :presence=>true
  validates :flat_price, :numericality=>true
  validates :free_from_cart_value, :numericality=>true
  validates :pricing_type, :inclusion=>{:in=>ShippingMethod::PRICING_TYPES}
  
end
