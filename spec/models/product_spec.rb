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

  context "with defined product type" do
    it "should have properties cloned from product type" do
      product_type = Factory(:product_type)
      Factory(:size, :product_type=>product_type)
      Factory(:weight, :product_type=>product_type)
      p = Factory.build(:product)
      p.product_type = product_type
      p.assign_properties
      p.properties.size.should == product_type.property_types.count
    end

    it "should get new property if new property type was added in product_type" do
      product_type = Factory(:product_type)
      Factory(:size, :product_type=>product_type)
      Factory(:weight, :product_type=>product_type)
      p = Factory.build(:product)
      p.product_type = product_type
      p.assign_properties
      p.save
      p.reload
      color = Factory(:color)
      product_type.property_types << color
      product_type.save
      p.reload
      product_type.reload
      p.properties.size.should == product_type.property_types.count
    end

    it "should destroy it's property if new property type was added in product_type" do
      product_type = Factory(:product_type)
      Factory(:size, :product_type=>product_type)
      Factory(:weight, :product_type=>product_type)
      color = Factory(:color, :product_type=>product_type)
      p = Factory.build(:product)
      p.product_type = product_type
      p.assign_properties
      p.save
      p.reload
      p.properties.size.should == product_type.property_types.count
      product_type.property_types.destroy(color)
      product_type.save
      p.reload
      product_type.reload
      p.properties.size.should == product_type.property_types.count
    end

  end
end
