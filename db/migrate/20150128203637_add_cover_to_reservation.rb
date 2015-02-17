class AddCoverToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :cover, :integer
  end
end
