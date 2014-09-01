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
  pending # express the regexp above with the code you wish you had
end

When(/^I send my data for the registration as venue$/) do
  pending # express the regexp above with the code you wish you had
end
