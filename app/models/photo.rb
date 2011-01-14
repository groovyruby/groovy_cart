class Photo < ActiveRecord::Base
  belongs_to :product
  belongs_to :option
  has_attached_file :photo, :styles => {
        :thumb => "50x50>",
        :displayable=>"800x600>",
        :list=>Setting.get('product.list_image_dimensions', "150x150"),
        :show=>Setting.get('product.show_image_dimensions', "300x300"),
        :cart=>Setting.get('product.cart_image_dimensions', "80x80")
  }

  attr_accessible :photo, :product_id, :option_id, :is_primary_for_option

end
