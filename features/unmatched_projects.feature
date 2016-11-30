Feature: Show unmatched projects
  As a TA
  In order to see which projects weren't matched
  I want to be able to see unmatched projects at the bottom of the matching algorithm
    
  Scenario: Show unmatched projects
    Given I am on the home page
    And I am logged in as a TA
    And I fill in the google settings
    And All data is put into the database
    And I am on the home page
    And I have pressed the Re-Match button
    Then I can see all unmatched projects