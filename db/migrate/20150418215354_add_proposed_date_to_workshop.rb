class AddProposedDateToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :proposed_date, :datetime
  end
end
