Feature: The expert can propose a workshop
	In order to share my knowledge
	As an expert
	I want to propose a workshop through the platform
	
Background: 
	Given I am logged in as expert
	And "Condesa" is a registered zone 

Scenario: Proposing a workshop from the expert's home page
	Given I am at my home page as expert
	When I submit the required information for proposing a workshop called "Basic Dutch" in "Cafe 7" next friday
	Then I can see a confirmation message and the details of the "Basic Dutch" workshop
	And I can see the "Basic Dutch" workshop listed in the "proposed" state in 'My workshops' page
	
Scenario: Proposing a new workshop
	Given I am at the form for proposing a new workshop
	When I submit the required information for proposing a workshop called "Basic Dutch" in "Cafe 7" next friday
	Then I can see the "Basic Dutch" workshop listed in the "proposed" state in 'My workshops' page