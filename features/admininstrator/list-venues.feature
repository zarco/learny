Feature: The administrator can list the venues
	In order to managed the venues within the platform
	As an admin
	I want to list the available venues
	
Background: 
	Given I am logged in as admininistrator
	And exists a venue called "Cafe 7"
	
Scenario: Available venues are listed
	Given I am on my home page as administrator 
	When I go to the venues page
	Then I can see "Cafe 7" listed