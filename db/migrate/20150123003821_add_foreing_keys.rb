class AddForeingKeys < ActiveRecord::Migration
  def change
    add_foreign_key :enrollments, :students
    add_foreign_key :enrollments, :workshops
    
    add_foreign_key :workshops, :experts

    add_foreign_key :reservations, :workshops
    add_foreign_key :reservations, :calendars
    
    add_foreign_key :calendars, :venues
   


    
  end
end
