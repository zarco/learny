class AddWorkshopToReservation < ActiveRecord::Migration
  def self.up
    change_table(:reservations) do |t|
      t.belongs_to :workshop
    end
  end
end
