class SurveyAnswer < ActiveRecord::Base
  
  serialize :answer
  
  belongs_to :survey
  belongs_to :survey_question
  
  validates :survey_question_id, :presence=>true
  
  attr_accessible :survey_question_id, :answer
end
