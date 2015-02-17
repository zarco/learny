class AddMinCoverToReservation < ActiveRecord::Migration
  def change
    change_column :reservations, :cover, :integer, default: 0
  end
end
