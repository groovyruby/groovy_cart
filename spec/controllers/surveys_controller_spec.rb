require 'spec_helper'

describe SurveysController do
  include Devise::TestHelpers
  render_views
  
  before(:each) do
    @user = Factory(:customer)
    @survey_model = Factory(:survey_model)
    @sq1 = Factory(:survey_question_1, :survey_model=>@survey_model)
    @sq2 = Factory(:survey_question_2, :survey_model=>@survey_model)
    sign_in @user
  end
  
  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
      assigns(:to_be_filled).size.should == 1
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get :new, :model=>@survey_model.id
      response.should be_success
      assigns(:survey).survey_answers.size.should == 2
    end
  end
  
  describe "after creating survey" do
    it "should display one filled and none to be filled" do
      post :create, :survey=>{:survey_answers_attributes=>[{:survey_question_id=>@sq1.id, :answer=>"test"}, {:survey_question_id=>@sq2.id, :answer=>"test 2"}], :survey_model_id=>@survey_model.id}
      response.should redirect_to(surveys_url)
      assigns(:survey).survey_answers.count.should == 2
      get :index
      assigns(:to_be_filled).size.should == 0
      assigns(:filled_in).size.should == 1
    end
  end
end
