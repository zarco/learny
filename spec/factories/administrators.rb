FactoryGirl.define do
  factory :administrator do
    name {Faker::Name.name}
    email {Faker::Internet.free_email}
    password 'fckpasswd'
    password_confirmation 'fckpasswd'

    factory :invalid_administrator do
      email nil
      password nil
    end
  end
end
