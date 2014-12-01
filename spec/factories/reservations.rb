# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    starts_at "2014-09-08 19:02:30"
    final_time "2014-09-08 21:02:30"
    max_participants 1
    all_day false
    
    factory :invalid_reservation do
      starts_at nil
      final_time nil
      max_participants nil
      all_day nil
    end
  end
end
