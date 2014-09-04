class Workshop < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true
  validates :length, presence: true
  validates :agenda, presence: true
  
  belongs_to :expert
  
end
