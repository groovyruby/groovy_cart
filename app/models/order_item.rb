class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :product_variation
  belongs_to :order
end
