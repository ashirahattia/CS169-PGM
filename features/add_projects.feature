Feature: Add Projects
  As a TA
  In order to set up the project-group match
  I want to input group preferences
  
  Scenario: Add a new project
    Given I am on the new_project page
    Then I fill in "project" with "Bob's Bakery"
    And I press submit button
    Then a Bob's Bakery project should exist