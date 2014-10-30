class Calendar < ActiveRecord::Base
  validates :title, presence: true

  has_many :reservations
  
  belongs_to :venue

end
