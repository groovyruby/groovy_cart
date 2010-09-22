class AddPriceToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :price, :decimal, :precision => 12, :scale => 2
    add_column :products, :price_promo, :decimal, :precision => 12, :scale => 2
  end

  def self.down
    remove_column :products, :price_promo
    remove_column :products, :price
  end
end
