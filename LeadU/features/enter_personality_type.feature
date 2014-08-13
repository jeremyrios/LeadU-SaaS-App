Feature: display result of personality type with detailed description

	As a student/employee
	So that I can learn more about myself
	I want to read a detailed description of my personality type

Background:
    Given all the profiles exist
    Given I am on the signup page
    When I sign up as "Molly"
    Then I should see "If you already know your type"
    And I should see "answer the following questions"

Scenario: See mini-profile page after skipping the survey
    When I fill in "entered_type" with "ESTJ"
    And I press "Enter"
    Then I should see "Welcome Molly"
    And I should see "Your personality type is: ESTJ"
    And I should see "Lorem ipsum"

Scenario: See mini-profile page after skipping the survey 2
    When I fill in "entered_type" with "INFJ"
    And I press "Enter"
    Then I should see "Welcome Molly"
    And I should see "Your personality type is: INFJ"

Scenario: Return to the :survey page after entering an incorrect type
    When I fill in "entered_type" with "INPQ"
    And I press "Enter"
    Then I should see "That is not a correct personality type"

Scenario: Return to the :survey page after not entering a type
    When I press "Enter"
    Then I should see "That is not a correct personality type"


    
