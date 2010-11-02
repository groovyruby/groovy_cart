class CartItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :product_variation
  
  before_save :calculate_value
  
  
  def calculate_value
    unless self.product.blank?
      if self.product_variation.blank?
        self.item_price = self.product.get_price
      else
        self.item_price = self.product_variation.price
      end
      self.item_value = self.item_price*self.quantity
    end
  end
  
end
