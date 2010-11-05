class Photo < ActiveRecord::Base
  belongs_to :product
  belongs_to :product_variation
  has_attached_file :photo, :styles => {
        :thumb => "50x50>",
        :displayable=>"800x600>",
        :list=>Setting.get('product.list_image_dimenstions'),
        :show=>Setting.get('product.list_image_dimenstions')
  }


  after_save :fill_in_product_id

  def fill_in_product_id
    if self.product_variation_id and self.product_id.blank?
      self.product = self.product_variation.product
      self.save
    end
  end
end
