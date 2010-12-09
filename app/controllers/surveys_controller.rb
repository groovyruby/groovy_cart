class SurveysController < GroovyCartController
  before_filter :authenticate_customer!
  
  def index
    @filled_in = current_customer.surveys.all
    @to_be_filled = SurveyModel.active
    @to_be_filled = @to_be_filled.where('id not in (?)', @filled_in.map{|s| s.survey_model_id }) unless @filled_in.empty?
    @to_be_filled = @to_be_filled.all
  end

  def new
    @model = SurveyModel.find(params[:model])
    @survey = @model.surveys.new
    for sq in @model.survey_questions
      sa = SurveyAnswer.new
      sa.survey_question = sq
      @survey.survey_answers << sa
    end
  end

  def show
    @survey = current_customer.surveys.find(params[:id])
  end
  
  def create
    params[:survey] ||= {}
    params[:survey][:survey_model_id] ||= -1
    @model = SurveyModel.active.find(params[:survey][:survey_model_id])
    @survey = @model.surveys.new(params[:survey])
    @survey.customer = current_customer
    if @survey.save
      redirect_to(surveys_path, :notice => 'Thank you for filling in this survey')
    else
      render :action => "new"
    end
  end

end
