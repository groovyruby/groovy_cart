class Category < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true
  has_ancestry :cache_depth=>true

  scope :visible, where('is_visible=?', true)

  has_and_belongs_to_many :products
  
  validates :name, :presence=>true

  attr_accessible :name, :parent_id, :extra_params, :is_visible

  def to_s
    self.name
  end


end
