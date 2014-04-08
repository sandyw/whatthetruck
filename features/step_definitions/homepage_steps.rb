Given(/^that Baby's Badass Burgers is out in Jacksonville today$/) do
  FactoryGirl.create(:truck, name: "Baby's Badass Burgers")
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
