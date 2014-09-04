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
  @expert = FactoryGirl.create(:expert)
  @expert.confirm!
  visit new_expert_session_path
  fill_in Expert.human_attribute_name(:email), with: @expert.email
  fill_in Expert.human_attribute_name(:password), with: @expert.password
  click_button I18n.t('devise.sessions.sign_in')
end

Given(/^I am at my home page as expert$/) do
  visit expert_root_path
end

When(/^I submit the required information for proposing a workshop called "(.*?)"$/) do |name|
  @workshop = FactoryGirl.build(:workshop, {:name => name})
  within('#new_workshop') do
    fill_in Workshop.human_attribute_name(:name), with: @workshop.name
    fill_in Workshop.human_attribute_name(:price), with: @workshop.price
    fill_in Workshop.human_attribute_name(:length), with: @workshop.length
    fill_in Workshop.human_attribute_name(:previous_skills), with: @workshop.previous_skills
    fill_in Workshop.human_attribute_name(:agenda), with: @workshop.agenda

    click_button I18n.t('views.actions.propose')
  end
end

Then(/^I can see the "(.*?)" workshop listed in the "(.*?)" state in 'My workshops' page$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end
