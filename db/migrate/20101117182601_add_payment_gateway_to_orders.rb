class AddPaymentGatewayToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :payment_gateway_id, :integer
  end

  def self.down
    remove_column :orders, :payment_gateway_id
  end
end
