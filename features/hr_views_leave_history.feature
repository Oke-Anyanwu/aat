Feature: HR views leave history

  Background:
    Given I am signed in as Human Resources
    And there is one employee
    And that employee has a pending leave request
    When I click "Leaves"

  Scenario: HR looks at the leave request
    When I click "View"
    Then I should see "filed a leave request"

  Scenario: HR approves the leave request
    When I click "Approve"
    And I click "View"
    Then I should see "changed the status from pending to approved"

  Scenario: HR marks the leave request as taken
    When I click "Approve"
    And I click "Mark leave as taken"
    And I click "View"
    Then I should see "changed the status from approved to taken"

  Scenario: HR rejects the leave request
    When I click "Reject"
    And I click "View"
    Then I should see "changed the status from pending to rejected"
