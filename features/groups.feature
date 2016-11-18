Feature: Deal with Groups Manually
  As a TA
  In order to manually add a group
  I want to input group details and preferences

  Scenario: View current groups without adding any
    Given I am logged in as a TA
    Then I go to groups page
    And I cannot see a match_table table
    And I should see delete_group button

  Scenario: Delete a group
    Given I am logged in as a TA
    And All data is put into the database
    Then I am on the groups page
    And I should see delete_group button
    Then I select the first group
    And I press delete_group button
    Then Group should not have the first group

  Scenario: Forget to check a group to delete
    Given I am logged in as a TA
    Then I am on the groups page
    And I should see delete_group button
    And I cannot see a group_table table
    Then I press delete_group button
    And I should see a warning label