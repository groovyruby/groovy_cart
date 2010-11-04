require 'spec_helper'

describe BannerType do
  should_validate_presence_of :name
  should_validate_presence_of :height
  should_validate_presence_of :width
  should_validate_numericality_of :height
  should_validate_numericality_of :width
end
