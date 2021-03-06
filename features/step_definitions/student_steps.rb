Given(/^I am browsing the site$/) do
  visit root_path
end

When(/^I click on the sign up button$/) do
  within(:css,'.navbar') do
    click_button I18n.t('devise.sessions.sign_up', default: 'Sign up')
  end
end

When(/^select the Sign up as student option$/) do
  within(:css, '#mdl_signin') do
    click_link I18n.t('views.legends.student',default: 'Student')
  end
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
  within(:css,'.main') do
    fill_in Student.human_attribute_name(:email), with: @student.email
    fill_in Student.human_attribute_name(:password), with: @student.password
    fill_in Student.human_attribute_name(:password_confirmation), with: @student.password_confirmation
    fill_in Student.human_attribute_name(:first_name), with: @student.first_name
    fill_in Student.human_attribute_name(:last_name), with: @student.last_name
    click_button I18n.t('devise.sessions.sign_up')
  end
end

Then(/^I can see a confirmation message$/) do
#expect(page).to have_content(Student.human_attribute_name(:email))
  expect(page).to have_content(I18n.t('devise.registrations.signed_up_but_unconfirmed'))
end

Given(/^I am logged in as student$/) do
  @student = FactoryGirl.create(:student)
  @student.confirm
  visit new_student_session_path
  fill_in Student.human_attribute_name(:email), with: @student.email
  fill_in Student.human_attribute_name(:password), with: @student.password
  click_button I18n.t('devise.sessions.sign_in')
end

Given(/^there is a workshop called "(.*?)"$/) do |name|
  venue=FactoryGirl.create(:venue)
  @workshop = FactoryGirl.create(:workshop, :name => name)
  @reservation=FactoryGirl.create(:reservation, :workshop => @workshop, :calendar => venue.calendars.first)
end

Given(/^I am at my home page as student$/) do
  visit student_root_path
end

When(/^I fill in the search workshop field with "(.*?)"$/) do |name|
  within(:css, ".workshop-search-form") do
    fill_in 'w', :with => name
  end
end

When(/^I click in the search button$/) do
  within(:css, ".workshop-search-form") do
    click_button "Search"
  end
end

Then(/^I see the workshop titled "(.*?)"$/) do |name|
#save_and_open_page
  expect(page).to have_content(name)
end

Given(/^I am at the "(.*?)" workshop page$/) do |arg1|
  visit workshop_path @workshop
end

When(/^I click the enroll button$/) do
  within(:css ,".form-enrollment") do
    click_button I18n.t('views.actions.enroll',default: 'Enroll')
  end
end

Then(/^I see a confirmation message of the successful enrollment$/) do
  expect(page).to have_content(I18n.t('controllers.enrollments.create',default: 'Student successfully enrolled'))
end

Given(/^I have already enrolled in the "(.*?)" workshop$/) do |arg1|
  @enrollment=FactoryGirl.create(:enrollment, :student => @student, :workshop => @workshop)
end

When(/^I am at the "(.*?)" workshop's page$/) do |arg1|
  visit workshop_path @workshop
end

Then(/^I do not see the enroll button$/) do
  expect(page).to_not have_button('Enroll')
end

When(/^I go to 'My workshops" page$/) do
  visit enrollments_path
end

Then(/^I can see the "(.*?)" workshop in the list$/) do |workshop|
  expect(page).to have_content(workshop)
end

Given(/^I am at my profile page as student$/) do
  visit student_path @student
end

When(/^I click on 'Edit' button$/) do
  click_link "Edit"
end

Then(/^I at the profile update page$/) do
  expect(page.current_path).to eq(edit_student_registration_path)
end

Given(/^I am at my profile update page as student$/) do
  visit edit_student_registration_path
end

When(/^I fill in the student fields$/) do
  fill_in Student.human_attribute_name(:occupation), with: @student.occupation
  fill_in Student.human_attribute_name(:profile), with: @student.profile
  fill_in Student.human_attribute_name(:current_password), with: @student.password
  attach_file Student.human_attribute_name(:avatar), File.join(Rails.root,'spec','fixtures','megan.jpg')
end

When(/^I click on 'Update'$/) do
  click_button I18n.t('devise.registrations.edit.update',default: 'Update')
end

Then(/^I see the message 'Update has been sucessfull'$/) do
  expect(page).to have_content(I18n.t('devise.registrations.updated',default: 'Update has been sucessfull'))
end

Given(/^the "(.*?)" workshop is full$/) do |workshop|
  pending # express the regexp above with the code you wish you had
end

When(/^I go to "(.*?)" workshop$/) do |workshop|
  pending # express the regexp above with the code you wish you had
end

Then(/^I see the message 'The workshop is full'$/) do
  pending # express the regexp above with the code you wish you had
end

