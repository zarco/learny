Feature: The admin can list the venues
	In order to managed the venues within the platform
	As an admin
	I want to list the available venues
	
Background: 
	Given I am logged in as admin
	And exists a venue called "Cafe 7"
	
Scenario: Available venues are listed
	Given I am on the venues page
	Then I can see "Cafe 7" listed