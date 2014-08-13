Feature: display result of personality type with a respective detailed description

	As a student/employee
	So that I can learn more about myself
	I want to read a detailed description of my personality type

Background:
  Given all the profiles exist
  And the survey metrics table has been populated
  When I am on the sign up page
  And I sign up as "Molly"
  And I answer a majority of the questions
  And I press "Submit"
  Then I should be on the home login page
  When I follow "Logout" 
  Then I should be on the home page

  Scenario: log back in and see personality type 
    Given I go to the root page
    And I log in as "Molly"
    Then I should be on the home login page
	  And I should see "Welcome Molly"
	  And I should see "Your personality type is:"

	
