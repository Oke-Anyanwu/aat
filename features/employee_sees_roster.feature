Feature: Employee sees roster

  As an Employee
  I would like to see the roster of employees
  To be able to contact my co-worker in case of emergency

  Scenario: Visit the Employee' home page
    Given I am signed in as an Employee
    When I visit the Employees' home page
    Then I should see my contact information
