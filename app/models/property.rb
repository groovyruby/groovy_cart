class Property < ActiveRecord::Base
  belongs_to :property_type
  belongs_to :product
end
