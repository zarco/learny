class AddTargetPublicToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :target_public, :string
  end
end
