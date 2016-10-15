Feature: Re-Run Matching Algorithm
  As a TA
  In order to see changes to the algorithm
  I want to be able to re-run it on an existing set of matches
    
  Scenario: Re-initiate algorithm from table
    Given I am logged in as a TA
    And I have run the algorithm
    And I can see a table
    Then I should see Re-Run Algorithm
    And I press Re-Run Algorithm
    Then I should see a different table