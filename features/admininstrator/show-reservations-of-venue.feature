Feature: The administrator browses the reservations associated to a venue
	In order to managed the reservations of a venue
	As an admin
	I want to list the reservations associated to a venue
	
Background: 
	Given I am logged in as admininistrator
	And exists a venue called "Cafe 7"
	And exists a "scheduled" workshop called "Beer brewing"
	And there is a reservation in "Cafe 7" for a workshop "Beer brewing"
	
Scenario: Reservations are listed for a venue
	Given I am at the venues page 
	When I got to reservations page for "Cafe 7"
	Then I can see "Beer brewing" listed
