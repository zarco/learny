class AddExpertToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :expert_id, :integer
  end
end
