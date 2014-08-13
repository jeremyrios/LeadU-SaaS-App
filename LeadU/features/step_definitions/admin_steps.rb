Given /^there is an admin$/ do
  AdminUser.create!(:email => "admin@example.com",
                    :password => "password",
                    :password_confirmation => "password")

end


Then /^the User Model for "(.*)" should have a blank survey attached to it$/ do |name|
 #pending # express the regexp above with the code you wish you had 
  #puts name
  #puts User.all
  user = User.find_by_first_name(name)
  #puts user
  #user = User.find_by_first_name(%Q{#{name}})
  survey = user.survey 
  responses = survey.responses 
  responses.should == nil  
  Survey.last_test_result.should == nil

end

Then /^the User Model for "(.*)" should not have a blank survey attached to it$/ do |name|
  #pending # express the regexp above with the code you wish you had
  #puts name
  #puts User.all
  user = User.find_by_first_name(name)
  #puts user
  #user = User.find_by_first_name(%Q{#{name}})
  user.survey.should_not == nil
end

Then /^the User Model for "(.*)" should not have a filled\-in survey attached to it$/ do |name|
  #pending # express the regexp above with the code you wish you had
  #user = User.find_by_first_name(%Q{#{name}})
  #puts name
  #puts User.all
  user = User.find_by_first_name(name)
  #puts user
  user.survey.should == nil
end


When /^I sign in as an administrator$/ do
  steps %Q{
    When I fill in "admin_user_email" with "admin@example.com"
    And I fill in "admin_user_password" with "password"
    And I press "Login"
  }
end

When /^I create a new user$/ do
  steps %Q{
    When I fill in "user_first_name" with "John"
    And I fill in "user_last_name" with "Smith"
    And I fill in "user_email" with "john@smith.com"
    And I fill in "user_password" with "12345"
    And I fill in "user_password_confirmation" with "12345"
    And I press "Create User"
  }
end

When /^I sign up as "(.*?)"$/ do |name|
#When /^I sign in as "(.*?)"$/ do |arg1|

  steps %Q{
    When I fill in "user_first_name" with "#{name}"
    And I fill in "user_last_name" with "#{name}"
    And I fill in "user_email" with "#{name}@#{name}.#{name}"
    And I fill in "user_password" with "#{name}"
    And I fill in "user_password_confirmation" with "#{name}"
    And I press "Submit"
  }
end

When /^I log in as "(.*?)"$/ do |name|
#When /^I sign in as "(.*?)"$/ do |arg1|

  steps %Q{
    And I fill in "user" with "#{name}@#{name}.#{name}"
    And I fill in "password" with "#{name}"
    And I press "Sign In"
  }
end

When /^user 1 creates a new survey$/ do
  steps %Q{
    When I fill in "survey_ei" with "1"
    And I fill in "survey_ft" with "1"
    And I fill in "survey_ns" with "1"
    And I fill in "survey_jp" with "1"
    And I fill in "survey_personality_type" with "ENTP"
    And I fill in "survey_user_id" with "1"
    And I press "Create Survey"
  }
end

When /^I create a new profile$/ do
  steps %Q{
    When I fill in "profile_step_1" with "step 1"
    And I fill in "profile_step_2" with "step 2"
    And I fill in "profile_step_3" with "step 3"
    And I fill in "profile_step_4" with "step 4"
    And I fill in "profile_step_5" with "step 5"
    And I fill in "profile_body" with "lorem ipsum"
    And I fill in "profile_video_link" with "1"
    And I fill in "profile_personality_type" with "bro"
    And I press "Create Profile"
  }
end

Then /^the survey for (.*) should have recorded the responses$/ do |email|
  responses = User.find_by_email(email).survey.responses
  responses.should_not == nil
  responses.size.should > 0
end

Then /^the survey response for user (.*) question (.*) should be (.*)$/ do |email, elt1, elt2|
  User.find_by_email(email).survey.responses.has_key?(elt1).should == true
  User.find_by_email(email).survey.responses[elt1].should == elt2
end

Then /^the Survey Metrics Model for question (.*) should have measured (.*) total questions$/ do |question, total|
  SurveyMetrics.find_by_name(question).total.should == total.to_i
end

Then /^the Survey Metrics Model for question (.*) should have measured a score of (.*)$/ do |question, score|
  SurveyMetrics.find_by_name(question).hits.should == score.to_i
end

Then /^the Survey Metrics Model for question (.*) should have measured an accuracy of (.*)$/ do |question, accuracy|
  SurveyMetrics.find_by_name(question).accuracy.should == accuracy.to_f
end

Then /^the user type for (.*) should be (.*)$/ do |email, type|
  id = User.find_by_email(email)
  Survey.find_by_user_id(id).personality_type.should == type
end


Given /^the survey metrics table has been populated$/ do
  1.upto(20) do |i| #JP
    some_total = 0
    some_score = 0
    some_name = 'JP-' + i.to_s # + '-J'
    some_question = 'The question for ' + some_name
    SurveyMetrics.create!(:name => some_name, :question => some_question,
                          :total => some_total, :hits => some_score, 
                          :accuracy => some_total == 0 ? 0 : some_score/some_total)

  end

  1.upto(10) do |i| #EI
    some_total = 0
    some_score = 0
    some_name = 'EI-' + i.to_s # + '-E'
    some_question = 'The question for ' + some_name
    SurveyMetrics.create!(:name => some_name, :question => some_question,
                          :total => some_total, :hits => some_score, 
                          :accuracy => some_total == 0 ? 0 : some_score/some_total)
                        
  end

  1.upto(21) do |i| #SN
    some_total = 0
    some_score = 0
    some_name = 'SN-' + i.to_s # + '-S'
    some_question = 'The question for ' + some_name
    SurveyMetrics.create!(:name => some_name, :question => some_question,
                          :total => some_total, :hits => some_score, 
                          :accuracy => some_total == 0 ? 0 : some_score/some_total)
                       
  end

  1.upto(19) do |i| #TF
    some_total = 0
    some_score = 0
    some_name = 'TF-' + i.to_s # + '-T'
    some_question = 'The question for ' + some_name
    SurveyMetrics.create!(:name => some_name, :question => some_question,
                          :total => some_total, :hits => some_score, 
                          :accuracy => some_total == 0 ? 0 : some_score/some_total)
                       
  end

end




