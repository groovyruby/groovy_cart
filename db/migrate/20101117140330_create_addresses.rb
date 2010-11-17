class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :city
      t.string :zip_code
      t.string :country
      t.string :phone
      t.string :email
      t.boolean :is_shipping, :default=>false
      t.references :order

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
