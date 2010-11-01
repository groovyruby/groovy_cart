class MoveParameterTypeToOptionGroups < ActiveRecord::Migration
  def self.up
    add_column :option_groups, :option_group_type, :string
    remove_column :options, :parameter_type
  end

  def self.down
    add_column :options, :parameter_type, :string
    remove_column :option_groups, :option_group_type
  end
end
