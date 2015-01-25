Feature: The expert is able to update its personal data
	In order to update my profile
	As an expert
	I want to update my personal data
	
Background: 
	Given I am logged in as expert
		
Scenario: Reach the update page from my profile page
	Given I am at my profile page as expert
	When I click on 'Edit' button
	Then I go to the profile update page
	
Scenario: Updating my profile
	Given I am at my profile update page as expert
	When I fill in the expert fields 
	And I click on 'Update'
	Then I see the message 'Update has been sucessfull'