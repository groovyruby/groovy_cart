class AddCountersToBanners < ActiveRecord::Migration
  def self.up
    add_column :banners, :views_count, :integer, :default=>0
    add_column :banners, :clicks_count, :integer, :default=>0
  end

  def self.down
    remove_column :banners, :clicks_count
    remove_column :banners, :views_count
  end
end
