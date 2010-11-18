class CreateOrderTransactions < ActiveRecord::Migration
  def self.up
    create_table :order_transactions do |t|
      t.boolean :success
      t.text :authorization
      t.text :message
      t.text :params
      t.references :order

      t.timestamps
    end
  end

  def self.down
    drop_table :order_transactions
  end
end
