class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :name
      t.integer :price
      t.integer :length
      t.string :previous_skills
      t.text :agenda
      
      t.timestamps
    end
  end
end
