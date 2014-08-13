Feature: Access user questionnaire responses

  As an administrator
  So that I can improve the quality of the questions
  I want to collect individual responses to questionnaires

Background:
  Given the following user exists
  | first_name        | last_name   | email           | password  | password_confirmation |
  | John              | Smith       | john@smith.com  | 123456    | 123456                |
  And the following survey exists
  | personality_type  | user_id     | ei | tf | sn | jp |
  | "ENTP"            | 1           | 1  | 1  | -1 | -1 |
  And the user with email "john@smith.com" has personality type "ENTP"

  Scenario: Admin seeing existing surveys
    Given there is an admin
    When I am on the admin login page
    And I fill in "admin_user_email" with "admin@example.com"
    And I fill in "admin_user_password" with "password"
    And I press "Login"
    Then I should be on the admin page
    When I follow "Surveys"
    When I select "Any" from "User"
    And I press "Filter"
    Then I should see "No Surveys found"

  Scenario: entering wrong type on the survey page (sad path)
    Given all the profiles exist
    When I am on the sign up page
    And I fill in "user_first_name" with "John"
    And I fill in "user_last_name" with "Johnson"
    And I fill in "user_email" with "john@johnson.com"
    And I fill in "user_password" with "12345"
    And I fill in "user_password_confirmation" with "12345"
    And I press "Submit"
    Then I should be on the survey page
    When I fill in "entered_type" with "ISTK"
    And I press "Enter"
    Then I should see "That is not a correct personality type"
    And I should be on the survey page

    

    