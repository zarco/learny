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

Then(/^I can see "(.*?)" listed$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
