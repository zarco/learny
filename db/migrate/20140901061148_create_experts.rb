class CreateExperts < ActiveRecord::Migration
  def change
    create_table :experts do |t|
      t.string :first_name, null: false
      t.string :last_name

      t.timestamps
    end
  end
end
