class AddTempProductIdToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :temp_product_id, :string
  end

  def self.down
    remove_column :photos, :temp_product_id
  end
end
