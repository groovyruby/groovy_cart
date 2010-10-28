class PropertyType < ActiveRecord::Base

  FIELD_TYPES = %w( string text select boolean )

  belongs_to :product_type

  validates :name, :presence=>true
  validates :field_type, :inclusion=>{:in=>PropertyType::FIELD_TYPES}

end
