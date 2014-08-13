Feature: Admin Registration

  As an administrator
  So that I can keep track of administrative responsiblities
  I want to be able to register other administrators

Scenario: 
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


Scenario: Test Surveys
    Given all the profiles exist
    And the survey metrics table has been populated
    When I am on the sign up page
    And I sign up as "Molly"
    And I answer a majority of the questions
    And I press "Submit"
    Then I should be on the home login page
    When I follow "Logout"

    Given there is an admin
    When I am on the admin login page
    And I fill in "admin_user_email" with "admin@example.com"
    And I fill in "admin_user_password" with "password"
    And I press "Login"
    Then I should be on the admin page
    When I follow "Surveys"
    When I follow "Created At"

    When I follow "Edit"
    When I press "Update Survey"

Scenario: Test Users
    Given all the profiles exist
    And the survey metrics table has been populated
    When I am on the sign up page
    And I sign up as "Molly"
    And I answer a majority of the questions
    And I press "Submit"
    Then I should be on the home login page
    When I follow "Logout"

    Given there is an admin
    When I am on the admin login page
    And I fill in "admin_user_email" with "admin@example.com"
    And I fill in "admin_user_password" with "password"
    And I press "Login"
    Then I should be on the admin page
    When I follow "Users"
    When I follow "Last Name" 

    When I follow "Edit"
    When I press "Update User"

Scenario: Test Admin_Users
    Given all the profiles exist
    And the survey metrics table has been populated
    When I am on the sign up page
    And I sign up as "Molly"
    And I answer a majority of the questions
    And I press "Submit"
    Then I should be on the home login page
    When I follow "Logout"

    Given there is an admin
    When I am on the admin login page
    And I fill in "admin_user_email" with "admin@example.com"
    And I fill in "admin_user_password" with "password"
    And I press "Login"
    Then I should be on the admin page
    When I follow "Admin Users"
    When I follow "Email" 

Scenario: Test Profiles
    Given all the profiles exist
    And the survey metrics table has been populated

    Given there is an admin
    When I am on the admin login page
    And I fill in "admin_user_email" with "admin@example.com"
    And I fill in "admin_user_password" with "password"
    And I press "Login"
    Then I should be on the admin page
    When I follow "Profiles"
    When I follow "Edit" 






