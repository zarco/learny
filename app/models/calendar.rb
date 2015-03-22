class Calendar < ActiveRecord::Base
  
  acts_as_paranoid
  obfuscate_id :spin => 13889931

  validates :title, presence: true

  has_many :reservations, dependent: :destroy
  
  belongs_to :venue

end
