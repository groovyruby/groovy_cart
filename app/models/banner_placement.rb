class BannerPlacement < ActiveRecord::Base
  has_many :banners

  validates :name, :presence=>true, :uniqueness=>true
  validates :identifier, :presence=>true, :uniqueness=>true

  def to_s
    "#{self.name} (#{self.identifier}"
  end
end
