class ChangeStateInWorkshop < ActiveRecord::Migration
  def change
    remove_column :workshops, :state, :integer, null: false, default: 0
    add_column :workshops, :state, :string, null: false, default: 'new'
  end
end
