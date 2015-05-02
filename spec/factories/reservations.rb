# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    starts_at { (Time.now+1.day).change(hour: 10, min: 0)}#{Time.new(2014,9,8,19,02)}
    final_time { (Time.now.+1.day).change(hour: 14, min:0)}#{Time.new(2014,9,8,21,02)}
    max_participants 12
    all_day false
    association :calendar, factory: :default_calendar
    
    factory :invalid_reservation do
      starts_at nil
      final_time nil
      max_participants nil
      all_day nil
    end
    
    factory :other_reservation do
      starts_at { (Time.now+1.day).change(hour: 16, min: 0) }#{Time.new(2014,9,8,19,02)}
      final_time { (Time.now.+1.day).change(hour: 18, min: 0) }#{Time.new(2014,9,8,21,02)}
    end
    
    trait :with_workshop do
      association :workshop, factory: :workshop
    end
    
  end
end
