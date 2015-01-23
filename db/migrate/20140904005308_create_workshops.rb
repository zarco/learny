class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :name, null: false
      t.integer :price
      t.integer :length, null: false, default: 2
      t.string :previous_skills
      t.text :agenda
      
      t.timestamps
    end
  end
end
