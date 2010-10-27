require 'spec_helper'

describe Setting do
  fixtures :settings
  context "returns correct value and correct type" do
    it "returns float" do
      v = Setting.get('float')
      v.should == 12.3
      v.class.should == Float
    end
    it "returns integer" do
      v = Setting.get('integer')
      v.should == 123
      v.class.should == Fixnum
    end
    it "returns boolean" do
      v = Setting.get('boolean')
      v.should == true
      v.class.should == TrueClass
    end
    it "returns string" do
      v = Setting.get('string')
      v.should == "foo"
      v.class.should == String
    end
    it "returns string" do
      v = Setting.get('text')
      v.should == "lorem ipsum"
      v.class.should == String
    end
  end
  context "creates new setting if asked to" do
    it "return empty string if setting does not exists" do
      Setting.get("foobar").should == ""
    end
    
    it "creates new setting when asked to (and setting did not exists before)" do
      Setting.get("foobar", true)
      Setting.find_by_identifier("foobar").label.should == "foobar"
    end
  end
end
