require 'spec_helper'

describe Gateways::CodController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'success'" do
    it "should be successful" do
      get 'success'
      response.should be_success
    end
  end

  describe "GET 'failure'" do
    it "should be successful" do
      get 'failure'
      response.should be_success
    end
  end

end
