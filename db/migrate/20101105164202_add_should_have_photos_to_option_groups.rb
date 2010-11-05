class AddShouldHavePhotosToOptionGroups < ActiveRecord::Migration
  def self.up
    add_column :option_groups, :should_have_photos, :boolean, :default=>false
  end

  def self.down
    remove_column :option_groups, :should_have_photos
  end
end
