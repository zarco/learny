Given(/^I am not logged in$/) do
  # Could verify that there is not an open session
end

When(/^I am on the homepage$/) do
  visit root_path
end

Then(/^I should see the "(.*?)" message$/) do |message|
  expect(page).to have_content(message)
end
