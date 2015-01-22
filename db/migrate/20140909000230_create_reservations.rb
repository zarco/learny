class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :start_at , null: false
      t.datetime :final_time, null: false
      t.integer :max_participants, null: false, default: 12
      t.boolean :all_day, null: false, default: false

      t.timestamps
    end
  end
end
