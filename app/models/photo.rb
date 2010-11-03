class Photo < ActiveRecord::Base
  belongs_to :product

  has_attached_file :photo

end
