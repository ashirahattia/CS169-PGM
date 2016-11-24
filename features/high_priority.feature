Feature: Match high priority projects
  As a TA
  In order to ensure that loyal customers' projects get matched
  I want to match them separately from the main preference-based matching algorithm

  Scenario: Match high priority project
    Given I am logged in as a TA
    And All data is put into the database
    And I have pressed the Match button
    Then I can see a match_table table
    And high priority projects should not be in the unmatched projects
  
  Scenario: High priority project could not be matched (ex. more high priority projects than groups)
    Given I am logged in as a TA
    And All data is put into the database
    And I have pressed the Match button
    And I can see a match_table table
    And there are unmatched high priority projects
    Then I should see a warning message that these projects could not be matched