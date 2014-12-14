# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expert do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password 'fckpasswd'
    password_confirmation 'fckpasswd'
    website { Faker::InternetSE.http_url }
    facebook_link { Faker::InternetSE.http_url }
    twitter_link { Faker::InternetSE.http_url }
    linkedin_link { Faker::InternetSE.http_url }
    google_plus_link { Faker::InternetSE.http_url }
    
    
    factory :invalid_expert do
      email nil
      first_name nil
      last_name nil
    end
  end
end
