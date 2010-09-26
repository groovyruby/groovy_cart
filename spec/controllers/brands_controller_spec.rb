require 'spec_helper'

describe BrandsController do
  render_views
  
  def mock_brand(stubs={})
    @mock_brand ||= mock_model(Brand, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all brands as @brands" do
      Brand.stub(:all) { [mock_brand] }
      get :index
      assigns(:brands).should eq([mock_brand])
    end
  end

  describe "GET show" do
    it "assigns the requested brand as @brand" do
      Brand.stub(:find).with("37") { mock_brand }
      get :show, :id => "37"
      assigns(:brand).should be(mock_brand)
    end
  end

end
