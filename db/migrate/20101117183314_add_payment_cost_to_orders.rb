class AddPaymentCostToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :payment_cost, :decimal, :precision => 12, :scale => 2, :default=>0
  end

  def self.down
    remove_column :orders, :payment_cost
  end
end
