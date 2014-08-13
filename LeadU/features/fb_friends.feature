Feature: Ability Network with friends on Facebook

  As a Facebook User
  So that I can share my experiences on LEADU
  I want to be able to inivite friends to join LEADU and see what their types are

  Background:
    Given I am a valid user
    And I am on the root page

  Scenario: Non-Facebook login (sad path)
    Given all the profiles exist
    And the survey metrics table has been populated
    When I am on the sign up page
    And I sign up as "Molly"
    And I answer a majority of the questions
    And I press "Submit"
    Then I should be on the home login page
    When I follow "Logout" 
    Then I should be on the home page
    And I should not see "Alex Ramos"
    And I should not see "Jeremy Rios"

  @omniauth_test
  Scenario: See friends list
    Given the survey metrics table has been populated
  	When I am on the root page
    And I fill in "user" with "arramos23@gmail.com"
    And I fill in "pass" with "please"
    And I press "Sign In"
    Then I should be on the home login page
    And I should see "Jeremy Rios"
    And I should see "Molly Nicholas"
    And I should see "Invite"

  @omniauth_test
  Scenario: See friends list and they use LeadU
    Given the survey metrics table has been populated
    When I am on the root page
    And I fill in "user" with "arramos23@gmail.com"
    And I fill in "pass" with "please"
    And I press "Sign In"
    Then I should be on the home login page
    Then I should see "Maxim Bashminov uses LeadU"
    And I should see "Rachel Kanner"
    And I should see "Invite"
    And I should see "ESFP"

