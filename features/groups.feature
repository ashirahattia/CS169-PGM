Feature: Deal with Groups Manually
  As a TA
  In order to manually add a group
  I want to input group details and preferences

  Scenario: View current groups without adding any
    Given I am logged in as a TA
    Then I go to groups page
    And I cannot see a match_table table
    And I should see delete_group button

#  Scenario: Add a new group with preferences
#    Given I am logged in as a TA
#    Then I am on the groups page
#    And I should see add_group button
#    And I press add_group button
#    Then I should be on the add group form
#    And I input the group information
#    And I set the group preferences
#    And I press submit button
#    Then the new group should exist with my preferences set

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