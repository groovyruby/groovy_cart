require 'spec_helper'

describe CategoriesController do
  render_views
  
  def mock_category(stubs={})
    @mock_category ||= mock_model(Category, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all categories as @categories" do
      Category.stub(:all) { [mock_category] }
      get :index
      assigns(:categories).should eq([mock_category])
    end
  end

  describe "GET show" do
    it "assigns the requested category as @category" do
      Category.stub(:find).with("37") { mock_category }
      get :show, :id => "37"
      assigns(:category).should be(mock_category)
    end
  end


end
