class AddProductVariationIdToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :product_variation_id, :integer
  end

  def self.down
    remove_column :photos, :product_variation_id
  end
end
