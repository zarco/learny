class Workshop < ActiveRecord::Base
  include PgSearch
    
  validates :name, presence: true
  validates :price, presence: true
  validates :length, presence: true
  validates :agenda, presence: true
  validates :description, presence: true
  validates :state, presence: true
  validates :expert, presence: true
  
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
  
end
