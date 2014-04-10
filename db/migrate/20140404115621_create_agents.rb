class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone, :limit => 8, :null => false

      t.timestamps
    end
    add_index :agents, :phone, :unique => true
  end
end
