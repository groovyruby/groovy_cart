require 'spec_helper'

describe Admin::OptionGroupsController do

  def mock_option_group(stubs={})
    (@mock_option_group ||= mock_model(OptionGroup).as_null_object).tap do |option_group|
      option_group.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all option_groups as @option_groups" do
      OptionGroup.stub(:all) { [mock_option_group] }
      get :index
      assigns(:option_groups).should eq([mock_option_group])
    end
  end

  describe "GET show" do
    it "assigns the requested option_group as @option_group" do
      OptionGroup.stub(:find).with("37") { mock_option_group }
      get :show, :id => "37"
      assigns(:option_group).should be(mock_option_group)
    end
  end

  describe "GET new" do
    it "assigns a new option_group as @option_group" do
      OptionGroup.stub(:new) { mock_option_group }
      get :new
      assigns(:option_group).should be(mock_option_group)
    end
  end

  describe "GET edit" do
    it "assigns the requested option_group as @option_group" do
      OptionGroup.stub(:find).with("37") { mock_option_group }
      get :edit, :id => "37"
      assigns(:option_group).should be(mock_option_group)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created option_group as @option_group" do
        OptionGroup.stub(:new).with({'these' => 'params'}) { mock_option_group(:save => true) }
        post :create, :option_group => {'these' => 'params'}
        assigns(:option_group).should be(mock_option_group)
      end

      it "redirects to the created option_group" do
        OptionGroup.stub(:new) { mock_option_group(:save => true) }
        post :create, :option_group => {}
        response.should redirect_to(admin_option_group_url(mock_option_group))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved option_group as @option_group" do
        OptionGroup.stub(:new).with({'these' => 'params'}) { mock_option_group(:save => false) }
        post :create, :option_group => {'these' => 'params'}
        assigns(:option_group).should be(mock_option_group)
      end

      it "re-renders the 'new' template" do
        OptionGroup.stub(:new) { mock_option_group(:save => false) }
        post :create, :option_group => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested option_group" do
        OptionGroup.should_receive(:find).with("37") { mock_option_group }
        mock_option_group.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :option_group => {'these' => 'params'}
      end

      it "assigns the requested option_group as @option_group" do
        OptionGroup.stub(:find) { mock_option_group(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:option_group).should be(mock_option_group)
      end

      it "redirects to the option_group" do
        OptionGroup.stub(:find) { mock_option_group(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(admin_option_group_url(mock_option_group))
      end
    end

    describe "with invalid params" do
      it "assigns the option_group as @option_group" do
        OptionGroup.stub(:find) { mock_option_group(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:option_group).should be(mock_option_group)
      end

      it "re-renders the 'edit' template" do
        OptionGroup.stub(:find) { mock_option_group(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested option_group" do
      OptionGroup.should_receive(:find).with("37") { mock_option_group }
      mock_option_group.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the option_groups list" do
      OptionGroup.stub(:find) { mock_option_group }
      delete :destroy, :id => "1"
      response.should redirect_to(admin_option_groups_url)
    end
  end

end
