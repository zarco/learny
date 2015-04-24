Feature: The administrator can list the workshops
	In order to managed the workshops within the platform
	As an admin
	I want to list the available workshops
	
Background: 
	Given I am logged in as admininistrator
	And exists a "proposed" workshop called "Basic Dutch"
	And exists a "scheduled" workshop called "Beer brewing"
	
Scenario: Available workshops are listed
	Given I am on my home page as administrator 
	When I go to the workshops page
	Then I can see "Basic Dutch" listed
	And I can see "Beer brewing" listed

Scenario: Proposed workshops are listed
	Given I am at the workshops page 
	When I go to the "proposed" workshops page
	Then I can see "Basic Dutch" listed
	
Scenario: Scheduled workshops are listed
	Given I am at the workshops page 
	When I go to the "scheduled" workshops page
	Then I can see "Beer brewing" listed
	