# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expert do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password 'fckpasswd'
    password_confirmation 'fckpasswd'
    website 'www.fake.com'
    facebook_link 'facebook.com/fake'
    twitter_link '@fake'
    linkedin_link 'id=12345678'
    google_plus_link '+fake'
    
    
    factory :invalid_expert do
      email nil
      first_name nil
      last_name nil
    end
  end
end
