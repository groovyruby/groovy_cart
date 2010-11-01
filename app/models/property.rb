class Property < ActiveRecord::Base
  belongs_to :property_type
  belongs_to :product


  attr_accessible :property_value, :property_type_id
end
