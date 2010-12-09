class Survey < ActiveRecord::Base
  belongs_to :survey_model
  belongs_to :customer
  has_many :survey_answers, :dependent=>:destroy
  
  accepts_nested_attributes_for :survey_answers, :allow_destroy=>false
  
  attr_accessible :survey_model_id, :survey_answers_attributes
end
