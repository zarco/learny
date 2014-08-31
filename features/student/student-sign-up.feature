Feature: The student can sign up into the platform
	In order to 
	As a guest
	I want to sign up as student
	
	Background: I am a guest on the site
	
	Scenario: Reaching the sign in form
		Given I am browsing the site
		When I click on the sign up button
		And select the Sign up as student option
		Then I can see the sign up form for students
		
	Scenario: Student's sign up successful
		Given I am at the sign up page
		When I fill in the blanks with my data
		And submit the form
		Then I can see a confirmation message