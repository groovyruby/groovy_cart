require 'spec_helper'

describe Admin::PaymentGatewaysController do

  def mock_payment_gateway(stubs={})
    (@mock_payment_gateway ||= mock_model(PaymentGateway).as_null_object).tap do |payment_gateway|
      payment_gateway.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all payment_gateways as @payment_gateways" do
      PaymentGateway.stub(:all) { [mock_payment_gateway] }
      get :index
      assigns(:payment_gateways).should eq([mock_payment_gateway])
    end
  end

  describe "GET show" do
    it "assigns the requested payment_gateway as @payment_gateway" do
      PaymentGateway.stub(:find).with("37") { mock_payment_gateway }
      get :show, :id => "37"
      assigns(:payment_gateway).should be(mock_payment_gateway)
    end
  end

  describe "GET new" do
    it "assigns a new payment_gateway as @payment_gateway" do
      PaymentGateway.stub(:new) { mock_payment_gateway }
      get :new
      assigns(:payment_gateway).should be(mock_payment_gateway)
    end
  end

  describe "GET edit" do
    it "assigns the requested payment_gateway as @payment_gateway" do
      PaymentGateway.stub(:find).with("37") { mock_payment_gateway }
      get :edit, :id => "37"
      assigns(:payment_gateway).should be(mock_payment_gateway)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created payment_gateway as @payment_gateway" do
        PaymentGateway.stub(:new).with({'these' => 'params'}) { mock_payment_gateway(:save => true) }
        post :create, :payment_gateway => {'these' => 'params'}
        assigns(:payment_gateway).should be(mock_payment_gateway)
      end

      it "redirects to the created payment_gateway" do
        PaymentGateway.stub(:new) { mock_payment_gateway(:save => true) }
        post :create, :payment_gateway => {}
        response.should redirect_to(payment_gateway_url(mock_payment_gateway))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved payment_gateway as @payment_gateway" do
        PaymentGateway.stub(:new).with({'these' => 'params'}) { mock_payment_gateway(:save => false) }
        post :create, :payment_gateway => {'these' => 'params'}
        assigns(:payment_gateway).should be(mock_payment_gateway)
      end

      it "re-renders the 'new' template" do
        PaymentGateway.stub(:new) { mock_payment_gateway(:save => false) }
        post :create, :payment_gateway => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested payment_gateway" do
        PaymentGateway.should_receive(:find).with("37") { mock_payment_gateway }
        mock_payment_gateway.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :payment_gateway => {'these' => 'params'}
      end

      it "assigns the requested payment_gateway as @payment_gateway" do
        PaymentGateway.stub(:find) { mock_payment_gateway(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:payment_gateway).should be(mock_payment_gateway)
      end

      it "redirects to the payment_gateway" do
        PaymentGateway.stub(:find) { mock_payment_gateway(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(payment_gateway_url(mock_payment_gateway))
      end
    end

    describe "with invalid params" do
      it "assigns the payment_gateway as @payment_gateway" do
        PaymentGateway.stub(:find) { mock_payment_gateway(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:payment_gateway).should be(mock_payment_gateway)
      end

      it "re-renders the 'edit' template" do
        PaymentGateway.stub(:find) { mock_payment_gateway(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested payment_gateway" do
      PaymentGateway.should_receive(:find).with("37") { mock_payment_gateway }
      mock_payment_gateway.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the payment_gateways list" do
      PaymentGateway.stub(:find) { mock_payment_gateway }
      delete :destroy, :id => "1"
      response.should redirect_to(payment_gateways_url)
    end
  end

end
