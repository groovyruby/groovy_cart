require 'spec_helper'

describe Cart do
  it "recalculates its value after adding product" do
    c = Cart.create
    p = Factory(:product)
    c.add_product p
    c.save
    c.reload
    c.discounted_value.should == p.get_price
    c.total_value.should == p.get_price
  end
end
