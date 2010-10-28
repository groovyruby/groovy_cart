require 'spec_helper'

describe PropertyType do
  should_validate_presence_of :name
  should_validate_inclusion_of :field_type, :in=>PropertyType::FIELD_TYPES
  should_belong_to :product_type
end
