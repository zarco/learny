class Reservation < ActiveRecord::Base
  
  validates :starts_at, presence: true
  validates :final_time, presence: true
  validates :max_participants, presence: true

  extend SimpleCalendar
  has_calendar
  
  belongs_to :calendar

end
