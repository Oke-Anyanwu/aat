Feature: Employee grants leave credits

  Background:
    Given I am signed in as an Employee

  @javascript
  Scenario: Employee grants leave credits to himself/herself
    When I click on the dropdown button on the nav bar
    And I click "Update Profile"
    And I click on my Leaves tab
    Then I should not see "Add Credits"

  @javascript
  Scenario: Employee grants leave credits to other employees
    Given there is a human resource
    When I visit the Employees' home page
    Then I should not be able to click on other employees' profile
