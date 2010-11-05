require 'spec_helper'

describe Banner do
  should_validate_presence_of :name
  should_validate_presence_of :target_url
  should_validate_presence_of :banner_placement_id
  should_validate_presence_of :banner_type_id
end
