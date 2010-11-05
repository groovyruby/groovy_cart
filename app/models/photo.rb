class Photo < ActiveRecord::Base
  belongs_to :product
  belongs_to :option
  has_attached_file :photo, :styles => {
        :thumb => "50x50>",
        :displayable=>"800x600>",
        :list=>Setting.get('product.list_image_dimensions'),
        :show=>Setting.get('product.show_image_dimensions')
  }

  attr_accessible :photo, :product_id, :option_id

end
