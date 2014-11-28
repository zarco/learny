FactoryGirl.define do
  factory :enrollment do
    student {FactoryGirl.build(:student)}
    workshop {FactoryGirl.build(:workshop)}

    factory :invalid_enrollment do
      workshop nil
      student nil
    end
  end
end
