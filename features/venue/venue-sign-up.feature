Feature: The venue can sign up into the platform
	In order to become a registered venue
	And offer the space for courses
	As a guest
	I want to sign up as venue
	
	Background: I am a guest on the site
	
	Scenario: Reaching the sign in form
		Given I am browsing the site
		When I click on the sign up button
		And select the Sign up as venue option
		Then I can see the sign up form for venues
		
	Scenario: Venue's sign up successful
		Given I am at the venues's sign up page
		When I send my data for the registration as venue
		Then I can see a confirmation message