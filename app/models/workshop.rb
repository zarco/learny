class Workshop < ActiveRecord::Base
  include PgSearch
    
  validates :name,:length,:agenda,:description,:state,:expert,:max_number_participants,:min_number_participants,
     presence: true
  
  validates :max_number_participants,:min_number_participants, :length, numericality: { only_integer: true, greater_than: 0  }
  
  validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true, if: :free?
  validates :price, presence: true, numericality: { greater_than: 0 }, unless: :free?
  
  validate :valid_max_participants, :valid_min_participants,:length_fits_with_reservation
  
  attr_accessor :last_event
  
  
  state_machine :state, :initial => :new do
    
    state :proposed
    
    state :scheduled
    
    state :stand_by
    
    state :given
    
    state :cancelled
    
    event :proposed_by_expert do
      transition :new => :proposed
    end
    
    event :proposed_with_reservation do
      transition [:new,:proposed] => :scheduled
    end
    
    event :accepted_by_venue do
      transition :proposed => :scheduled
    end
    
    event :cancelled_by_expert do
      transition :scheduled => :cancelled
    end
    
    event :has_been_given do
      transition :scheduled => :given
    end
    
    after_transition :to => any do |workshop, transition|
      #puts ">>>>>>>>>>>>>>>>>> #{transition}"
      workshop.last_event=transition.event  
    end 
    
  end
  
  
  pg_search_scope :search_workshop, 
                  :against => [:name, :description, :agenda],
                  :using => {
                    :tsearch => {:prefix => true}
                  }
  
  
  belongs_to :expert
  has_one :reservation
  has_one :calendar, through: :reservation 
  has_one :venue, through: :calendar
  
  has_many :enrollments
  has_many :students, through: :enrollments
  
  
  accepts_nested_attributes_for :reservation
  
  
  def small_description(total_words=250)
    description.truncate(total_words, separator: " ")
  end
  
  def update_reservation(reservation_id)    
    unless reservation_changes(reservation_id)
      return
    end
    
    
    Workshop.transaction do
      #puts "previous changed? #{reservation.changed?}"
      unless self.reservation.nil?
        reservation=self.reservation
        reservation.workshop_id=nil
        reservation.save
      end
      
      @reservation=Reservation.find(reservation_id) unless reservation_id.nil?||reservation_id.empty?
      #puts "#{@reservation.id}"
      unless @reservation.nil?
        @reservation.workshop = self
        self.proposed_with_reservation
        @reservation.save
        #self.update(:state => :scheduled)
      end
    end
  end
  
  private
  def reservation_changes(reservation_id)
    current_reservation_id = self.reservation.nil? ? nil : reservation.id
    current_reservation_id.to_s != reservation_id.to_s
  end
  
  def valid_max_participants
    if(reservation.present? && (max_number_participants > reservation.max_participants)) 
        message=I18n.t('activerecord.errors.models.reservation.attributes.workshop.too_many_participants', 
          participants: max_number_participants)
        #puts message
        errors.add(:max_number_participants, message)
    end
  end
  
  def length_fits_with_reservation
    if(reservation.present? && (length > reservation.availability_in_hours))
        message=I18n.t('activerecord.errors.models.reservation.attributes.workshop.too_much_time')
        #puts message 
        errors.add(:lenght, message)
    end
  end
  
  def valid_min_participants 
    if( min_number_participants.present? && max_number_participants.present? && 
        min_number_participants > max_number_participants)
        message=I18n.t('activerecord.errors.models.workshop.attributes.min_number_participants.greater_than_max')
        #puts message 
        errors.add(:min_number_participants, message)
    end
  end
  
end 
