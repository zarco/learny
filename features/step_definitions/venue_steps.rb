
When(/^select the Sign up as venue option$/) do
  within(:css, '#mdl_signin') do
    click_link I18n.t('views.legends.venue',default: 'Venue')
  end
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



Given(/^I am logged in as venue$/) do
  @venue = FactoryGirl.create(:venue)
  @venue.confirm!
  visit new_venue_session_path
  fill_in Expert.human_attribute_name(:email), with: @venue.email
  fill_in Expert.human_attribute_name(:password), with: @venue.password
  click_button I18n.t('devise.sessions.sign_in')
end

Given(/^I am at my home page as venue$/) do
  visit venue_root_path
end

Given(/^the "(.*?)" calendar is selected$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I click on the 'Create reservation' button$/) do
  click_link I18n.t('views.actions.make_reservation')
end

When(/^afterwards, I sumbit the required information for the reservation$/) do
  visit new_reservation_path
  @reservation=FactoryGirl.build(:reservation, :starts_at => DateTime.now)
  select_datetime @reservation.starts_at.to_s, :from=> Reservation.human_attribute_name(:starts_at)
  select_time @reservation.final_time.to_s, :from=> Reservation.human_attribute_name(:final_time)
  fill_in Reservation.human_attribute_name(:max_participants), with: @reservation.max_participants
  select @venue.calendars.first.title, from: Reservation.human_attribute_name(:calendar_id)
  click_button I18n.t('views.actions.make_reservation')
end

Then(/^I can see the new reservation on the "(.*?)" calendar$/) do |calendar|
  expect(page).to have_content(@venue.calendars.first.title)
  expect(page).to have_content(@reservation.starts_at.strftime("%H:%M"))
end

When(/^I click on the 'New Calendar' button$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I sumbit the required data to define the "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I can see the new calendar listed$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^afterwards, I sumbit the required information$/) do
  pending # express the regexp above with the code you wish you had
end
