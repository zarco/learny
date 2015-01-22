Feature: The venue is able to update its data
	In order to update my profile
	As an venue
	I want to update my data
	
Background: 
	Given I am logged in as venue
		
Scenario: Reach the update page from my profile page
	Given I am at my profile update page as venue
	When I click on 'Edit' button
	Then I am at the profile update page

Scenario: Updating my profile
	Given I am at my profile update page as venue
	When I fill in the venue fields 
	And I click on 'Update'
	Then I see the message 'Update has been sucessfull'