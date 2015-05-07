class Reservation < ActiveRecord::Base
  
  acts_as_paranoid
  obfuscate_id :spin => 24889949

  validates :starts_at, presence: true
  validates :final_time, presence: true
  validates :max_participants, presence: true
  
  validates :max_participants, numericality: { only_integer: true, greater_than: 0  }
  
  validates :cover, numericality: { greater_than_or_equal_to: 0  }, allow_nil: true

  validate :workshop_does_not_fit, :invalid_starts_at, :invalid_final_time
  validate :invalid_date_interval_starts_at, :invalid_date_interval_final_time, :invalid_date_interval
  validate :workshop_reserved?, on: :create

  scope :availables, lambda {where(:workshop => nil).where('starts_at >= ?', Date.today) }
  scope :find_by_starts_at, lambda {|value| (where('starts_at >= (?)',  Date.parse(value))) unless value.blank? }
 
  before_validation :normalize_final_time

  extend SimpleCalendar
  has_calendar
  
  belongs_to :calendar
  belongs_to :workshop
  
  delegate :venue, to: :calendar
  
  
  def initialize(attributes={})
    super
    self.starts_at ||= Time.now
    self.final_time ||= starts_at+2.hours
  end
  
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
    #puts "#{self.starts_at}<<<,>>>#{self.final_time}"
    normalize_final_time
    #puts "#{self.starts_at}<<<,>>>#{self.final_time}"
    TimeDifference.between(self.starts_at,self.final_time).in_hours  
  end
  

  private
  
  def normalize_final_time
    unless self.starts_at.nil? || self.final_time.nil?
      #puts "Before #{self.starts_at}<<<,>>>#{self.final_time}"
      self.final_time=starts_at.change({:hour => final_time.hour, :min => final_time.min})
      #puts "After #{self.starts_at}<<<,>>>#{self.final_time}"
    end
  end


  def invalid_final_time 
    if starts_at.present? && final_time.present? && final_time <= starts_at 
        message=I18n.t('activerecord.errors.models.reservation.attributes.final_time.date_in_the_past')
        #puts message
        errors.add(:final_time, message)
    end
  end

  def invalid_starts_at 
    if starts_at.present? && starts_at_changed? && starts_at < Time.now 
        message=I18n.t('activerecord.errors.models.reservation.attributes.starts_at.date_in_the_past')
        #puts message
        errors.add(:starts_at, message)
    end
  end

  def workshop_does_not_fit
    unless workshop.nil?   
      #puts "workshop #{self.workshop.max_number_participants} >  reservation #{self.max_participants}"
      if workshop.max_number_participants > max_participants 
        #message="There is not enough places for #{self.workshop.max_number_participants} participants"
        message=I18n.t('activerecord.errors.models.reservation.attributes.workshop.too_many_participants', 
          :participants => workshop.max_number_participants)
        #puts message
        errors.add(:max_participants, message)
      end
      
      #puts "workshop #{workshop.length} >  reservation #{availability_in_hours}: #{workshop.length > availability_in_hours}"
       
      if workshop.length > availability_in_hours
        #message="There is not enough time the workshop"
        message=I18n.t('activerecord.errors.models.reservation.attributes.workshop.too_much_time')
        #puts message 
        errors.add(:final_time, message)
      end 
            
    end
  end
  
  def invalid_date_interval 
    reservation=Reservation.where(calendar: self.calendar).where.not(id: self.id).where('? <= starts_at and ? >= final_time',
      self.starts_at, self.final_time).first
    #puts "Invalid date interval #{starts_at} #{final_time} #{reservation}"
    if reservation.present?
      message=I18n.t('activerecord.errors.models.reservation.attributes.starts_at.already_reserved', 
        duration: reservation.fmt_duration)
      errors.add(:starts_at, message)
    end  
  end
  
  def invalid_date_interval_starts_at
    reservation=Reservation.where(calendar: self.calendar).where.not(id: self.id).where('? > starts_at and ? < final_time',
       self.starts_at,self.starts_at).first
    if reservation.present?
      message=I18n.t('activerecord.errors.models.reservation.attributes.starts_at.already_reserved', 
        duration: reservation.fmt_duration)
      errors.add(:starts_at, message)
    end  
  end
  
  def invalid_date_interval_final_time 
    reservation=Reservation.where(calendar: self.calendar).where.not(id: self.id).where('? > starts_at and ? < final_time',
       self.final_time, self.final_time).first
    if reservation.present?
      message=I18n.t('activerecord.errors.models.reservation.attributes.final_time.already_reserved', 
        duration: reservation.fmt_duration)
      errors.add(:final_time, message)
    end  
  end
  
  def workshop_reserved?
    unless workshop.nil? 
      #count= Reservation.where(workshop: workshop).where.not(id: self.id).count
      count= Reservation.where(workshop: workshop).count
      #puts count
      if count > 0
        message=I18n.t('activerecord.errors.models.reservation.attributes.workshop.previously_reserved')
        #puts ">>> workshop_reserved? #{count} #{message}" 
        errors.add(:workshop_id, message)
      end
    end
  end
  
end
