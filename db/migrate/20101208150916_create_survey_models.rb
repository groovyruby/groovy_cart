class CreateSurveyModels < ActiveRecord::Migration
  def self.up
    create_table :survey_models do |t|
      t.string :name
      t.boolean :is_active, :default=>false
      t.datetime :active_from_date
      t.datetime :active_until_date

      t.timestamps
    end
  end

  def self.down
    drop_table :survey_models
  end
end
