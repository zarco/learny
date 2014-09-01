When(/^select the Sign up as expert option$/) do
  within(:css, '#mdl_signin') do
    click_link I18n.t('views.legends.expert',default: 'Expert')
  end
end

Then(/^I can see the sign up form for experts$/) do
  expect(page).to have_content(Expert.human_attribute_name(:email))
  expect(page).to have_content(Expert.human_attribute_name(:password))
  expect(page).to have_content(Expert.human_attribute_name(:password_confirmation))
  expect(page).to have_content(Expert.human_attribute_name(:first_name))
  expect(page).to have_content(Expert.human_attribute_name(:last_name))
end

Given(/^I am at the expert's sign up page$/) do
  visit new_expert_registration_path
end

When(/^I send my data for the registration as expert$/) do
  @expert = FactoryGirl.build(:expert)
  fill_in Expert.human_attribute_name(:email), with: @expert.email
  fill_in Expert.human_attribute_name(:password), with: @expert.password
  fill_in Expert.human_attribute_name(:password_confirmation), with: @expert.password_confirmation
  fill_in Expert.human_attribute_name(:first_name), with: @expert.first_name
  fill_in Expert.human_attribute_name(:last_name), with: @expert.last_name
  click_button I18n.t('devise.sessions.sign_up')
end

Given(/^I am logged in as expert$/) do
  pending # express the regexp above with the code you wish you had
end


Given(/^I am at my home page as expert$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I click on the button for proposing a new course$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I go to the form for proposing a new course$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I am at the form for proposing a new course$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I submit the required information for proposing a course called "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I can see the "(.*?)" course listed in the "(.*?)" state in 'My courses' page$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end
