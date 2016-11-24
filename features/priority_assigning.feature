Feature: High priority projects should be marked in the model
  As a TA
  In order to assure that loyal customers get their projects matched
  I want to be able to flag certain projects are requiring a match

  Scenario: high priority tag is assigned to high priority projects
    Given I am on the home page
    And I am logged in as a TA
    And All data is put into the database
    Then high priority projects are marked so in the database

  Scenario: high priority tag is not assigned to non high priority projects
    Given I am on the home page
    And I am logged in as a TA
    And All data is put into the database
    Then non high priority projects are not marked as high priority in the database