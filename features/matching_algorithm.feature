Feature: Perform Matching
  As a TA
  In order to match groups with projects
  I want to push a button and populate the matches

  Scenario: Select Matching Button
    Given I am on the current_matching page
    Then I should see Match button
    And I press Match button
    Then I am on the show_current_matching page
    And I should see a Re-Match button

  # Scenario: Select Rematch Button
  #   Given I am on the current_matching page
  #   And I press Match button
  #   Then I am on the show_current_matching page
  #   Then I can see a group_match table
  #   And I should see a Re-Match button
  #   Then I press Re-Match button
  #   Then I should see a different algorithm score

  # Scenario: See Multiple Algorithm Buttons
  #   Given I am on the current_matching page
  #   Then I should see X_Match button
  #   And I should see a Y_Match button
  #   Then I press X_Match button
  #   And I am on the show_current_matching page
  #   And I can see a group_match table
  #   Then I press Y_Match button
  #   And I am on the show_current_matching page
  #   Then I should see a different table