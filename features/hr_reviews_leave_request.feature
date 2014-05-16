Feature: HR reviews leave request

  Background:
    Given I am signed in as Human Resources

  Scenario: Approve
    Given there is a pending leave request
    When I visit the leaves page
    And I click on Approve
    Then the leave request should be marked as approved

  Scenario: Reject
    Given there is a pending leave request
    When I visit the leaves page
    And I click on Reject
    Then the leave request should be marked as rejected
