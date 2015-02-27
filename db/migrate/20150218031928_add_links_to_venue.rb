class AddLinksToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :facebook_link, :string
    add_column :venues, :twitter_link, :string
    add_column :venues, :website, :string
    add_column :venues, :google_plus_link, :string
  end
end
