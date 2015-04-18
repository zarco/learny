class AddDeletedAtToZone < ActiveRecord::Migration
  def change
    add_column :zones, :deleted_at, :datetime
    add_index :zones, :deleted_at
    
    add_foreign_key :workshops, :zones
    
  end
end
