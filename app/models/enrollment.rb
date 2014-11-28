class Enrollment < ActiveRecord::Base

  belongs_to :workshop
  belongs_to :student
  
  validates :workshop, :student, presence: true
 
  def is_new
    self.id.nil?  
  end
  
  
end
