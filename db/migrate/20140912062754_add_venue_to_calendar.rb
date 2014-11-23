class AddVenueToCalendar < ActiveRecord::Migration
  def change
    add_column :calendars, :venue_id, :integer
  end
end
