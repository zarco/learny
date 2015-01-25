class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :title, null:  false

      t.timestamps
    end
  end
end
