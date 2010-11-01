require 'spec_helper'

describe ProductVariation do
  should_validate_presence_of :price
  should_validate_numericality_of :price
  should_belong_to :product
  should_have_and_belong_to_many :options
end
