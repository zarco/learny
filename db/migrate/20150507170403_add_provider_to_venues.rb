class AddProviderToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :provider, :string
    add_column :venues, :uid, :string
  end
end
