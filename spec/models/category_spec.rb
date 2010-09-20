require 'spec_helper'

describe Category do
  before(:each) do
    @valid_attributes = {:name=>"test cat", :slug=>"category"}
  end
  
  it "should be valid only with valid attributes" do
    c = Category.new(@valid_attributes)
    c.should be_valid
    c = Category.new({:name=>"test"})
    c.should be_valid
  end
  
  it "should not be valid with incomplete or invalid set of attributes" do
    c = Category.new
    c.should_not be_valid
    c = Category.new({:slug=>"test"})
    c.should_not be_valid
  end
  
  
end
