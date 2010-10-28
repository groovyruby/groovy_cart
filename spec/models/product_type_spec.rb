require 'spec_helper'

describe ProductType do
  should_validate_presence_of :name
  should_have_many :property_types


end
