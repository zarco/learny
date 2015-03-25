class AddDeletedAtToExpert < ActiveRecord::Migration
  def change
    add_column :experts, :deleted_at, :datetime
    add_index :experts, :deleted_at
  end
end
