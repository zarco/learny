Feature: The student is able to update its personal data
	In order to update my profile
	As an student
	I want to update my personal data
	
Background: 
	Given I am logged in as student
		
Scenario: Reach the update page from my profile page
	Given I am at my profile page as student
	When I click on 'Edit' button
	Then I at the profile update page
	
Scenario: Updating my profile
	Given I am at my profile update page as student
	When I fill in the student fields 
	And I click on 'Update'
	Then I see the message 'Update has been sucessfull'