Feature: Perform Matching
  As a TA
  In order to match groups with projects
  I want to push a button and populate the matches
  
  Scenario: Initiate algorithm
    Given I am on the home page
    And I am logged in as a TA
    Then there is no existing project-group match
    Then I should see Match button

  Scenario: Select Matching Button
    Given I am logged in as a TA
    Given I am on the current_matching page
    And All data is put into the database
    And I press Match button
    Then I am on the current_matching page
    And I should see Re-Match button
  
  Scenario: Re-initiate algorithm from table
    Given I am on the home page
    And I am logged in as a TA
    And All data is put into the database
    And I have pressed the Match button
    Then I should be on the current_matching page
    And I can see a match_table table
    Then I should see Re-Match button
    And I have pressed the Re-Match button
    Then I should be on the current_matching page