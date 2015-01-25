class CreateVenuePictures < ActiveRecord::Migration
  def change
    create_table :venue_pictures do |t|
      t.integer :venue_id
      t.string :avatar

      t.timestamps
    end
  end
end
