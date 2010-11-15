require 'spec_helper'

describe Admin::ShippingMethodsController do

  def mock_shipping_method(stubs={})
    (@mock_shipping_method ||= mock_model(ShippingMethod).as_null_object).tap do |shipping_method|
      shipping_method.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all shipping_methods as @shipping_methods" do
      ShippingMethod.stub(:all) { [mock_shipping_method] }
      get :index
      assigns(:shipping_methods).should eq([mock_shipping_method])
    end
  end

  describe "GET show" do
    it "assigns the requested shipping_method as @shipping_method" do
      ShippingMethod.stub(:find).with("37") { mock_shipping_method }
      get :show, :id => "37"
      assigns(:shipping_method).should be(mock_shipping_method)
    end
  end

  describe "GET new" do
    it "assigns a new shipping_method as @shipping_method" do
      ShippingMethod.stub(:new) { mock_shipping_method }
      get :new
      assigns(:shipping_method).should be(mock_shipping_method)
    end
  end

  describe "GET edit" do
    it "assigns the requested shipping_method as @shipping_method" do
      ShippingMethod.stub(:find).with("37") { mock_shipping_method }
      get :edit, :id => "37"
      assigns(:shipping_method).should be(mock_shipping_method)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created shipping_method as @shipping_method" do
        ShippingMethod.stub(:new).with({'these' => 'params'}) { mock_shipping_method(:save => true) }
        post :create, :shipping_method => {'these' => 'params'}
        assigns(:shipping_method).should be(mock_shipping_method)
      end

      it "redirects to the created shipping_method" do
        ShippingMethod.stub(:new) { mock_shipping_method(:save => true) }
        post :create, :shipping_method => {}
        response.should redirect_to(shipping_method_url(mock_shipping_method))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved shipping_method as @shipping_method" do
        ShippingMethod.stub(:new).with({'these' => 'params'}) { mock_shipping_method(:save => false) }
        post :create, :shipping_method => {'these' => 'params'}
        assigns(:shipping_method).should be(mock_shipping_method)
      end

      it "re-renders the 'new' template" do
        ShippingMethod.stub(:new) { mock_shipping_method(:save => false) }
        post :create, :shipping_method => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested shipping_method" do
        ShippingMethod.should_receive(:find).with("37") { mock_shipping_method }
        mock_shipping_method.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :shipping_method => {'these' => 'params'}
      end

      it "assigns the requested shipping_method as @shipping_method" do
        ShippingMethod.stub(:find) { mock_shipping_method(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:shipping_method).should be(mock_shipping_method)
      end

      it "redirects to the shipping_method" do
        ShippingMethod.stub(:find) { mock_shipping_method(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(shipping_method_url(mock_shipping_method))
      end
    end

    describe "with invalid params" do
      it "assigns the shipping_method as @shipping_method" do
        ShippingMethod.stub(:find) { mock_shipping_method(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:shipping_method).should be(mock_shipping_method)
      end

      it "re-renders the 'edit' template" do
        ShippingMethod.stub(:find) { mock_shipping_method(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested shipping_method" do
      ShippingMethod.should_receive(:find).with("37") { mock_shipping_method }
      mock_shipping_method.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the shipping_methods list" do
      ShippingMethod.stub(:find) { mock_shipping_method }
      delete :destroy, :id => "1"
      response.should redirect_to(shipping_methods_url)
    end
  end

end
