class CreateBanners < ActiveRecord::Migration
  def self.up
    create_table :banners do |t|
      t.string :name
      t.string :banner_file_name
      t.string :banner_content_type
      t.integer :banner_file_size
      t.references :banner_type
      t.references :banner_placement
      t.boolean :is_active

      t.timestamps
    end
  end

  def self.down
    drop_table :banners
  end
end
