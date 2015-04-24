Given(/^I am logged in as admininistrator$/) do
  @administrator = FactoryGirl.create(:administrator)
  visit new_administrator_session_path
  fill_in Administrator.human_attribute_name(:email), with: @administrator.email
  fill_in Administrator.human_attribute_name(:password), with: @administrator.password
  click_button I18n.t('devise.sessions.sign_in')
end

Given(/^exists a venue called "(.*?)"$/) do |name|
  @venue = FactoryGirl.create(:venue, :name => name)
end

Given(/^I am on my home page as administrator$/) do
  visit administrator_root_path
end

When(/^I go to the venues page$/) do
  visit admin_venues_path
end

Then(/^I can see "(.*?)" listed$/) do |venue|
  expect(page).to have_content(venue)
end

Given(/^exists a "(.*?)" workshop called "(.*?)"$/) do |state, name|
  @workshop=FactoryGirl.create(:workshop, name: name, state: state)
  #puts @workshop.persisted?
end

When(/^I go to the workshops page$/) do
  click_link Workshop.model_name.human
end

Given(/^I am at the workshops page$/) do
  visit admin_workshops_path
end

When(/^I go to the "(.*?)" workshops page$/) do |state|
  click_link I18n.t("views.states.#{state}", count: 2, default: state) 
end

Given(/^there is a reservation in "(.*?)" for a workshop "(.*?)"$/) do |venue, workshop|
  @reservation=FactoryGirl.create(:reservation, workshop: @workshop, calendar: @venue.calendars.first)
end


Given(/^I am at the venues page$/) do
  visit admin_venues_path
end

When(/^I got to reservations page for "(.*?)"$/) do |arg1|
  within(:css, ".venue-#{@venue.to_param}") do
    click_link Reservation.model_name.human(count: 2)
  end
  
end

