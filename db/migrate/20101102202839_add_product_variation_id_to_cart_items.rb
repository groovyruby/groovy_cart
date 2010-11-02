class AddProductVariationIdToCartItems < ActiveRecord::Migration
  def self.up
    add_column :cart_items, :product_variation_id, :integer
  end

  def self.down
    remove_column :cart_items, :product_variation_id
  end
end
