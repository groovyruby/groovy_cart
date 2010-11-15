class CreateShippingMethods < ActiveRecord::Migration
  def self.up
    create_table :shipping_methods do |t|
      t.string :name
      t.string :pricing_type
      t.decimal :flat_price
      t.decimal :free_from_cart_value

      t.timestamps
    end
  end

  def self.down
    drop_table :shipping_methods
  end
end
