class Category < ActiveRecord::Base
  
  
  has_and_belongs_to_many :products
  
  validates :name, :presence=>true
  validates :slug, :presence=>true, :uniqueness=>true
  
  attr_accessible :name, :slug
  
  before_validation :fill_in_slug
  
  def fill_in_slug
    self.slug = self.name.parameterize if self.slug.blank? and not self.name.blank?
  end
  
  
end
