Feature: Show Google sheet input instructions
  As a TA
  In order to understand what various portions of the app do
  I want to be able to read instructions on each of the action items
    
  Scenario: Show google sheet instructions
    Given I am logged in as a TA
    And I am on the google_fetch page
    Then I should not see google sheet instructions
    And I should see the authorization page