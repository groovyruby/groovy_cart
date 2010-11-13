class Brand < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true

  has_many :products
  
  validates :name, :presence=>true

  attr_accessible :name


  def to_s
    self.name
  end
  
  
end
