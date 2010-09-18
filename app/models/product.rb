class Product < ActiveRecord::Base
  
  belongs_to :brand
  
  validates :name, :presence=>true
  
  attr_accessible :name, :description, :brand_id
  
end
