class Guest < ActiveRecord::Base
	validates :email, :uniqueness => {:scope => :workshop}
	validates :name, presence: true
	validates :email, presence: true
	validates :workshop, presence: true
end
