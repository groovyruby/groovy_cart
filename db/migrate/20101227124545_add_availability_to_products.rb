class AddAvailabilityToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :availability, :integer, :default=>10
    add_column :product_variations, :availability, :integer, :default=>10
  end

  def self.down
    remove_column :products, :availability
    remove_column :product_variations, :availability
  end
end
