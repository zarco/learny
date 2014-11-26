# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :calendar do
    title {Faker::Name.name}
        
    factory :invalid_calendar do
      title nil
    end
    
    factory :default_calendar do
      title 'default'
      is_default true
    end
  end
end
