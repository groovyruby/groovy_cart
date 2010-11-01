class CreateOptions < ActiveRecord::Migration
  def self.up
    create_table :options do |t|
      t.string :name
      t.integer :position
      t.string :parameter_type
      t.string :parameter_value
      t.references :option_group
      t.timestamps
    end
  end

  def self.down
    drop_table :options
  end
end
