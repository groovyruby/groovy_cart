class AddFieldsToOrderTransactions < ActiveRecord::Migration
  def self.up
    add_column :order_transactions, :amount, :decimal
    add_column :order_transactions, :action, :string
  end

  def self.down
    remove_column :order_transactions, :action
    remove_column :order_transactions, :amount
  end
end
