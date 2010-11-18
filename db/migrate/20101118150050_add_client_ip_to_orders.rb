class AddClientIpToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :client_ip, :string
  end

  def self.down
    remove_column :orders, :client_ip
  end
end
