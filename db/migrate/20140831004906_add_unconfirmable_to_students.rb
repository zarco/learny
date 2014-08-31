class AddUnconfirmableToStudents < ActiveRecord::Migration
  def self.up
    change_table(:students) do |t|
    ## Confirmable
      t.string   :unconfirmed_email
    end
  end
end

