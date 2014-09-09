class Reservation < ActiveRecord::Base
  
  validates :start_at, presence: true
  validates :final_time, presence: true
  validates :max_participants, presence: true
end
