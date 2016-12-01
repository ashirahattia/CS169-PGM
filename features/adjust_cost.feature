Feature: Adjust Cost
  As a TA
  In order to have more control over the type of optimal I want the algorithm to output
  I want to be able to manually add in costs for each group preference in form fields
  
  Scenario: Algorithm Information Page
    Given I am logged in as a TA
    And I am on the matches page
    Then I should see information about the algorithm
    And I should see two options for cost values
    And I should see form fields
