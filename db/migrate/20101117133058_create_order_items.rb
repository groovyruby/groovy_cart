class CreateOrderItems < ActiveRecord::Migration
  def self.up
    create_table :order_items do |t|
      t.string :name
      t.string :sku
      t.references :product
      t.references :product_variation
      t.references :order
      t.integer :quantity, :default=>0
      t.decimal :item_price, :precision => 12, :scale => 2, :default=>0
      t.decimal :item_value, :precision => 12, :scale => 2, :default=>0

      t.timestamps
    end
  end

  def self.down
    drop_table :order_items
  end
end
