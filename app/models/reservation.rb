class Reservation < ActiveRecord::Base
  
  validates :starts_at, presence: true
  validates :final_time, presence: true
  validates :max_participants, presence: true

  extend SimpleCalendar
  has_calendar
  
  belongs_to :calendar
  belongs_to :workshop
  
  def fmt_starts_at
    starts_at.strftime('%d-%B-%Y, %H:%M') if !starts_at.nil?
  end

end
