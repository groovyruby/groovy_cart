class AddFieldsToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
  end

  def self.down
    remove_column :orders, :last_name
    remove_column :orders, :first_name
  end
end
