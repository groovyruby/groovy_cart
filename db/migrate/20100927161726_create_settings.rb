class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :label
      t.string :identifier
      t.text :description
      t.string :field_type, :default=>"string"
      t.text :value
      t.string :scope, :default=>"general_settings"
      t.integer :position, :default=>"0"
      t.timestamps
    end
  end

  def self.down
    drop_table :settings
  end
end
