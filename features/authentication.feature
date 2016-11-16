Feature: Google authentication
  As a TA
  In order to get groups and projects loaded into the app
  I go to the google authentication to load the data

  Scenario: Authenticate google and populate groups
    Given I am logged in as a TA
    Then I go to fetch_data page
    And I see the groups is empty
    Then I press fetch_group_data button
    And I might be on authentication page
    And I see the groups is not empty

  Scenario: Authenticate google and populate projects
    Given I am logged in as a TA
    Then I go to fetch_data page
    And I see the projects is empty
    Then I press fetch_project_data button
    And I see the projects is not empty