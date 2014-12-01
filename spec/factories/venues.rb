# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :venue do
    name {Faker::Name.name}
    email {Faker::Internet.free_email}
    password 'fckpasswd'
    password_confirmation 'fckpasswd'
    calendars {[FactoryGirl.create(:default_calendar)]}
    
    factory :invalid_venue do
      email nil
      name nil
      calendars []
    end
    
    
    
  end
end
