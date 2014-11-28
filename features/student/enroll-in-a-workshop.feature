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
	
Scenario: The student has already enrolled in a workshop
	Given I have already enrolled in the "Prehispanic history" workshop
	When I am at the "Prehispanic history" workshop's page
	Then I do not see the enroll button
	
Scenario: The workshops where the student has enrolled are listed
	Given I have already enrolled in the "Prehispanic history" workshop
	When I go to 'My workshops" page
	Then I can see the "Prehispanic history" workshop in the list
	
#Scenario: The workshop is full
#	Given the "Prehispanic history" workshop is full
#	When I go to "Prehispanic history" workshop
#	Then I do not see the enroll button
#	And I see the message 'The workshop is full'