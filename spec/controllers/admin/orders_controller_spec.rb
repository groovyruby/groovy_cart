require 'spec_helper'

describe Admin::OrdersController do

  def mock_order(stubs={})
    (@mock_order ||= mock_model(Order).as_null_object).tap do |order|
      order.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all orders as @orders" do
      Order.stub(:all) { [mock_order] }
      get :index
      assigns(:orders).should eq([mock_order])
    end
  end

  describe "GET show" do
    it "assigns the requested order as @order" do
      Order.stub(:find).with("37") { mock_order }
      get :show, :id => "37"
      assigns(:order).should be(mock_order)
    end
  end

  describe "GET new" do
    it "assigns a new order as @order" do
      Order.stub(:new) { mock_order }
      get :new
      assigns(:order).should be(mock_order)
    end
  end

  describe "GET edit" do
    it "assigns the requested order as @order" do
      Order.stub(:find).with("37") { mock_order }
      get :edit, :id => "37"
      assigns(:order).should be(mock_order)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created order as @order" do
        Order.stub(:new).with({'these' => 'params'}) { mock_order(:save => true) }
        post :create, :order => {'these' => 'params'}
        assigns(:order).should be(mock_order)
      end

      it "redirects to the created order" do
        Order.stub(:new) { mock_order(:save => true) }
        post :create, :order => {}
        response.should redirect_to(order_url(mock_order))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved order as @order" do
        Order.stub(:new).with({'these' => 'params'}) { mock_order(:save => false) }
        post :create, :order => {'these' => 'params'}
        assigns(:order).should be(mock_order)
      end

      it "re-renders the 'new' template" do
        Order.stub(:new) { mock_order(:save => false) }
        post :create, :order => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested order" do
        Order.should_receive(:find).with("37") { mock_order }
        mock_order.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :order => {'these' => 'params'}
      end

      it "assigns the requested order as @order" do
        Order.stub(:find) { mock_order(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:order).should be(mock_order)
      end

      it "redirects to the order" do
        Order.stub(:find) { mock_order(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(order_url(mock_order))
      end
    end

    describe "with invalid params" do
      it "assigns the order as @order" do
        Order.stub(:find) { mock_order(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:order).should be(mock_order)
      end

      it "re-renders the 'edit' template" do
        Order.stub(:find) { mock_order(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested order" do
      Order.should_receive(:find).with("37") { mock_order }
      mock_order.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the orders list" do
      Order.stub(:find) { mock_order }
      delete :destroy, :id => "1"
      response.should redirect_to(orders_url)
    end
  end

end
