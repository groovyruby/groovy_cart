class Admin::SurveysController < AdminController
  inherit_resources
  defaults :route_prefix => 'admin'
  belongs_to :survey_model
  
  
end
