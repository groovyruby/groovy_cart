class Product < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true

  belongs_to :brand
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :option_groups
  has_many :cart_items
  has_many :photos
  has_many :product_variations
  has_many :properties
  
  validates :name, :presence=>true
  validates :price, :numericality=>{:greater_than_or_equal_to=>0}, :presence=>true
  validates :price_promo, :numericality=>{:greater_than_or_equal_to=>0, :allow_nil=>true}

  accepts_nested_attributes_for :photos, :allow_destroy=>true, :reject_if=>proc{|p| p['photo'].blank?}
  accepts_nested_attributes_for :product_variations, :allow_destroy=>true
  accepts_nested_attributes_for :properties
  attr_accessible :name, :description, :brand_id, :category_ids, :price, :price_promo, :product_variations_attributes,
                  :option_group_ids, :properties_attributes, :photos_attributes

  before_save :fill_in_sku

  def get_price
    if not self.price_promo.blank? and self.price_promo>0
      self.price_promo
    else
      self.price
    end
  end

  def fill_in_sku
    self.sku = self.name.parameterize if self.sku.blank?
  end

  def get_options(identifier)
    self.option_groups.where('slug=?', identifier).first
  end

  def get_photo
    self.photos.first || self.photos.build
  end
  
end
