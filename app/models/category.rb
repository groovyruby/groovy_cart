class Category < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true
  
  has_and_belongs_to_many :products
  
  validates :name, :presence=>true

  attr_accessible :name


end
