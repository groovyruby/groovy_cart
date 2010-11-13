class Page < ActiveRecord::Base
  has_friendly_id :title, :use_slug => true

  validates :title, :presence=>true, :uniqueness=>true

end
