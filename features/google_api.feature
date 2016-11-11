Feature: Fetch Data From Google Sheet
  As a TA
  In order to fetch group or project data
  I want to push a button and get all of it from a google sheet

  Scenario: Fetch Group Data
    Given I am on the fetch_data page
    Then I should see Fetch_Group_Data button
    And I press Fetch_Group_Data button
    Then I should see a warning label
    Then I login to Google
    And I press Fetch_Group_Data button
    Then I should see "Successfully Imported"
    Then Group should not be empty
    And all Groups should have preferences
  
  Scenario: Fetch Project Data
    Given I am on the fetch_data page
    Then I should see Fetch_Project_Data button
    And I press Fetch_Project_Data button
    Then I should see a warning label
    Then I login to Google
    And I press Fetch_Project_Data button
    Then I should see "Successfully Imported"
    Then Project should not be empty
    And all Projects should have names