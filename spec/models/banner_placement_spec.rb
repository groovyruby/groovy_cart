require 'spec_helper'

describe BannerPlacement do
  should_validate_presence_of :name
  should_validate_presence_of :identifier
  should_validate_uniqueness_of :name
  should_validate_uniqueness_of :identifier
end
