class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
        t.integer :survey_id
        t.integer :agent_id
        t.integer :surveyee_id
    end
  end
end
