require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ProductsHelper. For example:
#
# describe ProductsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe ProductsHelper do
  
  it "show correct product price in span" do
    p = Product.new
    p.price = 10
    helper.show_price(p).should == "<span class=\"price\">#{number_to_currency(10)}</span>"
    p.price_promo = 20
    helper.show_price(p).should == "<span class=\"price\">#{number_to_currency(20)}</span>"
  end
  
  it "should show both prices" do
    p = Product.new
    p.price = 10
    helper.show_full_price(p).should == "<span class=\"price\">#{number_to_currency(10)}</span>"
    p.price_promo = 20
    helper.show_full_price(p).should == "<span class=\"old_price\">#{number_to_currency(10)}</span><span class=\"price_promo\">#{number_to_currency(20)}</span>"
  end
  
end
