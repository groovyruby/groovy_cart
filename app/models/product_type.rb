class ProductType < ActiveRecord::Base

  has_many :property_types

  validates :name, :presence=>true

  accepts_nested_attributes_for :property_types, :allow_destroy=>true, :reject_if => proc {|f| f['name'].blank? }

  attr_accessible :name, :property_types_attributes

end
