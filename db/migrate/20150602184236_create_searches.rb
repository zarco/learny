class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :term
      t.text :actor
      t.integer :id_actor

      t.timestamps
    end
  end
end
