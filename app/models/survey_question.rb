class SurveyQuestion < ActiveRecord::Base
  FIELD_TYPES = %w(string text checkbox select radio)
  
  default_values :field_type=>SurveyQuestion::FIELD_TYPES.first
  
  
  
  belongs_to :survey_model
  has_many :survey_answers
  
  validates :question, :field_type, :presence=>true
  validates :field_type, :inclusion=>{ :in=>SurveyQuestion::FIELD_TYPES }
end
