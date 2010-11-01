require 'spec_helper'

describe Option do
  should_validate_presence_of :name
  

  should_belong_to :option_group
end
