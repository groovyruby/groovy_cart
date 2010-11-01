class CreateOptionGroups < ActiveRecord::Migration
  def self.up
    create_table :option_groups do |t|
      t.string :name

      t.timestamps
    end

    create_table :option_groups_products, :id=>false do |t|
      t.references :option_group
      t.references :product
    end
  end

  def self.down
    drop_table :option_groups_products
    drop_table :option_groups
  end
end
