Feature: The student is able to enroll in a workshop
	In order to participate in a workshop
	As an student
	I want to enroll in a workshop
	
Background: 
	Given I am logged in as student
	And there is a workshop called "Prehispanic history"
	
Scenario: Enroll in a workshop from workshop's page
	Given I am at the "Prehispanic history" workshop page
	When I click the enroll button
	Then I see a confirmation message of the successful enrollment