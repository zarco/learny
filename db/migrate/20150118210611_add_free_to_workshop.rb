class AddFreeToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :free, :boolean, null: false, default: false
  end
end
