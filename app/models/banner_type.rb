class BannerType < ActiveRecord::Base
  has_many :banners
  
  validates :name, :presence=>true
  validates :height, :presence=>true, :numericality=>true
  validates :width, :presence=>true, :numericality=>true

  def to_s
    "#{self.name} (#{self.get_size})"
  end

  def get_size
    "#{self.width}x#{self.height}"
  end
end
