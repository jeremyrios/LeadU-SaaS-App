Feature: Add columns to analytics
  As a researcher
  So that I can clearly see the way that question accuracy is obtained for each question
  I want to see the total number answered, total positive hits for the given type letter, and total negative hits    
        against the opposite type letter
        
Background:
  Given there is an admin
  Given I am on the admin login page
  And I sign in as an administrator
  Then I should be on the admin page 
  Then I should see "Survey Metrics"

Scenario: Look for total questions answered
  Given the survey metrics table has been populated
  When I follow "Survey Metrics"
  Then I should be on the survey metrics page
  And I should see "Total"

Scenario: Look for questions answered with type
  Given the survey metrics table has been populated
  When I follow "Survey Metrics"
  Then I should be on the survey metrics page
  And I should see "Hits"

Scenario: Survey table not populated (sad path)
  When I follow "Survey Metrics"
  Then I should be on the survey metrics page
  And I should not see "Too objective"

Scenario: No survey metrics (sad path)
  When I follow "Survey Metrics"
  Then I should be on the survey metrics page
  And I should not see "People say"
