class AddIsDefaultToCalendar < ActiveRecord::Migration
  def change
    add_column :calendars, :is_default, :boolean , null: false, default: false
  end
end
