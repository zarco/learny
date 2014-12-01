class Workshop < ActiveRecord::Base
  include PgSearch
    
  validates :name,:price,:length,:agenda,:description,:state,:expert, presence: true
  
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
  
end
