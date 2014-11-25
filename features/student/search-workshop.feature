Feature: The student is able to search a workshop
	In order to participate in a workshop
	As an student
	I want to find a workshop
	
Background: 
	Given I am logged in as student
	And there is a workshop called "Prehispanic history"
	
Scenario: Searching a workshop by title
	Given I am at my home page as student
	When I fill in the search workshop field with "prehispanic"
	And I click in the search button
	Then I see the workshop titled "Prehispanic history"