Given(/^that Baby's Badass Burgers is out in Jacksonville today$/) do
  Truck.create! name: "Baby's Badass Burgers"
end

When(/^I go to jaxtrucks\.com$/) do
  visit '/'
end

Then(/^I should see the map of Jacksonville$/) do
  expect(page).to have_content "Google"
end

Then(/^there should be a pin on the map at that truck's location$/) do
  expect(page).to have_content "Baby's Badass Burgers"
end
