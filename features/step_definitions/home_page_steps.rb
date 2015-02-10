Given(/^I am not logged in$/) do
  # Could verify that there is not an open session
end

When(/^I am on the homepage$/) do
  visit root_path
end

Then(/^I should see the welcome message$/) do 
  expect(page).to have_content(I18n.t('views.legends.welcome_to_learny_part1',default: 'The place and perfect teacher to everything you always wanted to learn'))
end

#Looking for a workshop and save my information
Given(/^I am not signed in$/) do
  visit root_path
end

When(/^I type in the search workshop field the workshop name called "(.*?)"$/) do |workshop|
	@guest = FactoryGirl.build(:guest,{:workshop => workshop})
  within(:css, "form[role='search']") do
    fill_in 'w', :with => @guest.workshop
  end
end

Then(/^I send the requiered information to search a workshop in the search button$/) do
  within(:css, "form[role='search']") do
    click_button "Search"
  end
end

Then(/^I do not see the workshop called "(.*?)"$/) do |workshop|
  expect(page).not_to have_content(workshop)
end

When(/^I fill the information to be notified when a workshop is available$/) do
	@guest = FactoryGirl.build(:guest)
	fill_in 'guest[name]', with: @guest.name
	fill_in 'guest[email]', with: @guest.email
	fill_in 'guest[workshop]', with: @guest.workshop
end

Then(/^I send the information to be saved with the 'keep me informed' button$/) do
  within(:css, "form#new_guest") do
    click_button I18n.t('views.legends.guest.keep_me_informed')
  end
end

Then(/^I see a confirmation message$/) do
  expect(page).to have_content(I18n.t('views.legends.guest.suggested_successfully'))
end