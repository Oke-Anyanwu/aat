Feature: Employee files vacation

  As an Employee
  I would like to file a request
  So that I can use my leave credits

  Background: Already signed in
    Given I am signed in as an Employee
    When I click on the dropdown button on the nav bar
    And I click "Update Profile"

  @javascript
  Scenario: Going on vacation on May 9, 2014
    Given I am on my Leaves tab
    And the date is "May 1, 2014"
    When I file a leave on "May 9, 2014"
    Then I should see "May 9, 2014" on my leave requests
    And Date should be blank
    And Reason should be blank
