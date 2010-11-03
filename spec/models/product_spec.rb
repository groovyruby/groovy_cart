require 'spec_helper'

describe Product do
  should_validate_presence_of :name
  should_validate_presence_of :price
  should_validate_numericality_of :price, :greater_than_or_equal_to=>0
  should_validate_numericality_of :price_promo, :greater_than_or_equal_to=>0

  it "should fill in sku if name is blank" do
    p = Factory.build(:product)
    p.sku = nil
    p.save
    p.sku.should_not be_nil
    p.sku.should == p.name.parameterize
  end
  
end
