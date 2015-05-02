class AddZoneToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :zone_id, :integer
    add_foreign_key :venues, :zones
  end
end
