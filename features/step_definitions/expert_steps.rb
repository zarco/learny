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
  within(:css,'.main') do
    @expert = FactoryGirl.build(:expert)
    fill_in Expert.human_attribute_name(:email), with: @expert.email
    fill_in Expert.human_attribute_name(:password), with: @expert.password
    fill_in Expert.human_attribute_name(:password_confirmation), with: @expert.password_confirmation
    fill_in Expert.human_attribute_name(:first_name), with: @expert.first_name
    fill_in Expert.human_attribute_name(:last_name), with: @expert.last_name
    click_button I18n.t('devise.sessions.sign_up')
  end
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

Given(/^"(.*?)" has made a reservation for next friday$/) do |venue|
  @venue=FactoryGirl.create(:venue, :name => venue)
  @venue.confirm!
  reservation=FactoryGirl.create(:reservation)
  @venue.calendars.first.reservations.create(FactoryGirl.attributes_for(:reservation))
end

When(/^I submit the required information for proposing a workshop called "(.*?)" in "(.*?)" next friday$/) do |name, venue|
  @workshop = FactoryGirl.build(:workshop, {:name => name})
  within('#new_workshop') do
    fill_in Workshop.human_attribute_name(:name), with: @workshop.name
    fill_in Workshop.human_attribute_name(:description), with: @workshop.description
    fill_in Workshop.human_attribute_name(:max_number_participants), with: @workshop.max_number_participants
    fill_in Workshop.human_attribute_name(:price), with: @workshop.price
    fill_in Workshop.human_attribute_name(:length), with: @workshop.length
    fill_in Workshop.human_attribute_name(:previous_skills), with: @workshop.previous_skills
    fill_in Workshop.human_attribute_name(:agenda), with: @workshop.agenda
  #find('.btn_find_venue').click
  end

  #pending
  #within('.dlg_find_venue') do
  #  print page.html
  #   click_link venue
  #end

  within('#new_workshop') do
    click_button I18n.t('views.actions.propose')
  end
#pending
end

Then(/^I can see the "(.*?)" workshop listed in the "(.*?)" state in 'My workshops' page$/) do |title, state|
  visit workshops_path
  expect(page).to have_content(title)
  state_label='views.states.'+state
  expect(page).to have_content(I18n.t(state_label))
end

Then(/^I can see a confirmation message and the details of the "(.*?)" workshop$/) do |arg1|
  expect(page).to have_content(I18n.t('views.legends.workshop.proposed_successfully',
    default: 'Workshop successfully proposed.'))
#TODO Enable and fix
#expect(page).to have_content(@workshop.name)
#expect(page).to have_content(@workshop.description)
#expect(page).to have_content(@workshop.agenda)

end

Given(/^I am at the form for proposing a new workshop$/) do
  visit new_workshop_path
end

Given(/^I am at my profile page as expert$/) do
  visit expert_path @expert
end

Then(/^I go to the profile update page$/) do
  expect(page.current_path).to eq(edit_expert_registration_path)
end

Given(/^I am at my profile update page as expert$/) do
  visit edit_expert_registration_path
end

When(/^I fill in the expert fields$/) do
  fill_in Expert.human_attribute_name(:occupation), with: @expert.occupation
  fill_in Expert.human_attribute_name(:profile), with: @expert.profile
  fill_in Expert.human_attribute_name(:current_password), with: @expert.password
  attach_file Expert.human_attribute_name(:avatar),
  #  Rack::Test::UploadedFile.new(File.open(File.join(Rails.root,'spec','fixtures','megan.jpg')))
  File.join(Rails.root,'spec','fixtures','megan.jpg')
end

