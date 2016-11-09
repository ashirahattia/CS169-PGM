Feature: Deal with Projects Manually
  As a TA
  In order to manually add a project
  I want to input project details

  Scenario: View current project
    Given I am on the projects page
    Then I can see a project_table table
    And I should see add_project button

  Scenario: Add a new projects
    Given I am on the projects page
    Then I should see add_project button
    And I press add_project button
    Then I should be on the Add Project form
    And I input the project information
    And I press Submit button
    Then a test project should exist