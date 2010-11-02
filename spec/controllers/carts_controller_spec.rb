require 'spec_helper'

describe CartsController do

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end

    it 'should automagically create new cart object' do
      get 'show'
      session['cart_id'].should_not be_nil
      assigns[:cart].class.should == Cart
    end
  end

end
