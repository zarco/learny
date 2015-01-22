class Workshop < ActiveRecord::Base
  include PgSearch
    
  validates :name,:length,:agenda,:description,:state,:expert,:max_number_participants,:min_number_participants,
     presence: true
  
  validates :max_number_participants,:min_number_participants, :length, numericality: { only_integer: true, greater_than: 0  }
  
  validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true, if: :free?
  validates :price, presence: true, numericality: { greater_than: 0 }, unless: :free?
  
  enum state: [:proposed, :scheduled, :stand_by, :cancelled, :given]
  
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
  
  def small_description(total_words=250)
    description.truncate(total_words, separator: " ")
  end
  
end
