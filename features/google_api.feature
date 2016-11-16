Feature: Fetch Data From Google Sheet
  As a TA
  In order to fetch group or project data
  I want to push a button and get all of it from a google sheet

  Scenario: Fetch Group Data
    Given I have logged in
    Given I am on the google_fetch page
    Then I should see fetch_group_data button
    And I press fetch_group_data button
    Then I should see a warning label
    Then I login to Google
    Then Group should not be empty
    And all Groups should have preferences
  
  Scenario: Fetch Project Data
    Given I have logged in
    Given I am on the google_fetch page
    Then I should see fetch_project_data button
    And I press fetch_project_data button
    Then I should see a warning label
    Then I login to Google
    And I press fetch_project_data button
    Then I should see "Successfully Imported"
    Then Project should not be empty
    And all Projects should have names