class AddFieldsToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :facilities, :text
    add_column :venues, :map_link, :string
  end
end
