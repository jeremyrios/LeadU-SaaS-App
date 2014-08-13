Feature: Create a blank survey when the user enters their type

	As a developer
	If a user enters their personality_type instead of taking the survey
	Then they should have a blank survey associated with their user model

Background:
	Given the survey metrics table has been populated
    Given all the profiles exist
    Given I am on the signup page
    When I sign up as "Molly"
    Then I should see "If you already know your type"
    And I should see "answer the following questions"

Scenario: Should have a blank survey when you enter type without taking survey (happy path)
	When I fill in "entered_type" with "ESTJ"
    And I press "Enter"
    Then I should be on the home login page

Scenario: Enter incorrect type (sad path)
	When I fill in "entered_type" with "XXXX"
    And I press "Enter"
    Then I should see "That is not a correct personality type"
    And I should be on the survey page


