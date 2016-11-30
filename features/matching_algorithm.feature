Feature: Perform Matching
  As a TA
  In order to match groups with projects
  I want to push a button and populate the matches

  Scenario: Select Matching Button
    Given I am logged in as a TA
    Given I am on the matches page
    And I fill in the google settings
    And All data is put into the database
    And I am on the home page
    And I press Re-Match button
    Then I am on the matches page
    And I should see Re-Match button
  
  Scenario: Re-initiate algorithm from table
    Given I am on the matches page
    And I am logged in as a TA
    And I fill in the google settings
    And All data is put into the database
    And I am on the home page
    And I have pressed the Re-Match button
    Then I should be on the matches page
    And I can see a match_table table
    Then I should see Re-Match button
    And I have pressed the Re-Match button
    Then I should be on the matches page