FactoryGirl.define do
  factory :guest do
		name {Faker::Name.first_name}
		email {Faker::Internet.email}
		workshop {Faker::Name.name}

		factory :invalid_guest do
		  name nil
		  email nil
		  workshop nil
		end
	end
end
