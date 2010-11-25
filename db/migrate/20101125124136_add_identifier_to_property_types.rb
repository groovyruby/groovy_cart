class AddIdentifierToPropertyTypes < ActiveRecord::Migration
  def self.up
    add_column :property_types, :identifier, :string
  end

  def self.down
    remove_column :property_types, :identifier
  end
end
