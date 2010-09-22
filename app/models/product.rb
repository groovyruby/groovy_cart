class Product < ActiveRecord::Base
  
  belongs_to :brand
  has_and_belongs_to_many :categories
  
  validates :name, :presence=>true
  validates :price, :numericality=>{:greater_than_or_equal_to=>0}, :presence=>true
  validates :price_promo, :numericality=>{:greater_than_or_equal_to=>0, :allow_nil=>true}
  
  attr_accessible :name, :description, :brand_id, :category_ids, :price, :price_promo
  
  
  
end
