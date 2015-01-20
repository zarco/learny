# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    starts_at {Time.new(2014,9,8,19,02)}
    final_time {Time.new(2014,9,8,21,02)}
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
