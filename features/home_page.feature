Feature: Home page

  Scenario: Viewing application's home page
    Given I am not logged in
    When I am on the homepage
    Then I should see the welcome message
