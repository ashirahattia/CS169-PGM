Feature: Group enlisted clients should be matched with those groups
  As a TA
  In order to ensure that groups can bring their own clients
  I want to be able to declare that a customer was brought by a group, assign that customer to that group, and remove that customer and group from the matching algorithm
  
  Scenario: Group enlisted clients should be marked
    Given I am on the home page
    And I am logged in as a TA
    And All data is put into the database
    Then group enlisted projects are marked so in the database

  Scenario: Group enlisted clients should be matched with those groups
    Given I am logged in as a TA
    And All data is put into the database
    And I am on the matches page
    And I press Match button
    Then I should see that group enlisted projects are matched with their groups