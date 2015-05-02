class AddZoneToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :zone_id, :integer
    add_foreign_key :workshops, :zones
  end
end
