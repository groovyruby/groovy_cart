require 'spec_helper'

describe Admin::ProductTypesController do

  def mock_product_type(stubs={})
    @mock_product_type ||= mock_model(ProductType, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all product_types as @product_types" do
      ProductType.stub(:all) { [mock_product_type] }
      get :index
      assigns(:product_types).should eq([mock_product_type])
    end
  end

  describe "GET show" do
    it "assigns the requested product_type as @product_type" do
      ProductType.stub(:find).with("37") { mock_product_type }
      get :show, :id => "37"
      assigns(:product_type).should be(mock_product_type)
    end
  end

  describe "GET new" do
    it "assigns a new product_type as @product_type" do
      ProductType.stub(:new) { mock_product_type }
      get :new
      assigns(:product_type).should be(mock_product_type)
    end
  end

  describe "GET edit" do
    it "assigns the requested product_type as @product_type" do
      ProductType.stub(:find).with("37") { mock_product_type }
      get :edit, :id => "37"
      assigns(:product_type).should be(mock_product_type)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created product_type as @product_type" do
        ProductType.stub(:new).with({'these' => 'params'}) { mock_product_type(:save => true) }
        post :create, :product_type => {'these' => 'params'}
        assigns(:product_type).should be(mock_product_type)
      end

      it "redirects to the created product_type" do
        ProductType.stub(:new) { mock_product_type(:save => true) }
        post :create, :product_type => {}
        response.should redirect_to(admin_product_type_url(mock_product_type))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved product_type as @product_type" do
        ProductType.stub(:new).with({'these' => 'params'}) { mock_product_type(:save => false) }
        post :create, :product_type => {'these' => 'params'}
        assigns(:product_type).should be(mock_product_type)
      end

      it "re-renders the 'new' template" do
        ProductType.stub(:new) { mock_product_type(:save => false) }
        post :create, :product_type => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested product_type" do
        ProductType.should_receive(:find).with("37") { mock_product_type }
        mock_product_type.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :product_type => {'these' => 'params'}
      end

      it "assigns the requested product_type as @product_type" do
        ProductType.stub(:find) { mock_product_type(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:product_type).should be(mock_product_type)
      end

      it "redirects to the product_type" do
        ProductType.stub(:find) { mock_product_type(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(admin_product_type_url(mock_product_type))
      end
    end

    describe "with invalid params" do
      it "assigns the product_type as @product_type" do
        ProductType.stub(:find) { mock_product_type(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:product_type).should be(mock_product_type)
      end

      it "re-renders the 'edit' template" do
        ProductType.stub(:find) { mock_product_type(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested product_type" do
      ProductType.should_receive(:find).with("37") { mock_product_type }
      mock_product_type.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the product_types list" do
      ProductType.stub(:find) { mock_product_type }
      delete :destroy, :id => "1"
      response.should redirect_to(admin_product_types_url)
    end
  end

end
