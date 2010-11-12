class ProductVariation < ActiveRecord::Base
  belongs_to :product
  has_and_belongs_to_many :options

  validates :price, :presence=>true, :numericality=>true

  attr_accessible :price, :option_ids

  def to_s
    self.options.all.map{|o| o.name}.join(', ')
  end
end
