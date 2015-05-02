class StudentSurvey < ActiveRecord::Base
  validates :rating_workshop, :rating_venue, :rating_expert, :rating_learny, :workshop_comment, :venue_comment, presence: true
  belongs_to :workshop
  belongs_to :student
end
