# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :venue do
    name {Faker::Name.name}
    email {Faker::Internet.free_email}
    password 'fckpasswd'
    password_confirmation 'fckpasswd'
    
    factory :invalid_venue do
      email nil
      name nil
    end
    
  end
end
