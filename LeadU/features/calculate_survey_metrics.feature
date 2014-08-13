Feature: Calculate Survey Metrics
 
  As a LeadU administrator
  I want to have access to the correlation between the user 
    responses to each survey question and their determined type. 
  So that I can gauge the accuracy of each question  
  
Background:  Get to the survey page
  Given all the profiles exist
  And the survey metrics table has been populated
  Given that there is a user with the following email: "john@johnson.com"
  When I go to the home page
  And I fill in "user" with "john@johnson.com"
  And I fill in "pass" with "12345"
  And I press "Sign In"
  Then I should be on the survey page
  
Scenario: Make sure Survey Metrics Model correctly counts total responses
  And I give the first set of canned survey responses
  And I press "Submit"
  Then the Survey Metrics Model for question EI-1 should have measured 1 total questions
  And the Survey Metrics Model for question JP-1 should have measured 1 total questions
  And the Survey Metrics Model for question SN-1 should have measured 1 total questions
  And the Survey Metrics Model for question TF-1 should have measured 1 total questions
  
Scenario: Make sure Survey Metrics Model correctly tallies scores
  And I give the first set of canned survey responses
  And I press "Submit"
  Then the Survey Metrics Model for question EI-1 should have measured a score of 1
  And the Survey Metrics Model for question EI-1 should have measured a score of 1
  And the Survey Metrics Model for question JP-5 should have measured a score of 1
  And the Survey Metrics Model for question JP-5 should have measured a score of 1
  And the Survey Metrics Model for question TF-10 should have measured a score of 1
  And the Survey Metrics Model for question TF-10 should have measured a score of 1
  And the Survey Metrics Model for question SN-6 should have measured a score of 1
  And the Survey Metrics Model for question SN-6 should have measured a score of 1
  
Scenario: Make sure Survey Metrics Model correctly tallies accuracy for one test
  And I give the first set of canned survey responses
  And I press "Submit"
  Then the user type for john@johnson.com should be ESTJ
  Then the Survey Metrics Model for question EI-1 should have measured an accuracy of 1
  And the Survey Metrics Model for question JP-5 should have measured an accuracy of 1
  And the Survey Metrics Model for question TF-10 should have measured an accuracy of 1
  And the Survey Metrics Model for question SN-6 should have measured an accuracy of 1
  
Scenario: Check for ESTJ Sad Path (Not all accurate responses)
  And I give the first set of canned survey responses
  And I press "Submit"
  And I follow "Logout"
  Given that there is a user with the following email: "bill@billson.com"
  When I go to the home page
  And I fill in "user" with "bill@billson.com"
  And I fill in "pass" with "12345"
  And I press "Sign In"
  Then I should be on the survey page
  And I give the second set of canned survey responses
  And I press "Submit"
  Then the user type for bill@billson.com should be ENTJ
  And the Survey Metrics Model for question EI-6 should have measured an accuracy of 0.5
  And the Survey Metrics Model for question EI-1 should have measured an accuracy of 1
  And the Survey Metrics Model for question JP-5 should have measured an accuracy of 0.5
  And the Survey Metrics Model for question TF-10 should have measured an accuracy of 1
  And the Survey Metrics Model for question SN-6 should have measured an accuracy of 0.5
  
Scenario: Check for INFP Sad Path (Not all accurate responses)
  And I give the third set of canned survey responses
  And I press "Submit"
  And I follow "Logout"
  Given that there is a user with the following email: "bill@billson.com"
  When I go to the home page
  And I fill in "user" with "bill@billson.com"
  And I fill in "pass" with "12345"
  And I press "Sign In"
  Then I should be on the survey page
  And I give the second set of canned survey responses
  And I press "Submit"
  Then the Survey Metrics Model for question EI-6 should have measured an accuracy of 0.5
  And the Survey Metrics Model for question EI-1 should have measured an accuracy of 1
  And the Survey Metrics Model for question JP-5 should have measured an accuracy of 0.5
  And the Survey Metrics Model for question TF-10 should have measured an accuracy of 1
  And the Survey Metrics Model for question SN-6 should have measured an accuracy of 0.5
  

