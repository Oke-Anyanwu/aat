Feature: HR marks leave request as taken

  Background:
    Given I am signed in as Human Resources
    And there is one employee
    And that employee has an approved leave request

  @javascript
  Scenario: Mark leave request as taken
    When I visit the Leaves page
    Then I should see an approved leave
    When I mark the leave as taken
    Then I should see the approved leave as taken
