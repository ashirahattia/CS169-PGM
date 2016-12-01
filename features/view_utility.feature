Feature: View Utility Value
  As a TA
  In order to better understand how successful the matching algorithm was
  I want to see a health utility value at the top of the matching

  Scenario: Match groups and projects
    Given I am on the home page
    And I am logged in as a TA
    And I fill in the google settings
    And All data is put into the database
    And I am on the home page
    And I have pressed the Re-Match button
    Then I can see a match_table table
    Then I can see a utility number
