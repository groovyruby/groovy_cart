class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
    create_table :categories_products, :id=>false do |t|
      t.references :category
      t.references :product
    end
  end

  def self.down
    drop_table :categories_products
    drop_table :categories
  end
end
