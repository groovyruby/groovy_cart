class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.references :property_type
      t.references :product
      t.text :property_value

      t.timestamps
    end
  end

  def self.down
    drop_table :properties
  end
end
