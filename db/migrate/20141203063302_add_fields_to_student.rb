class AddFieldsToStudent < ActiveRecord::Migration
  def change
    add_column :students, :avatar, :string
    add_column :students, :occupation, :string
    add_column :students, :profile, :text
  end
end
