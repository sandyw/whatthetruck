Given(/^that Baby's Badass Burgers is out in Jacksonville today$/) do
end

When(/^I go to jaxtrucks\.com$/) do
  visit '/'
end

Then(/^I should see the map of Jacksonville$/) do
  expect(page).to have_content "Google"
end

Then(/^there should be a pin on the map at that truck's location$/) do
  pending # express the regexp above with the code you wish you had
end
