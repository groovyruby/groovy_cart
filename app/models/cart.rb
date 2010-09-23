class Cart < ActiveRecord::Base
  
  
  has_many :cart_items
  before_save :recalculate
  
  def add_product(product, quantity=1)
    ci = self.find_cart_item(product)
    ci.quantity += quantity
    ci.save
    self.save
  end
  
  def change_quantity(product, new_quantity=1)
    ci = self.find_cart_item(product)
    unless new_quantity
      ci.destroy
    else
      ci.quantity = quantity
      ci.save
    end
    self.save
  end
  
  def remove_product(product)
    ci =self.cart_items.where('product_id=?', product.id).first
    ci.destroy
  end
  
  def recalculate
    self.total_value = 0
    for ci in self.cart_items.all
      self.total_value += ci.item_value
    end
    self.discounted_value = self.total_value
  end
  
  def find_cart_item(product)
    ci =self.cart_items.where('product_id=?', product.id).first
    if ci.blank?
      ci = self.cart_items.new
      ci.quantity = 0
      ci.product = product
      ci.save
    end
    ci
  end
    
end
