Feature: Run Matching Algorithm
  As a TA
  In order to set up group matching for the first time 
  I want to be able to start the matching algorithm
    
  Scenario: Initiate algorithm
    Given I am on the home page
    And I am logged in as a TA
    Then there is no existing project-group match
    Then I should see Match button

  Scenario: Re-initiate algorithm from table
    Given I am on the home page
    And I am logged in as a TA
    And I have pressed the Match button
    Then I should be on the current_matching page
    And I can see a match_group table
    Then I should see Match button
    And I have pressed the Match button
    Then I should see a different table