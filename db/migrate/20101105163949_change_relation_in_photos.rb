class ChangeRelationInPhotos < ActiveRecord::Migration
  def self.up
    remove_column :photos, :product_variation_id
    add_column :photos, :option_id, :integer
  end

  def self.down
    remove_column :photos, :option_id
    add_column :photos, :product_variation_id, :integer
  end
end
