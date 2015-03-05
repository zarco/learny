class Calendar < ActiveRecord::Base
  
  acts_as_paranoid
  
  validates :title, presence: true

  has_many :reservations, dependent: :destroy
  
  belongs_to :venue

end
