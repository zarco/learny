# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :venue do
    name {Faker::Name.name}
    email {Faker::Internet.free_email}
    password 'fckpasswd'
    password_confirmation 'fckpasswd'
    website 'www.fake.com'
    facebook_link 'facebook.com/fake'
    twitter_link '@fake'
    google_plus_link '+fake'
    calendars {[FactoryGirl.create(:default_calendar)]}
    
    factory :invalid_venue do
      email nil
      name nil
      calendars []
    end
    
    factory :no_calendar_venue do
      calendars []
    end
    
  end
end
