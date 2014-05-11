Feature: Employee updates profile

  As an Employee
  I want to update my profile
  So that the company knows how to contact me

  Background: Already signed in
    Given I am signed in as an Employee
    When I click on the dropdown button on the nav bar
    When I click "Update Profile"

  Scenario: Employee sees profile form
    Then I should see my profile page

  Scenario: Employee updates basic information
    When I fill in "First Name" with "John"
    And I fill in "Middle Name" with "Middle"
    And I fill in "Last Name" with "Employee"
    When I press "Save"
    Then I should see "Profile updated."
