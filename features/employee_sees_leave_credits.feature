Feature: Employee sees leave credits

  As an employee
  I would like to see my leave credits
  So that I know how much vacation time I have left

  Background: Already signed in
    Given I am signed in as an Employee

  @javascript
  Scenario: Leave credits shown at the employee's Leaves tab
    Given I have 2 leave credits
    When I click on the dropdown button on the nav bar
    And I click "Update Profile"
    And I click on my Leaves tab
    Then I should see 2 leave credits on my Leaves tab
