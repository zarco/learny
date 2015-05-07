class Zone < ActiveRecord::Base
  validates :name, presence: true
  
  has_many :workshops
  
  acts_as_paranoid
  
end
