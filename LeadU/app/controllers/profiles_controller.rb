class ProfilesController < ApplicationController
  
  before_filter :auth_user
=begin 
  def show
    @personality_type = current_user.survey.personality_type
    @video_link = Profile.find_by_personality_type(@personality_type).video_link
    @body = Profile.find_by_personality_type(@personality_type).body
    
    @step_1 = Profile.find_by_personality_type(@personality_type).step_1 #personality type is all caps. e.g. 'ENTP'
    @step_2 = Profile.find_by_personality_type(@personality_type).step_2
    @step_3 = Profile.find_by_personality_type(@personality_type).step_3
    @step_4 = Profile.find_by_personality_type(@personality_type).step_4
    @step_5 = Profile.find_by_personality_type(@personality_type).step_5
    
  end
=end
  
  
  
end
