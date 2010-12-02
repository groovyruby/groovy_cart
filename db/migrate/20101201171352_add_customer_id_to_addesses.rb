class AddCustomerIdToAddesses < ActiveRecord::Migration
  def self.up
    add_column :addresses, :customer_id, :integer
  end

  def self.down
    remove_column :addresses, :customer_id
  end
end
