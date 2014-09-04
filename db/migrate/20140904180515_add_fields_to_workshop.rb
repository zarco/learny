class AddFieldsToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :description, :text
    add_column :workshops, :max_number_participants, :integer
  end
end
