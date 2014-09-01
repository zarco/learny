Feature: The expert can sign up into the platform
	In order to become a registered expert
	And to offer courses
	As a guest
	I want to sign up as expert
	
	Background: I am a guest on the site
	
	Scenario: Reaching the sign in form
		Given I am browsing the site
		When I click on the sign up button
		And select the Sign up as expert option
		Then I can see the sign up form for experts
		
	Scenario: Experts's sign up successful
		Given I am at the expert's sign up page
		When I send my data for the registration as expert
		Then I can see a confirmation message