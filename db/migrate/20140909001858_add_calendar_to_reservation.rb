class AddCalendarToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :calendar_id, :integer, null: false
  end
end
