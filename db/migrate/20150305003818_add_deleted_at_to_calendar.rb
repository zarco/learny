class AddDeletedAtToCalendar < ActiveRecord::Migration
  def change
    add_column :calendars, :deleted_at, :datetime
    add_index :calendars, :deleted_at
  end
end
