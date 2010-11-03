class Cart < ActiveRecord::Base
  
  
  has_many :cart_items
  before_save :recalculate
  
  def add_product(product, product_variation=nil, quantity=1)
    ci = self.find_cart_item(product, product_variation)
    ci.quantity += quantity
    ci.save
    self.save
  end
  
  def change_quantity(product, product_variation=nil, new_quantity=1)
    ci = self.find_cart_item(product, product_variation)
    unless new_quantity
      ci.destroy
    else
      ci.quantity = quantity
      ci.save
    end
    self.save
  end
  
  def remove_product(product, product_variation=nil)
    ci =self.cart_items.where('product_id=?', product.id)
    ci = ci.where('product_variation_id=?', product_variation) unless product_variation.blank?
    ci = ci.first
    ci.destroy
    self.save
  end
  
  def recalculate
    self.total_value = 0
    for ci in self.cart_items.all
      self.total_value += ci.item_value
    end
    self.discounted_value = self.total_value
  end
  
  def find_cart_item(product, product_variation)
    ci =self.cart_items.where('product_id=?', product.id)
    ci = ci.where('product_variation_id=?', product_variation) unless product_variation.blank?
    ci = ci.first
    if ci.blank?
      ci = self.cart_items.new
      ci.quantity = 0
      ci.product = product
      ci.product_variation = product_variation
      ci.save
    end
    ci
  end
    
end
