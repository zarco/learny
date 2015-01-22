class AddMinNumberParticipantsToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :min_number_participants, :integer, default: 1
  end
end
