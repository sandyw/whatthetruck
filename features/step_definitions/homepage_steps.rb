Given(/^that Baby's Badass Burgers is out in Jacksonville today$/) do
  truck = FactoryGirl.create(:truck, name: "Baby's Badass Burgers")
  truck.add_location! address: stubbed_user_address, from: 1.hour.ago, to: 5.hours.from_now
end

Then(/^I should see its full street address$/) do
  page.should have_content "1022 Park St., Jacksonville, FL, 32204, USA"
end

When(/^I go to jaxtrucks\.com$/) do
  visit '/'
end

Then(/^I should see the map of Jacksonville$/) do
  expect(page).to have_content "Google"
end

Then(/^I should see that truck in the list of trucks/) do
  within "#list" do
    expect(page).to have_content "Baby's Badass Burgers"
  end
end

Then(/^I should see a message saying "(.*?)"$/) do |message|
  page.should have_content message
end

Given(/^that it is (\d+)pm$/) do |hour|
  Timecop.travel( Time.zone.now.midnight + (12 + hour.to_i).hours )
end

Given(/^that Chew Chew will be at 400 Bay St from 4pm\-2am today$/) do
  truck = FactoryGirl.create :truck, name: "Chew Chew"
  midnight = Time.zone.now.midnight
  four = midnight + (12 + 4).hours
  two = midnight + (24 + 2).hours
  truck.locations.create! user_address: "400 Bay St", geocoded_address: "400 Bay St", from: four, to: two, latitude: 123.0, longitude: 456.0
end

Then(/^I should see that Chew Chew will be out from 4pm\-2am today$/) do
  page.should have_content "Later"
  within "a.list-group-item" do
    page.should have_content "Chew Chew"
    page.should have_content "4pm"
    page.should have_content "2am"
    page.should have_content "400 Bay St"
  end
end
