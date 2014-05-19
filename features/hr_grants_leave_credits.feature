Feature: HR grants leave credits

  Background:
    Given I am signed in as Human Resources
    And there is one employee
    And I visit the Employees' home page

  @javascript
  Scenario: Grant 1 credit
    When I click on the employee's profile
    Then I should see no leave credits
    When I grant 5 leave credits
    Then I should see 5 leave credits

