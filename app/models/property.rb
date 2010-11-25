class Property < ActiveRecord::Base
  belongs_to :property_type
  belongs_to :product

  has_attached_file :attachment,
                    :styles => {:thumb=>"50x50#", :display=>proc{|p| p.property_type.field_options}} ,
                    :whiny=>false

  attr_accessible :property_value, :property_type_id, :attachment
end
