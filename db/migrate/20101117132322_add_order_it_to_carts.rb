class AddOrderItToCarts < ActiveRecord::Migration
  def self.up
    add_column :carts, :order_id, :integer
  end

  def self.down
    remove_column :carts, :order_id
  end
end
