Feature: Password Recovery

  As a LEADU user
  I want to be able to recover my password
  So that I can login if I forget my password

  Scenario: Password Recovery and not a user (sad path)
  	When I am on the root page
  	And I follow "Forgot your password?"
  	Then I should be on the new_password_reset page
  	And I should see "To Reset Password"
  	When I fill in "email" with "joey@home.com"
  	And I press "Reset Password"
  	Then I should be on the root page
  	And I should see "User does not exist."

  Scenario: Password Recovery, User should exist
  	Given all the profiles exist
    When I am on the sign up page
    And I fill in "user_first_name" with "Alex"
    And I fill in "user_last_name" with "Ramos"
    And I fill in "user_email" with "arramos84@gmail.com"
    And I fill in "user_password" with "12345"
    And I fill in "user_password_confirmation" with "12345"
    And I press "Submit"
    Then I should be on the survey page
    When I follow "Logout"
  	Then I should be on the root page 
  	When I follow "Forgot your password?"
  	Then I should be on the new_password_reset page
  	And I should see "To Reset Password"
  	When I fill in "email" with "arramos84@gmail.com"
  	And I press "Reset Password"
  	Then I should be on the root page
  	And I should see "Email sent with password reset instructions"

  Scenario: User exists but passwords do not match (sad path)
  	Given all the profiles exist
    When I am on the sign up page
    And I fill in "user_first_name" with "Alex"
    And I fill in "user_last_name" with "Ramos"
    And I fill in "user_email" with "arramos84@gmail.com"
    And I fill in "user_password" with "12345"
    And I fill in "user_password_confirmation" with "12345"
    And I press "Submit"
    Then I should be on the survey page
    When I follow "Logout"
  	Then I should be on the root page 
  	When I follow "Forgot your password?"
  	Then I should be on the new_password_reset page
  	And I should see "To Reset Password"
  	When I fill in "email" with "arramos84@gmail.com"
  	And I press "Reset Password"
  	Then I should be on the root page
  	And I should see "Email sent with password reset instructions"
  	Then the new user should receive an email confirmation
  	When I fill in "password" with "alexramos"
  	And I fill in "password_confirmation" with "notalexramos"
  	And I press "Update Password"
  	Then I should see "Form is invalid"

  Scenario: Password Recovery, Edit page should allow you to change the password
  	Given all the profiles exist
    When I am on the sign up page
    And I fill in "user_first_name" with "Alex"
    And I fill in "user_last_name" with "Ramos"
    And I fill in "user_email" with "arramos84@gmail.com"
    And I fill in "user_password" with "12345"
    And I fill in "user_password_confirmation" with "12345"
    And I press "Submit"
    Then I should be on the survey page
    When I follow "Logout"
  	Then I should be on the root page 
  	When I follow "Forgot your password?"
  	Then I should be on the new_password_reset page
  	And I should see "To Reset Password"
  	When I fill in "email" with "arramos84@gmail.com"
  	And I press "Reset Password"
  	Then I should be on the root page
  	And I should see "Email sent with password reset instructions"
  	Then the new user should receive an email confirmation
  	When I fill in "password" with "alexramos"
  	And I fill in "password_confirmation" with "alexramos"
  	And I press "Update Password"
  	Then I should be on the root page
  	And I should see "Password has been successfully reset"
  	When I fill in "user" with "arramos84@gmail.com"
  	And I fill in "pass" with "alexramos"
  	And I press "Sign In"
  	Then I should be on the survey page
  