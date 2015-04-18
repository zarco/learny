class AddZoneToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :zone_id, :integer
  end
end
