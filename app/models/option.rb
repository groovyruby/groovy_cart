class Option < ActiveRecord::Base
  

  belongs_to :option_group

  has_and_belongs_to_many :product_variations

  validates :name, :presence=>true



  attr_accessible :name, :parameter_value
end
