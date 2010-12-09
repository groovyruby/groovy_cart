require 'spec_helper'

describe SurveyQuestion do
  should_validate_presence_of :question
  should_validate_presence_of :field_type
  should_validate_inclusion_of :field_type, :in=>SurveyQuestion::FIELD_TYPES
  
end
