require 'spec_helper'

describe Admin::BannerTypesController do

  def mock_banner_type(stubs={})
    (@mock_banner_type ||= mock_model(BannerType).as_null_object).tap do |banner_type|
      banner_type.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all banner_types as @banner_types" do
      BannerType.stub(:all) { [mock_banner_type] }
      get :index
      assigns(:banner_types).should eq([mock_banner_type])
    end
  end

  describe "GET show" do
    it "assigns the requested banner_type as @banner_type" do
      BannerType.stub(:find).with("37") { mock_banner_type }
      get :show, :id => "37"
      assigns(:banner_type).should be(mock_banner_type)
    end
  end

  describe "GET new" do
    it "assigns a new banner_type as @banner_type" do
      BannerType.stub(:new) { mock_banner_type }
      get :new
      assigns(:banner_type).should be(mock_banner_type)
    end
  end

  describe "GET edit" do
    it "assigns the requested banner_type as @banner_type" do
      BannerType.stub(:find).with("37") { mock_banner_type }
      get :edit, :id => "37"
      assigns(:banner_type).should be(mock_banner_type)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created banner_type as @banner_type" do
        BannerType.stub(:new).with({'these' => 'params'}) { mock_banner_type(:save => true) }
        post :create, :banner_type => {'these' => 'params'}
        assigns(:banner_type).should be(mock_banner_type)
      end

      it "redirects to the created banner_type" do
        BannerType.stub(:new) { mock_banner_type(:save => true) }
        post :create, :banner_type => {}
        response.should redirect_to(banner_type_url(mock_banner_type))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved banner_type as @banner_type" do
        BannerType.stub(:new).with({'these' => 'params'}) { mock_banner_type(:save => false) }
        post :create, :banner_type => {'these' => 'params'}
        assigns(:banner_type).should be(mock_banner_type)
      end

      it "re-renders the 'new' template" do
        BannerType.stub(:new) { mock_banner_type(:save => false) }
        post :create, :banner_type => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested banner_type" do
        BannerType.should_receive(:find).with("37") { mock_banner_type }
        mock_banner_type.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :banner_type => {'these' => 'params'}
      end

      it "assigns the requested banner_type as @banner_type" do
        BannerType.stub(:find) { mock_banner_type(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:banner_type).should be(mock_banner_type)
      end

      it "redirects to the banner_type" do
        BannerType.stub(:find) { mock_banner_type(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(banner_type_url(mock_banner_type))
      end
    end

    describe "with invalid params" do
      it "assigns the banner_type as @banner_type" do
        BannerType.stub(:find) { mock_banner_type(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:banner_type).should be(mock_banner_type)
      end

      it "re-renders the 'edit' template" do
        BannerType.stub(:find) { mock_banner_type(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested banner_type" do
      BannerType.should_receive(:find).with("37") { mock_banner_type }
      mock_banner_type.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the banner_types list" do
      BannerType.stub(:find) { mock_banner_type }
      delete :destroy, :id => "1"
      response.should redirect_to(banner_types_url)
    end
  end

end
