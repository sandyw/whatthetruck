FactoryGirl.define do
  factory :location do
    association :truck
    user_address "500 Bay St"
    geocoded_address "500 Bay St"
    latitude 123.0
    longitude 456.0
    from Time.zone.now.midnight + 11.hours
    to Time.zone.now.midnight + 14.hours
  end

  factory :current_location, parent: :location do
    from Time.zone.now - 1.hour
    to Time.zone.now + 2.hours
  end

  factory :future_location, parent: :location do
    from Time.zone.now + 1.hour
    to Time.zone.now + 2.hours
  end

  factory :inactive_location, parent: :location, aliases: [ :past_location ] do
    from Time.zone.now - 4.hours
    to Time.zone.now - 2.hours
  end
end

