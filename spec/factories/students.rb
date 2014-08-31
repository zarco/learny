# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password 'fckpasswd'
    password_confirmation 'fckpasswd'
    
    factory :invalid_student do
      email nil
      first_name nil
      last_name nil
    end
    
  end
end
