class CreatePaymentGateways < ActiveRecord::Migration
  def self.up
    create_table :payment_gateways do |t|
      t.string :name
      t.string :class_name
      t.boolean :is_active, :default=>false
      t.decimal :additional_flat_fee, :precision => 12, :scale => 2, :default=>0
      t.decimal :additional_percentage_fee, :precision => 12, :scale => 2, :default=>0
      t.decimal :free_from_cart_value, :precision => 12, :scale => 2, :default=>0

      t.timestamps
    end
  end

  def self.down
    drop_table :payment_gateways
  end
end
