class AddFreeToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :free, :boolean, default: false
  end
end
