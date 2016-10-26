Feature: Add Projects
  As a TA
  In order to set up the project-group match
  I want to input group preferences
  
  Scenario: Add a new project
    Given I am on the projects page
    Then the Add Project button exists
    And I click Add Project
    Then I should be on the Add Project Form
    And I input project information for Bob's Bakery
    And I press submit
    Then a Bob's Bakery project should exist