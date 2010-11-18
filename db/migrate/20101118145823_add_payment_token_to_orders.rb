class AddPaymentTokenToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :payment_token, :string
  end

  def self.down
    remove_column :orders, :payment_token
  end
end
