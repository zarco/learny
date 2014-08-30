Given(/^I am browsing the site$/) do
  visit root_path
end

When(/^I click on the sign up button$/) do
  click_button I18n.t('devise.sessions.sign_up', default: 'Sign up')
end

When(/^select the Sign up as student option$/) do
  click_link I18n.t('views.legends.student',default: 'Student')
end

Then(/^I can see the sign in form for students$/) do
  expect(page).to have_content(Student.human_attribute_name(:email))
  expect(page).to have_content(Student.human_attribute_name(:password))
  expect(page).to have_content(Student.human_attribute_name(:password_confirmation))
  expect(page).to have_content(Student.human_attribute_name(:first_name))
  expect(page).to have_content(Student.human_attribute_name(:last_name))
end

Given(/^I am at the sign up page$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I fill in the blanks with my data$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^submit the form$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can see a confirmation message$/) do
  pending # express the regexp above with the code you wish you had
end
