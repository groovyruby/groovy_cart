class CreateSurveyAnswers < ActiveRecord::Migration
  def self.up
    create_table :survey_answers do |t|
      t.references :survey
      t.references :survey_question
      t.text :answer

      t.timestamps
    end
  end

  def self.down
    drop_table :survey_answers
  end
end
