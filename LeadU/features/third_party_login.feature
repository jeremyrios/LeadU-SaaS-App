Feature: Ability to login to LEADU via a third party

  As a user
  So that I can take advantage of Single Sign On (SSO)
  I want to be able to login to LEADU with my profile from a third party (i.e Facebook, Google, etc..)

  @omniauth_test
  Scenario: Logging in with Facebook (sad path)
  	Given I am not a valid user
  	And I am on the root page
    And I login with provider "Facebook"
    Then I should be on the signup page
    And I should see "Account could not successfully be created"

  @omniauth_test
  Scenario: Login in with Facebook (success)
  	Given I am a valid user
  	And I am on the root page
  	And I login with provider "Facebook"
  	Then I should be on the survey page

