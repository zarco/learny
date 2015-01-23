# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :calendar do
    title {Faker::Name.name}
    venue {FactoryGirl.create(:no_calendar_venue)}
        
    factory :invalid_calendar do
      title nil
    end
    
    factory :default_calendar do
      title 'default'
      is_default true
    end
  end
end
