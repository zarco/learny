class AddConfirmableToStudents < ActiveRecord::Migration
  def self.up
    change_table(:students) do |t|
    ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
    end
  end
end
