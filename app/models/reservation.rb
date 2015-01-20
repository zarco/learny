class Reservation < ActiveRecord::Base
  
  validates :starts_at, presence: true
  validates :final_time, presence: true
  validates :max_participants, presence: true
  
  validates :max_participants, numericality: { only_integer: true, greater_than: 0  }

  #validates :workshop_does_not_fit

  scope :availables, lambda {where(:workshop => nil).where('starts_at >= ?', Date.today) }
  scope :find_by_starts_at, lambda {|value| (where('starts_at >= (?)',  Date.parse(value))) unless value.blank? }
 
  before_validation :normalize_final_time

  extend SimpleCalendar
  has_calendar
  
  belongs_to :calendar
  belongs_to :workshop
  
  def fmt_starts_at
    starts_at.strftime('%d-%B-%Y, %H:%M') unless starts_at.nil?
  end
    
  def fmt_duration
    starts_at.strftime('%d-%b-%Y, %H:%M -> ') + final_time.strftime('%H:%M') unless starts_at.nil?
  end

  def self.find_availables(params)
    availables.find_by_starts_at(params[:starts_at]).order(:starts_at)
  end

  def availability_in_hours
    TimeDifference.between(self.starts_at,self.final_time).in_hours  
  end
  

  private
  def workshop_does_not_fit
    if !self.workshop.nil?   
      
    end
  end

  def normalize_final_time
    unless self.starts_at.nil? || self.final_time.nil?
      self.final_time=self.final_time.change({year: self.starts_at.year, month: self.starts_at.month, day: self.starts_at.day})
    end
  end


end
