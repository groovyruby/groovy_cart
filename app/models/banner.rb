class Banner < ActiveRecord::Base
  belongs_to :banner_type
  belongs_to :banner_placement

  scope :active, where('is_active=?', true)

  has_attached_file :banner, :styles=>{:thumb=>"50x50>", :target=>Proc.new{|i| BannerType.find(i.banner_type_id).get_size } }

  #validates :name, :presence=>true
  #validates :banner_type_id, :presence=>true
  #validates :banner_placement_id, :presence=>true
  #validates :target_url, :presence=>true

  attr_accessible :name, :banner_type_id, :banner_placement_id, :banner, :target_url, :is_active

end
