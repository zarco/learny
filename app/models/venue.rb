class Venue < ActiveRecord::Base
  validates :name, presence: true
  validates :email, uniqueness: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  has_many :calendars
  has_many :venue_pictures
  accepts_nested_attributes_for :venue_pictures
  
end
