# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :truck do
    name "MyString"
    address "MyString"
    latitude 0.0
    longitude 0.0
  end

  factory :current_truck, parent: :truck do
    user_address "1022 park st 32204"
    latitude 123.0
    longitude 456.0
  end

  factory :inactive_truck, parent: :truck do
    user_address nil
    latitude nil
    longitude nil
  end
end
