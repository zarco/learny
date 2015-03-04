class Calendar < ActiveRecord::Base
  obfuscate_id :spin => 13889931

  validates :title, presence: true

  has_many :reservations
  
  belongs_to :venue

end
