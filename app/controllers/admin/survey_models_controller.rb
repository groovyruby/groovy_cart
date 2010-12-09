class Admin::SurveyModelsController < AdminController
  inherit_resources
  defaults :route_prefix => 'admin'
  helper :surveys
  
  def edit
    @survey_model = SurveyModel.find(params[:id])
    if @survey_model.surveys.empty?
      edit!
    else
      redirect_to admin_survey_models_url
    end
  end
  
  def statistics
    @survey_model = SurveyModel.find(params[:id])
    @surveys = @survey_model.surveys.all
  end
  
end
