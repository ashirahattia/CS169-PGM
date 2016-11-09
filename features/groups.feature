Feature: Deal with Groups Manually
  As a TA
  In order to manually add a group
  I want to input group details and preferences

  Scenario: View current groups
    Given I am on the groups#show page
    Then I can see a group_table table
    And I should see add_group button

  Scenario: Add a new group with preferences
    Given I am on the groups page
    Then I should see Add_Group button
    And I press Add_Group button
    Then I should be on the Add Group form
    And I input the group information
    And I set the group preferences # This line probably needs to be expanded?
    And I press Submit button
    Then the new group should exist with my preferences set

  Scenario: Delete a group
    Given I am on the groups page
    Then I should see Delete_Group button
    And I can see a group_table table
    Then I press Delete_group button
    And I should see a warning label
    Then I select the first group
    And I press Delete_group button
    Then Group should not have the first group