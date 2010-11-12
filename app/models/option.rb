class Option < ActiveRecord::Base

  scope :available_for_product, lambda { |product| includes(:product_variations).where('product_variations.product_id=?', product.id) }
  scope :ordered, order('options.id ASC')
  belongs_to :option_group

  has_and_belongs_to_many :product_variations

  validates :name, :presence=>true



  attr_accessible :name, :parameter_value
end
