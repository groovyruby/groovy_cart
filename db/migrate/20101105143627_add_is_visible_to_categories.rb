class AddIsVisibleToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :is_visible, :boolean, :default=>true
  end

  def self.down
    remove_column :categories, :is_visible
  end
end
