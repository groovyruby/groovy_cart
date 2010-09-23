class CreateCartItems < ActiveRecord::Migration
  def self.up
    create_table :cart_items do |t|
      t.references :product
      t.references :cart
      t.integer :quantity
      t.decimal :item_price, :precision => 12, :scale => 2, :default=>0
      t.decimal :item_value, :precision => 12, :scale => 2, :default=>0

      t.timestamps
    end
  end

  def self.down
    drop_table :cart_items
  end
end
