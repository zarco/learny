Feature: The expert can propose a workshop
	In order to share my knowledge
	As an expert
	I want to propose a workshop through the platform
	
Background: 
	Given I am logged in as expert

Scenario: Proposing a workshop from the expert's home page
	Given I am at my home page as expert
	When I click on the button for proposing a new workshop
	Then I go to the form for proposing a new workshop
	
Scenario: Proposing a new workshop
	Given I am at the form for proposing a new workshop
	When I submit the required information for proposing a workshop called "Basic Dutch"
	Then I can see the "Basic Dutch" workshop listed in the "pending" state in 'My workshops' page