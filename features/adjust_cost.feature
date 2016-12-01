Feature: Adjust Cost
  As a TA
  In order to have more control over the type of optimal I want the algorithm to output
  I want to be able to manually add in costs for each group preference in form fields
  
  Scenario: Algorithm Information Page
    Given I am logged in as a TA
    And I am on the matches page
    Then I should see information about the algorithm
    And I should see three options for cost values
    And I should see form fields
  
  Scenario: Exponential cost values
    Given I am logged in as a TA
    And I am on the matches page
    And I click the exponential cost value button
    Then I should see rank 1 form field default as 1
    And I should see rank 2 form field default as 4
    And I should see rank 3 form field default as 9
    And I should see rank 4 form field default as 16
    And I should see rank 5 form field default as 25
    And I should see rank 6 form field default as 36
    And I should see rank 7 form field default as 49