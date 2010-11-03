class Photo < ActiveRecord::Base
  belongs_to :product

  has_attached_file :photo, :styles => { :thumb => "50x50>", :displayable=>"800x600>" }

end
