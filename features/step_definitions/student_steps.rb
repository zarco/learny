Given(/^I am browsing the site$/) do
  visit root_path
end

When(/^I click on the sign up button$/) do
  click_button I18n.t('devise.sessions.sign_up', default: 'Sign up')
end

When(/^select the Sign up as student option$/) do
  click_link I18n.t('views.legends.student',default: 'Student')
end

Then(/^I can see the sign up form for students$/) do
  expect(page).to have_content(Student.human_attribute_name(:email))
  expect(page).to have_content(Student.human_attribute_name(:password))
  expect(page).to have_content(Student.human_attribute_name(:password_confirmation))
  expect(page).to have_content(Student.human_attribute_name(:first_name))
  expect(page).to have_content(Student.human_attribute_name(:last_name))
end

Given(/^I am at the student's sign up page$/) do
  visit new_student_registration_path
end

When(/^I send my data for the registration as student$/) do
  @student = FactoryGirl.build(:student)
  fill_in Student.human_attribute_name(:email), with: @student.email
  fill_in Student.human_attribute_name(:password), with: @student.password
  fill_in Student.human_attribute_name(:password_confirmation), with: @student.password_confirmation
  fill_in Student.human_attribute_name(:first_name), with: @student.first_name
  fill_in Student.human_attribute_name(:last_name), with: @student.last_name
  click_button I18n.t('devise.sessions.sign_up')
end


Then(/^I can see a confirmation message$/) do
#expect(page).to have_content(Student.human_attribute_name(:email))
  expect(page).to have_content(I18n.t('devise.registrations.signed_up_but_unconfirmed'))
end
