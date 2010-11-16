class AddItemsValueToCarts < ActiveRecord::Migration
  def self.up
    add_column :carts, :items_value, :decimal, :precision => 12, :scale => 2, :default=>0
  end

  def self.down
    remove_column :carts, :items_value
  end
end
