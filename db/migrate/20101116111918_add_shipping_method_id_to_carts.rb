class AddShippingMethodIdToCarts < ActiveRecord::Migration
  def self.up
    add_column :carts, :shipping_method_id, :integer
  end

  def self.down
    remove_column :carts, :shipping_method_id
  end
end
