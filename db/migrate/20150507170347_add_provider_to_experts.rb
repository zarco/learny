class AddProviderToExperts < ActiveRecord::Migration
  def change
    add_column :experts, :provider, :string
    add_column :experts, :uid, :string
  end
end
