class AddBrandIdToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :brand_id, :integer
  end

  def self.down
    remove_column :products, :brand_id
  end
end
