class CreateProductVariations < ActiveRecord::Migration
  def self.up
    create_table :product_variations do |t|
      t.decimal :price
      t.references :product

      t.timestamps
    end
    create_table :options_product_variations, :id=>false do |t|
      t.references :option
      t.references :product_variation
    end
  end

  def self.down
    drop_table :options_product_variations
    drop_table :product_variations
  end
end
