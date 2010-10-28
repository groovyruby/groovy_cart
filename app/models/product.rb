class Product < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true

  belongs_to :brand
  has_and_belongs_to_many :categories
  has_many :cart_items
  
  validates :name, :presence=>true
  validates :price, :numericality=>{:greater_than_or_equal_to=>0}, :presence=>true
  validates :price_promo, :numericality=>{:greater_than_or_equal_to=>0, :allow_nil=>true}
  
  attr_accessible :name, :description, :brand_id, :category_ids, :price, :price_promo
  
  def get_price
    if not self.price_promo.blank? and self.price_promo>0
      self.price_promo
    else
      self.price
    end
  end
  
end
