Feature: Error Prevention on rematching
  As a TA
  In order to prevent accidentally rematching
  I want to see a warning when I hit the "re-match" button
    
  Scenario: Rematch
    Given I am on the home page
    And I am logged in as a TA
    And All data is put into the database
    And I have pressed the Match button
    And I can see a match_table table
    And I press the Match button again
    Then I should see the warning "Are you sure you want to re-match?"
    
  