Feature: See Survey Metrics
 
   As a LEADU administrator
   I want to be able to view a page that displays correlation 
     metrics for each question and its potential binary type.
   So that I can visually gauge the accuracy of my questions.
  
 
Scenario: Look for a Survey Metrics link
  Given there is an admin
  Given I am on the admin login page
  And I sign in as an administrator
  Then I should be on the admin page 
  Then I should see "Survey Metrics"
  
Scenario: Forgot to populate admin table (sad path)
  Given I am on the admin login page
  And I sign in as an administrator
  Then I should be on the admin login page 
  Then I should not see "Survey Metrics"
  
Scenario: Go to the Survey Stats Page
  Given the survey metrics table has been populated
  Given there is an admin
  Given I am on the admin login page
  And I sign in as an administrator
  Then I should be on the admin page 
  When I follow "Survey Metrics"
  Then I should be on the survey metrics page
  And I should see "Accuracy"
  And I should see "The question for"
  
Scenario: Check Survey Stats page columns
  Given there is an admin
  Given I am on the admin login page
  And I sign in as an administrator
  Then I should be on the admin page 
  When I follow "Survey Metrics"
  Then I should be on the survey metrics page

Scenario: Survey Stats not populated (sad path)
  Given there is an admin
  Given I am on the admin login page
  And I sign in as an administrator
  Then I should be on the admin page 
  When I follow "Survey Metrics"
  Then I should be on the survey metrics page
  And I should see "Accuracy"
  And I should not see "The question for"
