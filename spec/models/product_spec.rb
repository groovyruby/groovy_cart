require 'spec_helper'

describe Product do
  before(:each) do
    @valid_attributes = {:name=>"test product"}
  end
  
  it "should be valid only with valid attributes" do
    p = Product.new(@valid_attributes)
    p.should be_valid
  end
  
  it "should not be valid with incomplete or invalid set of attributes" do
    p = Product.new
    p.should_not be_valid
  end
  
end
