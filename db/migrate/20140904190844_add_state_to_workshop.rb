class AddStateToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :state, :integer, default: 0
  end
end
