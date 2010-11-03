class AddExtraParamsToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :extra_params, :string
  end

  def self.down
    remove_column :categories, :extra_params
  end
end
