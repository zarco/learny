class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :workshop_id, null: false
      t.integer :student_id, null: false

      t.timestamps
    end
  end
end
