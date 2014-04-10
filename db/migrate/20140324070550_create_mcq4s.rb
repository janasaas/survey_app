class CreateMcq4s < ActiveRecord::Migration
  def change
    create_table :mcq4s do |t|
      t.string :question
      t.string :a
      t.string :b
      t.string :c
      t.string :d
      t.integer :survey_id
      t.integer :question_count
      t.timestamps
    end
  end
end
