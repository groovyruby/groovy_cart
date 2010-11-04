require 'spec_helper'

describe Admin::BannerPlacementsController do

  def mock_banner_placement(stubs={})
    (@mock_banner_placement ||= mock_model(BannerPlacement).as_null_object).tap do |banner_placement|
      banner_placement.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all banner_placements as @banner_placements" do
      BannerPlacement.stub(:all) { [mock_banner_placement] }
      get :index
      assigns(:banner_placements).should eq([mock_banner_placement])
    end
  end

  describe "GET show" do
    it "assigns the requested banner_placement as @banner_placement" do
      BannerPlacement.stub(:find).with("37") { mock_banner_placement }
      get :show, :id => "37"
      assigns(:banner_placement).should be(mock_banner_placement)
    end
  end

  describe "GET new" do
    it "assigns a new banner_placement as @banner_placement" do
      BannerPlacement.stub(:new) { mock_banner_placement }
      get :new
      assigns(:banner_placement).should be(mock_banner_placement)
    end
  end

  describe "GET edit" do
    it "assigns the requested banner_placement as @banner_placement" do
      BannerPlacement.stub(:find).with("37") { mock_banner_placement }
      get :edit, :id => "37"
      assigns(:banner_placement).should be(mock_banner_placement)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created banner_placement as @banner_placement" do
        BannerPlacement.stub(:new).with({'these' => 'params'}) { mock_banner_placement(:save => true) }
        post :create, :banner_placement => {'these' => 'params'}
        assigns(:banner_placement).should be(mock_banner_placement)
      end

      it "redirects to the created banner_placement" do
        BannerPlacement.stub(:new) { mock_banner_placement(:save => true) }
        post :create, :banner_placement => {}
        response.should redirect_to(banner_placement_url(mock_banner_placement))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved banner_placement as @banner_placement" do
        BannerPlacement.stub(:new).with({'these' => 'params'}) { mock_banner_placement(:save => false) }
        post :create, :banner_placement => {'these' => 'params'}
        assigns(:banner_placement).should be(mock_banner_placement)
      end

      it "re-renders the 'new' template" do
        BannerPlacement.stub(:new) { mock_banner_placement(:save => false) }
        post :create, :banner_placement => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested banner_placement" do
        BannerPlacement.should_receive(:find).with("37") { mock_banner_placement }
        mock_banner_placement.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :banner_placement => {'these' => 'params'}
      end

      it "assigns the requested banner_placement as @banner_placement" do
        BannerPlacement.stub(:find) { mock_banner_placement(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:banner_placement).should be(mock_banner_placement)
      end

      it "redirects to the banner_placement" do
        BannerPlacement.stub(:find) { mock_banner_placement(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(banner_placement_url(mock_banner_placement))
      end
    end

    describe "with invalid params" do
      it "assigns the banner_placement as @banner_placement" do
        BannerPlacement.stub(:find) { mock_banner_placement(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:banner_placement).should be(mock_banner_placement)
      end

      it "re-renders the 'edit' template" do
        BannerPlacement.stub(:find) { mock_banner_placement(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested banner_placement" do
      BannerPlacement.should_receive(:find).with("37") { mock_banner_placement }
      mock_banner_placement.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the banner_placements list" do
      BannerPlacement.stub(:find) { mock_banner_placement }
      delete :destroy, :id => "1"
      response.should redirect_to(banner_placements_url)
    end
  end

end
