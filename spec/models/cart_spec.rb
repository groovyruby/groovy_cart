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
    c.add_product p
    c.discounted_value.should == p.get_price * 2
    c.total_value.should == p.get_price * 2
  end

  it "recalculates its value after adding product variation" do
    c = Cart.create
    p = Factory(:complex_product)
    pv = Factory(:product_variation)
    c.add_product p, pv
    c.save
    c.reload
    c.discounted_value.should == pv.price
    c.total_value.should == pv.price
    c.add_product p, pv
    c.discounted_value.should == pv.price * 2
    c.total_value.should == pv.price * 2
    p1 = Factory(:product)
    c.add_product p1
    c.total_value.should == pv.price * 2 + p1.get_price
  end

  it "recalculates its value after adding multiple products at once" do
    c = Cart.create
    p = Factory(:product)
    c.add_product p, nil, 2
    c.total_value.should == p.get_price*2
  end

  it "recalculates its value after removing product from cart" do
    c = Cart.create
    p = Factory(:complex_product)
    pv = Factory(:product_variation)
    c.add_product p, pv, 2
    c.total_value.should == pv.price * 2
    p1 = Factory(:product)
    c.add_product p1
    c.total_value.should == pv.price * 2 + p1.get_price
    c.remove_product p, pv
  end
end
