When(/^select the Sign up as venue option$/) do
  click_link I18n.t('views.legends.venue',default: 'Venue')
end

Then(/^I can see the sign up form for venues$/) do
  expect(page).to have_content(Venue.human_attribute_name(:email))
  expect(page).to have_content(Venue.human_attribute_name(:password))
  expect(page).to have_content(Venue.human_attribute_name(:password_confirmation))
  expect(page).to have_content(Venue.human_attribute_name(:name))
end

Given(/^I am at the venues's sign up page$/) do
  visit new_venue_registration_path
end

When(/^I send my data for the registration as venue$/) do
  @venue = FactoryGirl.build(:venue)
  fill_in Venue.human_attribute_name(:email), with: @venue.email
  fill_in Venue.human_attribute_name(:password), with: @venue.password
  fill_in Venue.human_attribute_name(:password_confirmation), with: @venue.password_confirmation
  fill_in Venue.human_attribute_name(:name), with: @venue.name
  click_button I18n.t('devise.sessions.sign_up')
end
