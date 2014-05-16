Feature: HR sees leave requests

  As the human resources person
  I want to see all leave requests
  So that I know what to do

  Scenario: Two employees filed their vacation
    Given there are two employees that filed separate leaves
    And I am signed in as Human Resources
    When I visit the leaves page
    Then I should see two leaves
