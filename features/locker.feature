Feature: View Create Locker Page
  As Mrs. Haven
  So that I can add new lockers 
  I want to click the create_locker button
  
  Scenario: Clicking the Create Button
    Given I am on the locker page
    When I click the create button
    Then I should refresh the page 