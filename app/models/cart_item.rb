class CartItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :product_variation
  
  before_save :calculate_value
  
  
  def calculate_value
    unless self.product.blank?
      self.item_price = self.product.get_price
      self.item_value = self.item_price*self.quantity
    end
  end
  
end
