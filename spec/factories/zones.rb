FactoryGirl.define do
  factory :zone do
    name "MyString"
    
    factory :invalid_zone do
      name nil
    end
    
    
  end

end
