class SurveyModel < ActiveRecord::Base
  
  default_values :active_from_date => lambda { Time.now },
                 :active_until_date => lambda { Time.now + 1.month }
  
  # SCOPE
  scope :active, where('is_active=?', true).where('active_from_date<?', Time.now).where('active_until_date>?', Time.now)
  
  # RELATIONS
  has_many :survey_questions, :dependent=>:destroy
  has_many :surveys, :dependent=>:destroy
  
  # VALIDATIONS
  validates :name, :presence=>true
  
  validates_associated :survey_questions
  
  # ACCESSINBLE
  accepts_nested_attributes_for :survey_questions, :allow_destroy=>true, :reject_if=>proc{|sq| sq['question'].blank? }
  
  attr_accessible :name, :is_active, :active_from_date, :active_until_date, :survey_questions_attributes
end
