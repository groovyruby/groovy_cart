class AddIsPrimaryForOptionToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :is_primary_for_option, :boolean, :default=>false
  end

  def self.down
    remove_column :photos, :is_primary_for_option
  end
end
