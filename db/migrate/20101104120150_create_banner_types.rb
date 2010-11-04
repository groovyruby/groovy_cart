class CreateBannerTypes < ActiveRecord::Migration
  def self.up
    create_table :banner_types do |t|
      t.string :name
      t.integer :height
      t.integer :width

      t.timestamps
    end
  end

  def self.down
    drop_table :banner_types
  end
end
