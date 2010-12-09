class CreateSurveyQuestions < ActiveRecord::Migration
  def self.up
    create_table :survey_questions do |t|
      t.string :question
      t.text :description
      t.references :survey_model
      t.string :field_type
      t.string :field_options
      t.boolean :is_required, :default=>false

      t.timestamps
    end
  end

  def self.down
    drop_table :survey_questions
  end
end
