require 'spec_helper'

describe Brand do
  before(:each) do
    @valid_attributes = {:name=>"test brand", :slug=>"test"}
  end
  
  it "should be valid only with valid attributes" do
    b = Brand.new(@valid_attributes)
    b.should be_valid
    b = Brand.new({:name=>"test"})
    b.should be_valid
  end
  
  it "should not be valid with incomplete or invalid set of attributes" do
    b = Brand.new
    b.should_not be_valid
    b = Brand.new({:slug=>"test"})
    b.should_not be_valid
  end
  
  
  
end
