require 'spec_helper'

describe Product do
  should_validate_presence_of :name
  should_validate_presence_of :price
  should_validate_numericality_of :price, :greater_than_or_equal_to=>0
  should_validate_numericality_of :price_promo, :greater_than_or_equal_to=>0

  
end
