FactoryGirl.define do
  factory :student_survey do
    rating_workshop 1
    rating_expert 1
    rating_venue 1
    rating_learny 1
    workshop_comment "MyText"
    venue_comment "MyText"
    association :workshop, factory: :given_workshop
    association :student, factory: :student

    initialize_with{
      Enrollment.create(workshop: workshop, student: student)
      new(workshop: workshop, student: student)
    }

    factory :invalid_student_survey do
      rating_workshop nil
      rating_expert nil
      rating_venue nil
      rating_learny nil  
    end

  end

end
