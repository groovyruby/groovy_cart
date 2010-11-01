class PropertyType < ActiveRecord::Base

  FIELD_TYPES = %w( string text select checkbox )

  belongs_to :product_type

  has_many :properties, :dependent=>:destroy

  validates :name, :presence=>true
  validates :field_type, :inclusion=>{:in=>PropertyType::FIELD_TYPES}

end
