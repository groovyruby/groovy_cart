require 'spec_helper'

describe CartItem do
  it "recalculates its value after adding product" do
    c = Factory(:cart)
    p = Factory(:product)
    q = 2
    ci = CartItem.new
    ci.cart = c
    ci.product = p
    ci.quantity = 2
    ci.save
    ci.reload
    ci.item_price.should == p.price
    ci.item_value.should == p.price*q
  end
end
