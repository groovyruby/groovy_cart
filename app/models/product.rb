class Product < ActiveRecord::Base
  
  belongs_to :brand
  has_and_belongs_to_many :categories
  
  validates :name, :presence=>true
  
  attr_accessible :name, :description, :brand_id, :category_ids
  
end
