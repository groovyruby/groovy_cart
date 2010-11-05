require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the BannersHelper. For example:
#
# describe BannersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe BannersHelper do
  describe "load banner" do
    it "should properly generate banner code" do
      b = Factory(:banner)
      p = b.banner_placement
      helper.load_banner(p.identifier).should match /<div class=\"banner_wrapper\" id=\"banner_#{b.id}\"><a href=\".*\"><img alt=\".*\" src=\".*\" \/><\/a><\/div>/
    end
  end
end
