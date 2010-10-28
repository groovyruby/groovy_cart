class RenameSlugFields < ActiveRecord::Migration
  def self.up
    rename_column :brands, :slug, :cached_slug
    rename_column :categories, :slug, :cached_slug
    add_column :products, :cached_slug, :string
  end

  def self.down
    remove_column :products, :cached_slug
    rename_column :categories, :cached_slug, :slug
    rename_column :brands, :cached_slug, :slug
  end
end
