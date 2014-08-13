Feature: get user survey responses
 
  As a researcher
  So that I can improve the quality of the questions and perform data analytics
  I want to collect individual user questionnaire responses 
 
Background: surveys in database

Scenario: check proper survey response recording
  Given all the profiles exist
  Given the survey metrics table has been populated
  Given that there is a user with the following email: "john@johnson.com"
  When I go to the home page
  And I fill in "user" with "john@johnson.com"
  And I fill in "pass" with "12345"
  And I press "Sign In"
  Then I should be on the survey page
  And I answer a majority of the questions
  And I press "Submit"
  Then the survey for john@johnson.com should have recorded the responses
  
Scenario: check proper survey response recording
  Given all the profiles exist
  Given the survey metrics table has been populated
  Given that there is a user with the following email: "john@johnson.com"
  When I go to the home page
  And I fill in "user" with "john@johnson.com"
  And I fill in "pass" with "12345"
  And I press "Sign In"
  Then I should be on the survey page
  And  I answer a majority of the questions
  And  I press "Submit"
  Then the survey response for user john@johnson.com question JP-10 should be 1
