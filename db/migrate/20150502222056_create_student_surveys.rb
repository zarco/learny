class CreateStudentSurveys < ActiveRecord::Migration
  def change
    create_table :student_surveys do |t|
      t.integer :rating_workshop, null: false, default: 0
      t.integer :rating_expert, null: false, default: 0
      t.integer :rating_venue, null: false, default: 0
      t.integer :rating_learny, null: false, default: 0
      t.text :workshop_comment
      t.text :venue_comment
      t.integer :workshop_id, null: false
      t.integer :student_id, null: false
      t.timestamps null: false
    end
    
    add_foreign_key :student_surveys, :workshops
    add_foreign_key :student_surveys, :students
    
  end
end
