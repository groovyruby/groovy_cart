class AddProductTypeIdToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :product_type_id, :integer
  end

  def self.down
    remove_column :products, :product_type_id
  end
end
