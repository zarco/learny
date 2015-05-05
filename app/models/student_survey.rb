class StudentSurvey < ActiveRecord::Base
  validates :rating_workshop, :rating_venue, :rating_expert, :rating_learny, :workshop_comment, :venue_comment, presence: true
  belongs_to :workshop
  belongs_to :student
  
  validates :rating_workshop,:rating_venue, :rating_expert, :rating_learny, 
    numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5, only_integer: true }, allow_nil: true
  
  
  #1 encuesta por estudiante por taller
  #estado de taller en given
  #estudiante inscrito en taller
  #ratings de 0 a 5
  #longitud maxima de comentario en 1000
  
  
  
end
