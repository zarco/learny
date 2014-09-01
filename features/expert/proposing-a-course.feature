Feature: The expert can propose a course
	In order to share my knowledge
	As an expert
	I want to propose a course through the platform
	
Background: 
	Given I am logged in as expert

Scenario: Reaching the form for propose a course from the expert's home page
	Given I am at my home page as expert
	When I click on the button for proposing a new course
	Then I go to the form for proposing a new course
	
Scenario: Proposing a new course
	Given I am at the form for proposing a new course
	When I submit the required information for proposing a course called "Basic Dutch"
	Then I can see the "Basic Dutch" course listed in the "pending" state in 'My courses' page