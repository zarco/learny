class AddFieldsToExpert < ActiveRecord::Migration
  def change
    add_column :experts, :avatar, :string
    add_column :experts, :occupation, :string
    add_column :experts, :profile, :text
    add_column :experts, :facebook_link, :string
    add_column :experts, :twitter_link, :string
    add_column :experts, :linkedin_link, :string
    add_column :experts, :website, :string
    add_column :experts, :areas_of_expertise, :text
  end
  
end
