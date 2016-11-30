Feature: See Results of Algorithm
  As a TA
  In order to know the results of the matching
  I want to be able to see a table view
    
  Scenario: See table
    Given I am on the home page
    And I am logged in as a TA
    And I fill in the google settings
    And All data is put into the database
    And I am on the home page
    And I have pressed the Re-Match button
    Then I can see a match_table table