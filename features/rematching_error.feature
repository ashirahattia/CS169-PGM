Feature: Error Prevention on rematching
  As a TA
  In order to prevent accidentally rematching
  I want to see a warning when I hit the "re-match" button
    
  Scenario: Rematch
    Given I am on the home page
    And I am logged in as a TA
    And I fill in the google settings
    And All data is put into the database
    And I am on the home page
    And I have pressed the Re-Match button
    And I can see a match_table table
    And I press the Match button again
    Then I should see a warning
    
  