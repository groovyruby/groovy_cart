require 'spec_helper'

describe OptionGroup do
  should_validate_presence_of :name
  should_validate_presence_of :option_group_type
  should_validate_inclusion_of :option_group_type, :in=>OptionGroup::OPTION_GROUP_TYPES

  should_have_and_belong_to_many :products

  should_have_many :options
end
