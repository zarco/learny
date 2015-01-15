class AddBusinesshoursToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :business_hours, :string
  end
end
