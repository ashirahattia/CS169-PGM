Feature: Re-Run Matching Algorithm
  As a TA
  In order to see changes to the algorithm
  I want to be able to re-run it on an existing set of matches
    
  Scenario: Re-initiate algorithm from table
    Given I am logged in as a TA
    And I have pressed the Match button
    And I can see a table
    Then I should see Match button
    And I have pressed the Match button
    Then I should see a different table