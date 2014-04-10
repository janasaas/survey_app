class CreateYnqs < ActiveRecord::Migration
  def change
    create_table :ynqs do |t|
      t.string :question
      t.integer :survey_id
      t.integer :question_count
      t.timestamps
    end
  end
end
