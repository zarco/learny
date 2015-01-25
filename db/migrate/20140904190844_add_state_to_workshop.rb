class AddStateToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :state, :integer, null: false, default: 0
  end
end
