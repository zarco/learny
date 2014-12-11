class AddMoreFieldsToExpert < ActiveRecord::Migration
  def change
     add_column :experts, :birthday, :date
     add_column :experts, :genre, :string
     add_column :experts, :google_plus_link, :string
     
     add_column :students, :birthday, :date
     add_column :students, :genre, :string
     
  end
end
