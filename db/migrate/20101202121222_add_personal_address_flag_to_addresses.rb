class AddPersonalAddressFlagToAddresses < ActiveRecord::Migration
  def self.up
    add_column :addresses, :is_personal_address, :boolean, :default=>false
  end

  def self.down
    remove_column :addresses, :is_personal_address
  end
end
