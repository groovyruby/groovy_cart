class AddSlugToOptionGroups < ActiveRecord::Migration
  def self.up
    add_column :option_groups, :slug, :string
  end

  def self.down
    remove_column :option_groups, :slug
  end
end
