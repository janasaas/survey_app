class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :response_id      
      t.integer :mcq4_id
      t.integer :ynq_id
      t.string  :answer
      t.timestamps
    end
  end
end
