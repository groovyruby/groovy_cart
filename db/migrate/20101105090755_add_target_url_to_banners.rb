class AddTargetUrlToBanners < ActiveRecord::Migration
  def self.up
    add_column :banners, :target_url, :string
  end

  def self.down
    remove_column :banners, :target_url
  end
end
