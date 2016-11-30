Feature: Fetch Data From Google Sheet
  As a TA
  In order to fetch group or project data
  I want to push a button and get all of it from a google sheet

  Scenario: Fetch Group Data
    Given I have logged in
    Given I am on the google_fetch page
    Then I should see submit button
    And I cannot see a fetch_group_data button
    And I cannot see a fetch_project_data button
