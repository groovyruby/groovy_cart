class ProductVariation < ActiveRecord::Base
  belongs_to :product
  has_and_belongs_to_many :options
  has_one :photo
  
  validates :price, :presence=>true, :numericality=>true

  accepts_nested_attributes_for :photo, :reject_if=>proc{|p|p['photo'].blank?}

  attr_accessible :price, :option_ids, :photo_attributes
end
