class AddAncestryToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :ancestry, :string
    add_column :categories, :ancestry_depth, :integer, :default => 0

    add_index :categories, :ancestry
  end

  def self.down
    remove_index :categories, :ancestry
    remove_column :categories, :ancestry_depth
    remove_column :categories, :ancestry
  end
end
