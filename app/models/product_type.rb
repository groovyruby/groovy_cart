class ProductType < ActiveRecord::Base

  has_many :property_types
  has_many :products

  validates :name, :presence=>true

  accepts_nested_attributes_for :property_types, :allow_destroy=>true, :reject_if => proc {|f| f['name'].blank? }

  attr_accessible :name, :property_types_attributes

  before_save :update_products


  def update_products
    for p in self.products
      p.assign_properties
      p.save
    end
  end

end
