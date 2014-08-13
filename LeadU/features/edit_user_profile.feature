Feature: user can create accounts
  As a Leadu user
  So I may refresh my profile
  I want an Edit Profile page
  
Background: Complete a survey
  Given all the profiles exist
  And the survey metrics table has been populated
  Given that there is a user with the following email: "john@johnson.com"
  When I go to the home page
  And I fill in "user" with "john@johnson.com"
  And I fill in "pass" with "12345"
  And I press "Sign In"
  Then I should be on the survey page
  When I answer a majority of the questions
  And I press "Submit"
  Then I should be on the home login page


#Scenario: not logged in (sad path)
#  Given I am on the login page
#  Then I should not be able to go to the Edit User Profile page

Scenario: cannot update password because passwords dont match (sad path)
  When I go to the edit user profile page
  And I fill in "user_password" with "boyz"
  And I fill in "user_password_confirmation" with "2men"
  And I press "Submit"
  Then I should be on the edit user profile page
  And I should see "Account could not successfully be updated because: Password doesn't match confirmation."

Scenario: Successfully change password (happy path)
  When I go to the edit user profile page
  And I fill in "user_password" with "12345"
  And I fill in "user_password_confirmation" with "12345"
  And I press "Submit"
  Then I should be on the home login page
  And I should see "User was successfully updated"

Scenario: change email address
  When I go to the edit user profile page
  And I fill in "user_email" with "bill@billson.com"
  And I press "Submit"
  Then I should be on the home login page
  And I should see "User was successfully updated"
    
Scenario: incorrectly change email (sad path)
  When I go to the edit user profile page
  And I fill in "user_email" with "deeznutz"
  And I press "Submit"
  Then I should be on the edit user profile page
  And I should see "Account could not successfully be updated because: Email is invalid."




  
    
    
