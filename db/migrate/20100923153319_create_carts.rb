class CreateCarts < ActiveRecord::Migration
  def self.up
    create_table :carts do |t|
      t.decimal :total_value, :precision => 12, :scale => 2, :default=>0
      t.decimal :discount_value, :precision => 12, :scale => 2, :default=>0
      t.decimal :shipping_cost, :precision => 12, :scale => 2, :default=>0
      t.decimal :discounted_value, :precision => 12, :scale => 2, :default=>0

      t.timestamps
    end
  end

  def self.down
    drop_table :carts
  end
end
