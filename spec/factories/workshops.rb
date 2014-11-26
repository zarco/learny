# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :workshop do
    name {Faker::Name.name}
    price 10000.00
    length 2
    previous_skills "Spoken english, Musical skills"
    agenda { Faker::HipsterIpsum.paragraphs.join}
    description { Faker::HipsterIpsum.paragraphs.join}
    max_number_participants {5}
    state :proposed
    expert {FactoryGirl.build(:expert)}

    factory :workshop_with_reservation do
      reservation {FactoryGirl.build(:reservation)}
    end

    factory :invalid_workshop do
      name nil
      price 10.00*-1
      length 2*-1
      agenda nil
      description nil
      max_number_participants 2*-1
      state nil
      expert nil
    end
  end
end