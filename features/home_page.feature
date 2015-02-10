Feature: Home page

  Scenario: Viewing application's home page
    Given I am not logged in
    When I am on the homepage
    Then I should see the welcome message

  Scenario: Looking for a workshop and save my information
  	Given I am not signed in
  	When I type in the search workshop field the workshop name called "(.*?)"
  	Then I send the requiered information to search a workshop in the search button
  	Then I do not see the workshop called "(.*?)"
  	When I fill the information to be notified when a workshop is available
  	Then I send the information to be saved with the 'keep me informed' button
  	Then I see a confirmation message
