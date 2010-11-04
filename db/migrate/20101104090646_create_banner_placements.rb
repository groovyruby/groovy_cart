class CreateBannerPlacements < ActiveRecord::Migration
  def self.up
    create_table :banner_placements do |t|
      t.string :name
      t.string :identifier

      t.timestamps
    end
  end

  def self.down
    drop_table :banner_placements
  end
end
