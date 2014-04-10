# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :truck do
    name Faker::Company.name
  end

  factory :current_truck, parent: :truck do
    after(:create) do |truck, evaluator|
      create_list(:current_location, 1, truck: truck)
    end
  end

  factory :inactive_truck, parent: :truck do
    after(:create) do |truck, evaluator|
      create_list(:inactive_location, 1, truck: truck)
    end
  end

  factory :upcoming_truck, parent: :truck do
    after(:create) do |truck, evaluator|
      create_list(:future_location, 1, truck: truck)
    end
  end
end
