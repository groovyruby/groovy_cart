require 'spec_helper'

describe Admin::BannersController do

  def mock_banner(stubs={})
    (@mock_banner ||= mock_model(Banner).as_null_object).tap do |banner|
      banner.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all banners as @banners" do
      Banner.stub(:all) { [mock_banner] }
      get :index
      assigns(:banners).should eq([mock_banner])
    end
  end

  describe "GET show" do
    it "assigns the requested banner as @banner" do
      Banner.stub(:find).with("37") { mock_banner }
      get :show, :id => "37"
      assigns(:banner).should be(mock_banner)
    end
  end

  describe "GET new" do
    it "assigns a new banner as @banner" do
      Banner.stub(:new) { mock_banner }
      get :new
      assigns(:banner).should be(mock_banner)
    end
  end

  describe "GET edit" do
    it "assigns the requested banner as @banner" do
      Banner.stub(:find).with("37") { mock_banner }
      get :edit, :id => "37"
      assigns(:banner).should be(mock_banner)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created banner as @banner" do
        Banner.stub(:new).with({'these' => 'params'}) { mock_banner(:save => true) }
        post :create, :banner => {'these' => 'params'}
        assigns(:banner).should be(mock_banner)
      end

      it "redirects to the created banner" do
        Banner.stub(:new) { mock_banner(:save => true) }
        post :create, :banner => {}
        response.should redirect_to(banner_url(mock_banner))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved banner as @banner" do
        Banner.stub(:new).with({'these' => 'params'}) { mock_banner(:save => false) }
        post :create, :banner => {'these' => 'params'}
        assigns(:banner).should be(mock_banner)
      end

      it "re-renders the 'new' template" do
        Banner.stub(:new) { mock_banner(:save => false) }
        post :create, :banner => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested banner" do
        Banner.should_receive(:find).with("37") { mock_banner }
        mock_banner.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :banner => {'these' => 'params'}
      end

      it "assigns the requested banner as @banner" do
        Banner.stub(:find) { mock_banner(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:banner).should be(mock_banner)
      end

      it "redirects to the banner" do
        Banner.stub(:find) { mock_banner(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(banner_url(mock_banner))
      end
    end

    describe "with invalid params" do
      it "assigns the banner as @banner" do
        Banner.stub(:find) { mock_banner(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:banner).should be(mock_banner)
      end

      it "re-renders the 'edit' template" do
        Banner.stub(:find) { mock_banner(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested banner" do
      Banner.should_receive(:find).with("37") { mock_banner }
      mock_banner.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the banners list" do
      Banner.stub(:find) { mock_banner }
      delete :destroy, :id => "1"
      response.should redirect_to(banners_url)
    end
  end

end
