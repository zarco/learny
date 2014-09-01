Given(/^I am not logged in$/) do
  # Could verify that there is not an open session
end

When(/^I am on the homepage$/) do
  visit root_path
end

Then(/^I should see the welcome message$/) do 
  expect(page).to have_content(I18n.t('views.legends.welcome_to_learny',default: 'Welcome to Learny!'))
end