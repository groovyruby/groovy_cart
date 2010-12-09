class AddBooleanFlagsToCustomer < ActiveRecord::Migration
  def self.up
    add_column :customers, :has_accepted_terms_of_use, :boolean, :default=>false
    add_column :customers, :has_accepted_newsletter, :boolean, :default=>false
  end

  def self.down
    remove_column :customers, :has_accepted_newsletter
    remove_column :customers, :has_accepted_terms_of_use
  end
end
