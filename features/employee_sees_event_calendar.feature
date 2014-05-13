Feature: Employee sees event calendar

  As an Employee
  I would like to see the event calendar
  So I know who would be buying me lunch

  @javascript
  Scenario: Birthday
    Given I am signed in as an Employee
    And the date is "May 1, 2014"
    And there is a "Birthday" on "May 9, 2014"
    When I visit the Employees' events page
    Then I should see "Birthday" as an event on the calendar

