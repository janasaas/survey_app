class CreateSurveyees < ActiveRecord::Migration
  def change
    create_table :surveyees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email 
      t.integer :age
      t.string :sex
      t.integer :phone, :limit => 8, :null => false
      t.string :address_1 
      t.string :address_2
      t.string :city
      t.string :state
      t.string :country
      t.integer :zip_code
      t.float :latitude
      t.float :longitude
      
      
     

      t.timestamps
    end
    add_index :surveyees, :phone, :unique => true
  end
end
