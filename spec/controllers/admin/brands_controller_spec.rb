require 'spec_helper'

describe Admin::BrandsController do
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

  describe "GET new" do
    it "assigns a new brand as @brand" do
      Brand.stub(:new) { mock_brand }
      get :new
      assigns(:brand).should be(mock_brand)
    end
  end

  describe "GET edit" do
    it "assigns the requested brand as @brand" do
      Brand.stub(:find).with("37") { mock_brand }
      get :edit, :id => "37"
      assigns(:brand).should be(mock_brand)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created brand as @brand" do
        Brand.stub(:new).with({'these' => 'params'}) { mock_brand(:save => true) }
        post :create, :brand => {'these' => 'params'}
        assigns(:brand).should be(mock_brand)
      end

      it "redirects to the created brand" do
        Brand.stub(:new) { mock_brand(:save => true) }
        post :create, :brand => {}
        response.should redirect_to(admin_brand_url(mock_brand))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved brand as @brand" do
        Brand.stub(:new).with({'these' => 'params'}) { mock_brand(:save => false) }
        post :create, :brand => {'these' => 'params'}
        assigns(:brand).should be(mock_brand)
      end

      it "re-renders the 'new' template" do
        Brand.stub(:new) { mock_brand(:save => false) }
        post :create, :brand => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested brand" do
        Brand.should_receive(:find).with("37") { mock_brand }
        mock_brand.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :brand => {'these' => 'params'}
      end

      it "assigns the requested brand as @brand" do
        Brand.stub(:find) { mock_brand(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:brand).should be(mock_brand)
      end

      it "redirects to the brand" do
        Brand.stub(:find) { mock_brand(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(admin_brand_url(mock_brand))
      end
    end

    describe "with invalid params" do
      it "assigns the brand as @brand" do
        Brand.stub(:find) { mock_brand(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:brand).should be(mock_brand)
      end

      it "re-renders the 'edit' template" do
        Brand.stub(:find) { mock_brand(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested brand" do
      Brand.should_receive(:find).with("37") { mock_brand }
      mock_brand.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the brands list" do
      Brand.stub(:find) { mock_brand }
      delete :destroy, :id => "1"
      response.should redirect_to(admin_brands_url)
    end
  end

end
