class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.decimal :total_value, :precision => 12, :scale => 2, :default=>0
      t.string :state
      t.decimal :discount_value, :precision => 12, :scale => 2, :default=>0
      t.decimal :shipping_cost, :precision => 12, :scale => 2, :default=>0
      t.decimal :discounted_value, :precision => 12, :scale => 2, :default=>0
      t.decimal :items_value, :precision => 12, :scale => 2, :default=>0
      t.references :shipping_method

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
