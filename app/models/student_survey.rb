class StudentSurvey < ActiveRecord::Base
  validates :rating_workshop, :rating_venue, :rating_expert, :rating_learny, :workshop, :student, presence: true
  belongs_to :workshop
  belongs_to :student
  
  validates :rating_workshop,:rating_venue, :rating_expert, :rating_learny, 
    numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5, only_integer: true }, allow_nil: true
  
  
  #1 encuesta por estudiante por taller
  #estado de taller en given
  #estudiante inscrito en taller
  #ratings de 0 a 5
  #longitud maxima de comentario en 1000
  
  validate :workshop_has_not_been_given, :student_not_enrolled
  validate :survey_already_done, on: :create
  
  
  private
  
  def workshop_has_not_been_given
    unless workshop.given?
      message=I18n.t('activerecord.errors.models.student_survey.attributes.workshop.not_given')
        #puts ">>> workshop_reserved? #{count} #{message}" 
      errors.add(:workshop_id, message)
    end
  end
  
  def student_not_enrolled
    unless workshop.student_enrolled? student
      message=I18n.t('activerecord.errors.models.student_survey.attributes.workshop.student_not_enrolled')
        #puts ">>> workshop_reserved? #{count} #{message}" 
      errors.add(:workshop_id, message)
    end
  end
  
  def survey_already_done
    if workshop.student_survey_done? student
      message=I18n.t('activerecord.errors.models.student_survey.attributes.workshop.survey_already_done')
        #puts ">>> workshop_reserved? #{count} #{message}" 
      errors.add(:workshop_id, message)
    end
  end
end
